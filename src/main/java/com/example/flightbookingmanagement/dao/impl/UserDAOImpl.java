package com.example.flightbookingmanagement.dao.impl;

import com.example.flightbookingmanagement.dao.interfaces.IUserDAO;
import com.example.flightbookingmanagement.model.User;
import com.example.flightbookingmanagement.config.DatabaseConfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UserDAOImpl implements IUserDAO {
    private static final Logger LOGGER = Logger.getLogger(UserDAOImpl.class.getName());


    @Override
    public int getUserIdFromLogin(String phone, String password) {
        String sql = "SELECT user_id FROM users WHERE phone = ? AND password = ?";
        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, phone);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getInt("user_id");
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Lỗi validateUser", e);
        }
        return -1;

    }

    @Override
    public boolean registerUser(User user) {
        String sql = "INSERT INTO users (phone, email, full_name, password, role) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, user.getPhone());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getFullName());
            stmt.setString(4, user.getPassword());
            stmt.setString(5, user.getRole());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Lỗi registerUser", e);
        }
        return false;
    }

    @Override
    public User validateUser(String phone, String password) {
        String sql = "SELECT user_id FROM users WHERE phone = ? AND password = ?";
        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, phone);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String storedPassword = rs.getString("password");

                if (password.equals(storedPassword)) {
                    return getUserById(rs.getInt("user_id"));
                } else {
                    throw new IllegalArgumentException("Sai mật khẩu!");
                }
            } else {
                throw new IllegalArgumentException("Số điện thoại không tồn tại!");
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Lỗi validateUser", e);
        }
        return null;
    }

    @Override
    public boolean checkPhoneExists(String phone) {
        String sql = "SELECT 1 FROM users WHERE phone = ?";
        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setString(1, phone);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                System.out.println("Số điện thoại tồn tại trong DB: " + phone);
                return true;
            } else {
                System.out.println("Số điện thoại không tồn tại: " + phone);
                return false;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    @Override
    public User getUserById(int userId) {
        String sql = "SELECT * FROM users WHERE user_id = ?";
        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return new User(
                        rs.getInt("user_id"),
                        rs.getString("role"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("phone"),
                        rs.getString("full_name"),
                        rs.getString("birth_date"),
                        rs.getString("gender"),
                        rs.getString("address"),
                        rs.getString("national_id"),
                        rs.getString("nationality"),
                        rs.getString("membership_level"),
                        rs.getBigDecimal("wallet"),
                        rs.getTimestamp("created_at")
                );
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Lỗi getUserById", e);
        }
        return null;
    }
}
