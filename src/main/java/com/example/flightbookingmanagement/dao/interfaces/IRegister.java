package com.example.flightbookingmanagement.dao.interfaces;


import com.example.flightbookingmanagement.model.User;


public interface IRegister {
//    User getRegisterUser(User user);
    boolean isPhoneExisted(String phone);
    boolean isEmailExisted(String email);

    public default boolean checkPhoneAndEmailExists(String phone, String email) {
        return isPhoneExisted(phone) || isEmailExisted(email);
    }

    public default boolean checkPhoneAndEmailNotExists(String phone, String email) {
        return !isPhoneExisted(phone) && !isEmailExisted(email);
    }


}
