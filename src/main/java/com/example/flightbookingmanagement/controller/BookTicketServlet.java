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


        bookingService.bookTicket(request, response);

    }
}
