package com.example.flightbookingmanagement.controller;

import com.example.flightbookingmanagement.config.DatabaseConfig;
import com.example.flightbookingmanagement.dao.impl.RegisterDAOImpl;
import com.example.flightbookingmanagement.dao.interfaces.IRegister;
import com.example.flightbookingmanagement.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String fullName = request.getParameter("full_name");
        String email = request.getParameter("email");
        String confirmPassword = request.getParameter("confirm_password");

        IRegister registerDao = new RegisterDAOImpl();

        if (!password.equals(confirmPassword)) {
            request.setAttribute("registerErrorMessage", "Mật khẩu xác nhận không đúng!");
            request.setAttribute("showRegisterModal", true);
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }

        if (registerDao.checkPhoneExists(phone)) {
            request.setAttribute("registerErrorMessage", "Số điện thoại đã tồn tại!");
            request.setAttribute("showRegisterModal", true);
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }

        if (registerDao.checkEmailExists(email)) {
            request.setAttribute("registerErrorMessage", "Email đã tồn tại!");
            request.setAttribute("showRegisterModal", true);
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }

        try (Connection conn = DatabaseConfig.getConnection()) {
            String sql = "INSERT INTO users (full_name, phone, email, password, role) VALUES (?, ?, ?, ?, 'customer')";
            try (PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                stmt.setString(1, fullName);
                stmt.setString(2, phone);
                stmt.setString(3, email);
                stmt.setString(4, password);

                int rowsInserted = stmt.executeUpdate();
                if (rowsInserted > 0) {
                    ResultSet generatedKeys = stmt.getGeneratedKeys();
                    int userId = -1;
                    if (generatedKeys.next()) {
                        userId = generatedKeys.getInt(1);
                    }

                    User newUser = new User(userId, fullName, phone, email, password);
                    HttpSession session = request.getSession();
                    session.setAttribute("currentUser", newUser);
                    session.setAttribute("successMessage", "Đăng ký thành công! Chào mừng, " + fullName + "!");

                    request.setAttribute("showRegisterModal", true);
                    request.setAttribute("registerSuccessMessage", "Đăng ký thành công! Bạn có thể đăng nhập ngay.");
                } else {
                    request.setAttribute("registerErrorMessage", "Đăng ký thất bại. Vui lòng thử lại.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("registerErrorMessage", "Lỗi hệ thống: " + e.getMessage());
        }
        request.setAttribute("showRegisterModal", true);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}

