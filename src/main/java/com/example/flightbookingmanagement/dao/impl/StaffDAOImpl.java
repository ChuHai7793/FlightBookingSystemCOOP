//package com.example.flightbookingmanagement.dao.impl;
//
//import com.example.flightbookingmanagement.dao.interfaces.IStaffDAO;
//import com.example.flightbookingmanagement.model.User;
//import com.example.flightbookingmanagement.config.DatabaseConfig;
//import com.example.flightbookingmanagement.service.SQLService;
//
//import java.sql.*;
//import java.util.ArrayList;
//import java.util.List;
//
//public class StaffDAOImpl implements IStaffDAO {
//
//    @Override
//    public List<User> getDailyStaffReport(String date) {
//        List<User> staffList = new ArrayList<>();
//
//        try (Connection conn = DatabaseConfig.getConnection();
//             PreparedStatement stmt = conn.prepareStatement(SQLService.GET_DAYLY_STAFF_REPORT)) {
//
//            stmt.setString(1, date);
//            ResultSet rs = stmt.executeQuery();
//
//            while (rs.next()) {
//                User staff = new User();
//                staff.setUserId(rs.getInt("user_id"));
//                staff.setRole(rs.getString("role"));
//                staff.setEmail(rs.getString("email"));
//                staff.setPhone(rs.getString("phone"));
//                staff.setFullName(rs.getString("full_name"));
//                staff.setBirthDate(rs.getString("birth_date"));
//                staff.setGender(rs.getString("gender"));
//                staff.setAddress(rs.getString("address"));
//                staff.setNationalId(rs.getString("national_id"));
//                staff.setNationality(rs.getString("nationality"));
//                staff.setMembershipLevel(rs.getString("membership_level"));
//                staff.setWallet(rs.getBigDecimal("wallet"));
//                staff.setCreatedAt(rs.getTimestamp("created_at"));
//
//                staffList.add(staff);
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return staffList;
//    }
