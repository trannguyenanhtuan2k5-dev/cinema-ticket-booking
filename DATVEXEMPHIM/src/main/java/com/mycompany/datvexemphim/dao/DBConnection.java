package com.mycompany.datvexemphim.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Manages database connection to MySQL database 'datvexemphim'.
 */
public class DBConnection {

    private static final Logger LOGGER = Logger.getLogger(DBConnection.class.getName());

    private static final String HOST = "localhost";
    private static final String PORT = "3306";
    private static final String DB_NAME = "datvexemphim";
    private static final String USER = "root";
    private static final String PASSWORD = ""; // Default XAMPP password is empty

    private static final String JDBC_URL = "jdbc:mysql://" + HOST + ":" + PORT + "/" + DB_NAME
            + "?useUnicode=true&characterEncoding=UTF-8"
            + "&allowPublicKeyRetrieval=true&useSSL=false"
            + "&serverTimezone=Asia/Ho_Chi_Minh";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            LOGGER.info("MySQL JDBC Driver registered successfully.");
        } catch (ClassNotFoundException e) {
            LOGGER.log(Level.SEVERE, "Could not find MySQL JDBC Driver!", e);
        }
    }

    /**
     * Get an active connection to MySQL database.
     * @return Connection object
     * @throws SQLException if connection fails
     */
    public static Connection getConnection() throws SQLException {
        try {
            return DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
        } catch (SQLException ex) {
            // Try with alternate common local passwords if empty fails
            try {
                return DriverManager.getConnection(JDBC_URL, USER, "root");
            } catch (SQLException e2) {
                LOGGER.log(Level.SEVERE, "Failed to connect to MySQL database at " + JDBC_URL, ex);
                throw ex;
            }
        }
    }

    /**
     * Test if database connection is working.
     * @return true if connected successfully
     */
    public static boolean testConnection() {
        try (Connection conn = getConnection()) {
            return conn != null && !conn.isClosed();
        } catch (SQLException e) {
            LOGGER.log(Level.WARNING, "Database connection test failed: " + e.getMessage());
            return false;
        }
    }
}
