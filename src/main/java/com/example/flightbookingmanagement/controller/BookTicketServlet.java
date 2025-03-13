package com.example.flightbookingmanagement.controller;

import com.example.flightbookingmanagement.config.DatabaseConfig;
import com.example.flightbookingmanagement.service.BookingService;
import com.example.flightbookingmanagement.service.CustomerService;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/bookTicket")
public class BookTicketServlet extends HttpServlet {
    private BookingService bookingService;


    public void init() {
        bookingService = new BookingService();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        System.out.println(action);
        switch (action) {
            case "showBookingModal":
                bookingService.setSeatList(request, response);
                break;

            case "bookTicket":
                bookingService.bookTicket(request, response);
                break;


            case "vx":

                break;
            default:

                break;
        }

    }
}
