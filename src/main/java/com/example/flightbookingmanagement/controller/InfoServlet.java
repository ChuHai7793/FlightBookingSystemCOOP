package com.example.flightbookingmanagement.controller;

import com.example.flightbookingmanagement.dao.interfaces.IInfoDAO;
import com.example.flightbookingmanagement.dao.impl.InfoDAOImpl;
import com.example.flightbookingmanagement.dto.InfoDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/customerInfo")
public class InfoServlet extends HttpServlet {
    private final IInfoDAO infoDAO = new InfoDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int userId = Integer.parseInt(request.getParameter("userId"));
            System.out.println("Received userId: " + userId);

            InfoDTO userInfo = infoDAO.getUserInfo(userId);
            if (userInfo != null) {
                HttpSession session = request.getSession();
                session.setAttribute("userInfo", userInfo);
                System.out.println("User info saved in session: " + session.getAttribute("userInfo"));  // Debugging line
                request.getRequestDispatcher("customer/info.jsp").forward(request, response);
            } else {
                response.sendRedirect("error.jsp");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("error.jsp");
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        String fullName = request.getParameter("fullName");
        String birthDate = request.getParameter("birthDate");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String nationalId = request.getParameter("nationalId");
        String nationality = request.getParameter("nationality");

        InfoDTO updatedUser = new InfoDTO(userId, fullName, birthDate, gender, address, email, phone, nationalId, nationality);

        boolean isUpdated = infoDAO.updateUserInfo(updatedUser);

        if (isUpdated) {
            request.getSession().setAttribute("userInfo", updatedUser);
            response.sendRedirect("customer/info.jsp?userId=" + userId + "&success=true");
        } else {
            response.sendRedirect("customer/info.jsp?userId=" + userId + "&error=true");
        }
    }
}
