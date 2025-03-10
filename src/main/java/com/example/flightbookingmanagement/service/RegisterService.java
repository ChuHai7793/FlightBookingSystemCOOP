package com.example.flightbookingmanagement.service;

import com.example.flightbookingmanagement.dao.impl.RegisterDAOImpl;
import com.example.flightbookingmanagement.dao.impl.UserDAOImpl;

import java.sql.SQLException;

public class RegisterService {

    static private RegisterDAOImpl registerDAO;

    public RegisterService() {
        registerDAO = new RegisterDAOImpl();
    }

    public String validateNewUserInfo(String email, String phone, String password, String confirmPassword) {
        String message = null;
        if (!password.equals(confirmPassword)) {
            message = "Mật khẩu xác nhận không đúng!";
        }

        if (registerDAO.isPhoneExisted(phone)) {
            message = "Số điện thoại đã tồn tại!";
        }

        if (registerDAO.isEmailExisted(email)) {
            message = "Email đã tồn tại!";
        }

        return message;
    }
    public int insertNewUserToDataBase(String full_name, String phone,
                                       String email, String password) throws SQLException {
        return registerDAO.insertNewUserToDataBase(full_name, phone, email, password);
    }
}
