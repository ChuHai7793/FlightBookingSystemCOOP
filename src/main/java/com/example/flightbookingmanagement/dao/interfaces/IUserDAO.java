package com.example.flightbookingmanagement.dao.interfaces;


import com.example.flightbookingmanagement.model.User;

public interface IUserDAO {
    User validateUser(String phone, String password);
    boolean registerUser(User user);
    boolean checkPhoneExists(String phone);


    int getUserIdFromLogin(String phone, String password);
    User getUserById(int userId);
}
