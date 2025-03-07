package com.example.flightbookingmanagement.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/FacebookLoginServlet")
public class FacebookLoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");

        // Xử lý đăng nhập với thông tin lấy từ Facebook
        HttpSession session = request.getSession();
        session.setAttribute("user", name);
        response.sendRedirect("home.jsp");
    }
}
