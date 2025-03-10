package com.example.flightbookingmanagement.controller;


import com.example.flightbookingmanagement.config.DatabaseConfig;
import com.example.flightbookingmanagement.dao.impl.RegisterDAOImpl;
import com.example.flightbookingmanagement.dao.interfaces.IRegister;
import com.example.flightbookingmanagement.model.User;
import com.example.flightbookingmanagement.service.CustomerService;
import com.example.flightbookingmanagement.service.RegisterService;


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
    private RegisterService RegisterService;

    public void init() {
        RegisterService = new RegisterService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String full_name = request.getParameter("full_name");
        String email = request.getParameter("email");
        String confirmPassword = request.getParameter("confirm_password");


        String message = RegisterService.validateNewUserInfo(email, phone, password, confirmPassword);
        if ( message != null){
            request.setAttribute("registerErrorMessage", message);
//            request.setAttribute("showRegisterModal", true);
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }


        int rowsInserted = 0;
        try {
            rowsInserted = RegisterService.insertNewUserToDataBase(full_name, phone, email, password);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        if (rowsInserted > 0) {

//                    ResultSet generatedKeys = stmt.getGeneratedKeys();
//                    int userId = -1;
//                    if (generatedKeys.next()) {
//                        userId = generatedKeys.getInt(1);
//                    }
//                    User newUser = new User(userId, fullName, phone, email, password);
//                    HttpSession session = request.getSession();
//                    session.setAttribute("currentUser", newUser);
//                    session.setAttribute("successMessage", "Đăng ký thành công! Chào mừng, " + fullName + "!");

//            request.setAttribute("showRegisterModal", true);
            request.setAttribute("registerSuccessMessage", "Đăng ký thành công! Bạn có thể đăng nhập ngay.");
        } else {
            request.setAttribute("registerErrorMessage", "Đăng ký thất bại. Vui lòng thử lại.");
        }

//        request.setAttribute("showRegisterModal", true);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
