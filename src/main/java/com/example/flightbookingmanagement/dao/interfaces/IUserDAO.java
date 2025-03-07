package com.example.flightbookingmanagement.dao.interfaces;

import com.example.flightbookingmanagement.dto.UserLoginDTO;
import com.example.flightbookingmanagement.model.User;

public interface IUserDAO {
    UserLoginDTO validateUser(String phone, String password);
    boolean registerUser(User user);
    boolean checkPhoneExists(String phone);
    User getUserById(int userId);
}
