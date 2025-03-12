package com.example.flightbookingmanagement.dao.interfaces;

import com.example.flightbookingmanagement.model.User;

import java.util.List;

public interface IStaffDAO {
    List<User> getDailyStaffReport(String date);
}
