package com.example.flightbookingsystem.service.DAO;

import java.sql.Connection;
import java.sql.SQLException;

public class TestDatabase {
    public static void main(String[] args) {
        try {
            Connection conn = DatabaseConfig.getConnection();
            if (conn != null) {
                System.out.println("✅ Kết nối MySQL thành công!");
                conn.close();
            }
        } catch (SQLException e) {
            System.out.println("❌ Kết nối thất bại: " + e.getMessage());
        }
    }
}