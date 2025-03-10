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
    private static final String LOGIN_QUERY = "SELECT user_id FROM users WHERE phone = ? AND password = ?";

    @Override
    public int getUserIdFromLogin(String phone, String password) {

        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement stmt = connection.prepareStatement(LOGIN_QUERY)) {
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
