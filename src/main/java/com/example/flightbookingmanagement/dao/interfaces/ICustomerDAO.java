package com.example.flightbookingmanagement.dao.interfaces;

import com.example.flightbookingmanagement.model.User;

public interface ICustomerDAO {
    User validateUser(String email, String password);
}
