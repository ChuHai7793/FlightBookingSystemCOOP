package com.example.flightbookingmanagement.controller;

import com.example.flightbookingmanagement.dao.impl.CustomerDAOImpl;
import com.example.flightbookingmanagement.model.User;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private CustomerDAOImpl customerDAO;

    @Override
    public void init() throws ServletException {
        customerDAO = new CustomerDAOImpl();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = customerDAO.validateUser(email, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            // Chuyển hướng theo vai trò
            if ("Admin".equals(user.getRole())) {
                response.sendRedirect("${pageContext.request.contextPath}/");
            } else if ("Staff".equals(user.getRole())) {
                response.sendRedirect("${pageContext.request.contextPath}/");
            } else {
                response.sendRedirect("${pageContext.request.contextPath}/");
            }
        } else {
            request.setAttribute("errorMessage", "Email hoặc mật khẩu không đúng!");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}
