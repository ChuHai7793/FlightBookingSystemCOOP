package com.example.flightbookingmanagement.controller;

import com.example.flightbookingmanagement.model.User;
import com.example.flightbookingmanagement.service.StaffService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/staff-report")
public class StaffReportServlet extends HttpServlet {
    private StaffService staffService = new StaffService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String date = request.getParameter("date");
        if (date == null || date.isEmpty()) {
            date = "2025-03-15";
        }

        List<User> staffList = staffService.getDailyStaffReport(date);
        request.setAttribute("staffList", staffList);
        request.setAttribute("date", date);
        request.getRequestDispatcher("report.jsp").forward(request, response);
    }
}
