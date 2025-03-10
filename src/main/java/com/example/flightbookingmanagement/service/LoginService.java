package com.example.flightbookingmanagement.service;

import com.example.flightbookingmanagement.config.DatabaseConfig;
import com.example.flightbookingmanagement.dao.impl.CustomerDAOImpl;
import com.example.flightbookingmanagement.dao.impl.UserDAOImpl;
import com.example.flightbookingmanagement.dto.TransactionHistoryDTO;
import com.example.flightbookingmanagement.model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;

public class LoginService {

    static private UserDAOImpl userDAO;

    public LoginService() {
        userDAO = new UserDAOImpl();
    }

    public void validateUser(String phone,String password,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int user_id = userDAO.getUserIdFromLogin(phone, password);
        System.out.println(user_id);
        try {
            User user = userDAO.getUserById(user_id);
            System.out.println(user);
            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                response.sendRedirect("index.jsp");
            } else {
                request.setAttribute("errorMessage", "Người dùng không tồn tại hoặc sai password");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

}
