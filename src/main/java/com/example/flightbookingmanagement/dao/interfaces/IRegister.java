package com.example.flightbookingmanagement.dao.interfaces;

import com.example.flightbookingmanagement.model.User;

public interface IRegister {
    User registerUser(User user);
    boolean checkPhoneExists(String phone);
    boolean checkEmailExists(String email);

    public default boolean checkPhoneAndEmailExists(String phone, String email) {
        return checkPhoneExists(phone) || checkEmailExists(email);
    }

    public default boolean checkPhoneAndEmailNotExists(String phone, String email) {
        return !checkPhoneExists(phone) && !checkEmailExists(email);
    }

}
