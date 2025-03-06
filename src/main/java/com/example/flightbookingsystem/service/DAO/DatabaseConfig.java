package com.example.flightbookingsystem.service.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConfig {
    private static final String URL = "jdbc:mysql://yamabiko.proxy.rlwy.net:55044/railway";
    private static final String USER = "root";
    private static final String PASSWORD = "CddapjiqTKKZPLBxnXGhYJTmrpfrsPCG";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Không tìm thấy MySQL Driver!", e);
        }
    }

    public static Connection getConnection() throws SQLException {
        Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
        conn.setAutoCommit(true);
        return conn;
    }
}