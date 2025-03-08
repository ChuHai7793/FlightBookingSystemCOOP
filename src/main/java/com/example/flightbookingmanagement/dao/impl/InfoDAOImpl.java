package com.example.flightbookingmanagement.dao.impl;

import com.example.flightbookingmanagement.config.DatabaseConfig;
import com.example.flightbookingmanagement.dao.interfaces.IInfoDAO;
import com.example.flightbookingmanagement.dto.InfoDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class InfoDAOImpl implements IInfoDAO {

    public InfoDTO getUserInfo(int userId) {
        String query = "SELECT * FROM Users WHERE userId = ?";
        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                System.out.println("User found: " + rs.getString("fullName"));
                return new InfoDTO(
                        rs.getInt("userId"),
                        rs.getString("fullName"),
                        rs.getString("birthDate"),
                        rs.getString("gender"),
                        rs.getString("address"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getString("nationalId"),
                        rs.getString("nationality")
                );
            } else {
                System.out.println("No user found for userId: " + userId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    @Override
    public boolean updateUserInfo(InfoDTO userInfo) {
        String query = "UPDATE Users SET fullName=?, birthDate=?, gender=?, address=?, email=?, phone=?, nationalId=?, nationality=? WHERE userId=?";
        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, userInfo.getFullName());
            stmt.setString(2, userInfo.getBirthDate());
            stmt.setString(3, userInfo.getGender());
            stmt.setString(4, userInfo.getAddress());
            stmt.setString(5, userInfo.getEmail());
            stmt.setString(6, userInfo.getPhone());
            stmt.setString(7, userInfo.getNationalId());
            stmt.setString(8, userInfo.getNationality());
            stmt.setInt(9, userInfo.getUserId());

            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
