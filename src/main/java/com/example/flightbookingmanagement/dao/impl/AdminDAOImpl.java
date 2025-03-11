package com.example.flightbookingmanagement.dao.impl;

import com.example.flightbookingmanagement.config.DatabaseConfig;
import com.example.flightbookingmanagement.dao.interfaces.IAdminDAO;
import com.example.flightbookingmanagement.model.User;
import com.example.flightbookingmanagement.service.SQLService;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;

import static com.example.flightbookingmanagement.config.DatabaseConfig.getConnection;


public class AdminDAOImpl implements IAdminDAO {

//    private static final String SELECT_ALL_STAFFS_SQL = "SELECT * FROM users WHERE role = 'staff'";
    public AdminDAOImpl() {
    }
    public List<User> getAllStaffs() {
        List<User> staffs = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SQLService.SELECT_ALL_STAFFS_SQL);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                staffs.add(new User(rs.getInt("user_id"),
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
                                    rs.getTimestamp("created_at")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return staffs;
    }

    public boolean updateStaff(User user) throws SQLException {
        boolean rowUpdated;
//        String sql = "UPDATE users SET full_name = ?, birth_date = ?, address = ?, email = ?, phone = ? WHERE user_id = ?";

        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(SQLService.UPDATE_ALL_STAFFS_SQL);) {
            statement.setString(1, user.getFullName());
            statement.setString(2, user.getBirthDate());
            statement.setString(3, user.getAddress());
            statement.setString(4, user.getEmail());
            statement.setString(5, user.getPhone());
            statement.setInt(6, user.getUserId());


            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
}
