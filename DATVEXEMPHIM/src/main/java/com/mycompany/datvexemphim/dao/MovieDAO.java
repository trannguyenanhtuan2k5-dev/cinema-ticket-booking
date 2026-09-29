package com.mycompany.datvexemphim.dao;

import com.mycompany.datvexemphim.model.Movie;
import java.sql.*;
import java.text.Normalizer;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Pattern;

/**
 * Data Access Object for Movies and Genres in MySQL.
 */
public class MovieDAO {

    private static final Logger LOGGER = Logger.getLogger(MovieDAO.class.getName());

    /**
     * Get all movies that are currently showing (NOW_SHOWING).
     */
    public List<Movie> getNowShowingMovies() {
        List<Movie> list = new ArrayList<>();
        String sql = "SELECT m.*, GROUP_CONCAT(g.genre_name SEPARATOR ', ') AS genre_list "
                   + "FROM movies m "
                   + "LEFT JOIN movie_genres mg ON m.movie_id = mg.movie_id "
                   + "LEFT JOIN genres g ON mg.genre_id = g.genre_id "
                   + "WHERE m.status = 'NOW_SHOWING' "
                   + "GROUP BY m.movie_id "
                   + "ORDER BY m.rating DESC, m.movie_id DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(extractMovieFromResultSet(rs));
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error fetching now showing movies", e);
        }
        return list;
    }

    /**
     * Get all movies in the database.
     */
    public List<Movie> getAllMovies() {
        List<Movie> list = new ArrayList<>();
        String sql = "SELECT m.*, GROUP_CONCAT(g.genre_name SEPARATOR ', ') AS genre_list "
                   + "FROM movies m "
                   + "LEFT JOIN movie_genres mg ON m.movie_id = mg.movie_id "
                   + "LEFT JOIN genres g ON mg.genre_id = g.genre_id "
                   + "GROUP BY m.movie_id "
                   + "ORDER BY m.movie_id DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(extractMovieFromResultSet(rs));
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error fetching all movies", e);
        }
        return list;
    }

    /**
     * Search movies by title, actors, or description.
     */
    public List<Movie> searchMovies(String keyword) {
        List<Movie> list = new ArrayList<>();
        if (keyword == null || keyword.trim().isEmpty()) {
            return getNowShowingMovies();
        }

        String searchPattern = "%" + keyword.trim() + "%";
        String sql = "SELECT m.*, GROUP_CONCAT(g.genre_name SEPARATOR ', ') AS genre_list "
                   + "FROM movies m "
                   + "LEFT JOIN movie_genres mg ON m.movie_id = mg.movie_id "
                   + "LEFT JOIN genres g ON mg.genre_id = g.genre_id "
                   + "WHERE m.title LIKE ? OR m.actors LIKE ? OR m.director LIKE ? "
                   + "GROUP BY m.movie_id "
                   + "ORDER BY m.rating DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, searchPattern);
            ps.setString(2, searchPattern);
            ps.setString(3, searchPattern);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(extractMovieFromResultSet(rs));
                }
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error searching movies with keyword: " + keyword, e);
        }
        return list;
    }

    /**
     * Get single movie by ID.
     */
    public Movie getMovieById(int movieId) {
        String sql = "SELECT m.*, GROUP_CONCAT(g.genre_name SEPARATOR ', ') AS genre_list "
                   + "FROM movies m "
                   + "LEFT JOIN movie_genres mg ON m.movie_id = mg.movie_id "
                   + "LEFT JOIN genres g ON mg.genre_id = g.genre_id "
                   + "WHERE m.movie_id = ? "
                   + "GROUP BY m.movie_id";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, movieId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return extractMovieFromResultSet(rs);
                }
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error fetching movie by ID: " + movieId, e);
        }
        return null;
    }

    /**
     * Insert or update a movie in MySQL (from External API).
     * @param movie Movie object with details
     * @return generated or existing movie_id, or -1 if failed
     */
    public int saveOrUpdateMovie(Movie movie) {
        if (movie == null || movie.getTitle() == null || movie.getTitle().trim().isEmpty()) {
            return -1;
        }

        if (movie.getSlug() == null || movie.getSlug().trim().isEmpty()) {
            movie.setSlug(toSlug(movie.getTitle()));
        }

        try (Connection conn = DBConnection.getConnection()) {
            int existingId = findMovieIdByTitleOrSlug(conn, movie.getTitle(), movie.getSlug());

            if (existingId > 0) {
                // Update existing movie
                String updateSql = "UPDATE movies SET description = ?, poster_image = ?, banner_image = ?, "
                                 + "duration_minutes = ?, rating = ?, director = ?, actors = ?, "
                                 + "status = ?, age_rating = ? "
                                 + "WHERE movie_id = ?";
                try (PreparedStatement ps = conn.prepareStatement(updateSql)) {
                    ps.setString(1, movie.getDescription());
                    ps.setString(2, movie.getPosterImage());
                    ps.setString(3, movie.getBannerImage());
                    ps.setInt(4, movie.getDurationMinutes());
                    ps.setDouble(5, movie.getRating());
                    ps.setString(6, movie.getDirector());
                    ps.setString(7, movie.getActors());
                    ps.setString(8, movie.getStatus());
                    ps.setString(9, movie.getAgeRating());
                    ps.setInt(10, existingId);
                    ps.executeUpdate();
                }

                syncGenresForMovie(conn, existingId, movie.getGenreNames());
                ensureShowtimesExist(conn, existingId);
                return existingId;
            } else {
                // Insert new movie
                String insertSql = "INSERT INTO movies (title, slug, description, poster_image, banner_image, "
                                 + "duration_minutes, age_rating, release_date, director, actors, language, country, status, rating) "
                                 + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                try (PreparedStatement ps = conn.prepareStatement(insertSql, Statement.RETURN_GENERATED_KEYS)) {
                    ps.setString(1, movie.getTitle());
                    ps.setString(2, movie.getSlug());
                    ps.setString(3, movie.getDescription());
                    ps.setString(4, movie.getPosterImage());
                    ps.setString(5, movie.getBannerImage());
                    ps.setInt(6, movie.getDurationMinutes());
                    ps.setString(7, movie.getAgeRating());

                    if (movie.getReleaseDate() != null && !movie.getReleaseDate().isEmpty()) {
                        ps.setString(8, movie.getReleaseDate());
                    } else {
                        ps.setDate(8, Date.valueOf(LocalDate.now()));
                    }

                    ps.setString(9, movie.getDirector());
                    ps.setString(10, movie.getActors());
                    ps.setString(11, movie.getLanguage());
                    ps.setString(12, movie.getCountry());
                    ps.setString(13, movie.getStatus());
                    ps.setDouble(14, movie.getRating());

                    ps.executeUpdate();

                    try (ResultSet keys = ps.getGeneratedKeys()) {
                        if (keys.next()) {
                            int newId = keys.getInt(1);
                            movie.setMovieId(newId);
                            syncGenresForMovie(conn, newId, movie.getGenreNames());
                            ensureShowtimesExist(conn, newId);
                            return newId;
                        }
                    }
                }
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error saving/updating movie: " + movie.getTitle(), e);
        }
        return -1;
    }

    /**
     * Synchronize genres for a movie into 'genres' and 'movie_genres' tables.
     */
    private void syncGenresForMovie(Connection conn, int movieId, List<String> genreNames) throws SQLException {
        if (genreNames == null || genreNames.isEmpty()) {
            return;
        }

        // Delete existing relations
        try (PreparedStatement ps = conn.prepareStatement("DELETE FROM movie_genres WHERE movie_id = ?")) {
            ps.setInt(1, movieId);
            ps.executeUpdate();
        }

        for (String gName : genreNames) {
            if (gName == null || gName.trim().isEmpty()) continue;
            gName = gName.trim();

            int genreId = -1;
            // Check if genre exists
            try (PreparedStatement ps = conn.prepareStatement("SELECT genre_id FROM genres WHERE genre_name = ?")) {
                ps.setString(1, gName);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        genreId = rs.getInt("genre_id");
                    }
                }
            }

            // Insert genre if not found
            if (genreId == -1) {
                try (PreparedStatement ps = conn.prepareStatement(
                        "INSERT INTO genres (genre_name, description) VALUES (?, ?)", Statement.RETURN_GENERATED_KEYS)) {
                    ps.setString(1, gName);
                    ps.setString(2, "Thể loại " + gName);
                    ps.executeUpdate();
                    try (ResultSet rs = ps.getGeneratedKeys()) {
                        if (rs.next()) {
                            genreId = rs.getInt(1);
                        }
                    }
                }
            }

            // Link movie with genre
            if (genreId != -1) {
                try (PreparedStatement ps = conn.prepareStatement(
                        "INSERT IGNORE INTO movie_genres (movie_id, genre_id) VALUES (?, ?)")) {
                    ps.setInt(1, movieId);
                    ps.setInt(2, genreId);
                    ps.executeUpdate();
                }
            }
        }
    }

    /**
     * Ensure at least one default showtime exists for users to book.
     */
    private void ensureShowtimesExist(Connection conn, int movieId) throws SQLException {
        try (PreparedStatement ps = conn.prepareStatement("SELECT COUNT(*) FROM showtimes WHERE movie_id = ?")) {
            ps.setInt(1, movieId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next() && rs.getInt(1) == 0) {
                    // Create default showtime
                    String insertShowtime = "INSERT INTO showtimes (movie_id, room_id, show_date, start_time, end_time, base_price, status) "
                                          + "VALUES (?, 1, CURDATE(), '19:30:00', '21:30:00', 100000.00, 'OPEN')";
                    try (PreparedStatement insertPs = conn.prepareStatement(insertShowtime)) {
                        insertPs.setInt(1, movieId);
                        insertPs.executeUpdate();
                    }
                }
            }
        }
    }

    private int findMovieIdByTitleOrSlug(Connection conn, String title, String slug) throws SQLException {
        String sql = "SELECT movie_id FROM movies WHERE title = ? OR slug = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, title);
            ps.setString(2, slug);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("movie_id");
                }
            }
        }
        return -1;
    }

    private Movie extractMovieFromResultSet(ResultSet rs) throws SQLException {
        Movie m = new Movie();
        m.setMovieId(rs.getInt("movie_id"));
        m.setTitle(rs.getString("title"));
        m.setSlug(rs.getString("slug"));
        m.setDescription(rs.getString("description"));
        m.setPosterImage(rs.getString("poster_image"));
        m.setBannerImage(rs.getString("banner_image"));
        m.setTrailerUrl(rs.getString("trailer_url"));
        m.setDurationMinutes(rs.getInt("duration_minutes"));
        m.setAgeRating(rs.getString("age_rating"));

        Date releaseDate = rs.getDate("release_date");
        if (releaseDate != null) {
            m.setReleaseDate(releaseDate.toString());
        }

        m.setDirector(rs.getString("director"));
        m.setActors(rs.getString("actors"));
        m.setLanguage(rs.getString("language"));
        m.setCountry(rs.getString("country"));
        m.setStatus(rs.getString("status"));
        m.setRating(rs.getDouble("rating"));

        String genreList = rs.getString("genre_list");
        if (genreList != null && !genreList.isEmpty()) {
            m.setGenreNames(Arrays.asList(genreList.split(",\\s*")));
        }

        return m;
    }

    public static String toSlug(String input) {
        if (input == null) return "";
        String nowhitespace = Pattern.compile("[\\s]").matcher(input).replaceAll("-");
        String normalized = Normalizer.normalize(nowhitespace, Normalizer.Form.NFD);
        String slug = Pattern.compile("[^\\w-]").matcher(normalized).replaceAll("");
        return slug.toLowerCase(Locale.ENGLISH).replaceAll("-+", "-").replaceAll("^-|-$", "");
    }
}
