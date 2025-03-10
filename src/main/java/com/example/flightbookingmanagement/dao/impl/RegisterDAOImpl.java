package com.example.flightbookingmanagement.dao.impl;


import com.example.flightbookingmanagement.config.DatabaseConfig;
import com.example.flightbookingmanagement.dao.interfaces.IRegister;
import com.example.flightbookingmanagement.model.User;


import java.sql.*;


public class RegisterDAOImpl implements IRegister {


//    @Override
//    public User getRegisterUser(User user) {
//        String query = "INSERT INTO users (phone, email, full_name, password, role) VALUES (?, ?, ?, ?, ?)";
//        try (Connection connection = DatabaseConfig.getConnection();
//             PreparedStatement stmt = connection.prepareStatement(query)) {
//
//
//            stmt.setString(1, user.getPhone());
//            stmt.setString(2, user.getEmail());
//            stmt.setString(3, user.getFullName());
//            stmt.setString(4, user.getPassword());
//            stmt.setString(5, "customer");
//
//
//            int rowsAffected = stmt.executeUpdate();
//            if (rowsAffected > 0) {
//                System.out.println("Đăng ký thành công: " + user.getPhone());
//                return user;
//            } else {
//                System.out.println("Không thể đăng ký, không có dòng nào được thêm.");
//            }
//        } catch (SQLException e) {
//            System.out.println("Lỗi khi đăng ký user: " + e.getMessage());
//            e.printStackTrace();
//        }
//        return null;
//    }


    @Override
    public boolean isPhoneExisted(String phone) {
        String query = "SELECT COUNT(*) FROM users WHERE phone = ?";
        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, phone);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next() && rs.getInt(1) > 0) {
                    return true; // Số điện thoại đã tồn tại
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    @Override
    public boolean isEmailExisted(String email) {
        String query = "SELECT COUNT(*) FROM users WHERE email = ?";
        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, email);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next() && rs.getInt(1) > 0) {
                    return true; // Email đã tồn tại
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    public int insertNewUserToDataBase(String full_name, String phone,
                                           String email, String password) throws SQLException {
        int rowsInserted = -1;
        try (Connection conn = DatabaseConfig.getConnection()) {
            String sql = "INSERT INTO users (full_name, phone, email, password, role) VALUES (?, ?, ?, ?, 'customer')";
            try (PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                stmt.setString(1, full_name);
                stmt.setString(2, phone);
                stmt.setString(3, email);
                stmt.setString(4, password);

                rowsInserted = stmt.executeUpdate();

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return rowsInserted;
    }
}
