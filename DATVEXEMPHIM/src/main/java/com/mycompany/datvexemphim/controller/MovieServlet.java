package com.mycompany.datvexemphim.controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.mycompany.datvexemphim.dao.MovieDAO;
import com.mycompany.datvexemphim.model.Movie;
import com.mycompany.datvexemphim.service.MovieApiService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "MovieServlet", urlPatterns = {"/api/movies", "/movies"})
public class MovieServlet extends HttpServlet {

    private MovieDAO movieDAO;
    private MovieApiService apiService;
    private Gson gson;

    @Override
    public void init() throws ServletException {
        super.init();
        this.movieDAO = new MovieDAO();
        this.apiService = new MovieApiService();
        this.gson = new Gson();

        // Check if database needs initial seeding/sync
        List<Movie> existing = movieDAO.getNowShowingMovies();
        if (existing == null || existing.isEmpty()) {
            apiService.syncMoviesFromApi(6);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setHeader("Access-Control-Allow-Origin", "*");

        String action = request.getParameter("action");
        if (action == null || action.trim().isEmpty()) {
            action = "list";
        }

        try (PrintWriter out = response.getWriter()) {
            switch (action) {
                case "sync": {
                    // Trigger External API Sync to MySQL
                    int limit = 8;
                    String limitParam = request.getParameter("limit");
                    if (limitParam != null && !limitParam.isEmpty()) {
                        try {
                            limit = Integer.parseInt(limitParam);
                        } catch (NumberFormatException ignored) {}
                    }

                    int count = apiService.syncMoviesFromApi(limit);
                    JsonObject result = new JsonObject();
                    result.addProperty("status", "success");
                    result.addProperty("message", "Đã đồng bộ thành công " + count + " phim từ API vào cơ sở dữ liệu MySQL!");
                    result.addProperty("synced_count", count);
                    out.print(gson.toJson(result));
                    break;
                }

                case "import": {
                    // Search API & Import specific movie to MySQL
                    String query = request.getParameter("q");
                    List<Movie> imported = apiService.searchAndImportMovies(query);
                    JsonObject result = new JsonObject();
                    result.addProperty("status", "success");
                    result.addProperty("imported_count", imported.size());
                    result.add("movies", gson.toJsonTree(imported));
                    out.print(gson.toJson(result));
                    break;
                }

                case "search": {
                    // Search movies in MySQL
                    String keyword = request.getParameter("q");
                    List<Movie> results = movieDAO.searchMovies(keyword);
                    out.print(gson.toJson(results));
                    break;
                }

                case "detail": {
                    // Get single movie detail from MySQL
                    int id = Integer.parseInt(request.getParameter("id"));
                    Movie movie = movieDAO.getMovieById(id);
                    if (movie != null) {
                        out.print(gson.toJson(movie));
                    } else {
                        JsonObject err = new JsonObject();
                        err.addProperty("status", "error");
                        err.addProperty("message", "Không tìm thấy phim với ID: " + id);
                        out.print(gson.toJson(err));
                    }
                    break;
                }

                case "all": {
                    List<Movie> all = movieDAO.getAllMovies();
                    out.print(gson.toJson(all));
                    break;
                }

                case "list":
                default: {
                    // Get Now Showing movies from MySQL
                    List<Movie> nowShowing = movieDAO.getNowShowingMovies();
                    if (nowShowing.isEmpty()) {
                        // If empty, auto-sync and re-fetch
                        apiService.syncMoviesFromApi(6);
                        nowShowing = movieDAO.getNowShowingMovies();
                    }
                    out.print(gson.toJson(nowShowing));
                    break;
                }
            }
        }
    }
}
