//package com.example.flightbookingmanagement.dao.impl;
//
//import com.example.flightbookingmanagement.model.User;
//import com.example.flightbookingmanagement.config.DatabaseConfig;
//import org.mindrot.jbcrypt.BCrypt;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//
//public class UserDAO {
//    private final Connection connection;
//
//    public UserDAO() throws SQLException {
//        this.connection = DatabaseConfig.getConnection();
//    }
//
//    public User validateUser(String phone, String password) {
//        String sql = "SELECT * FROM users WHERE phone = ?";
//        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
//            stmt.setString(1, phone);
//            ResultSet rs = stmt.executeQuery();
//            if (rs.next()) {
//                String hashedPassword = rs.getString("password");
//
//                if (BCrypt.checkpw(password, hashedPassword)) {
//                    return new User(
//                            rs.getInt("user_id"),
//                            rs.getString("phone"),
//                            rs.getString("email"),
//                            rs.getString("full_name"),
//                            rs.getString("role")
//                    );
//                }
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return null;
//    }
//}
