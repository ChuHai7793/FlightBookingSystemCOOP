package com.example.flightbookingmanagement.dao.interfaces;


import com.example.flightbookingmanagement.model.User;

public interface IUserDAO {

    int getUserIdFromLogin(String phone, String password);
    User getUserById(int userId);
}
