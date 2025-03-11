package com.example.flightbookingmanagement.controller;

import com.example.flightbookingmanagement.service.LoginService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private LoginService LoginService; // Dùng UserDAOImpl thay vì CustomerDAOImpl

    @Override
    public void init() throws ServletException {
        LoginService = new LoginService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        LoginService.validateAndLogin(phone,password, request,response);

    }
}
