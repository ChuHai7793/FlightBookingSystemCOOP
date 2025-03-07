package com.example.flightbookingmanagement.controller;


import com.example.flightbookingmanagement.dto.TransactionHistoryDTO;
import com.example.flightbookingmanagement.dao.impl.CustomerDAOImpl;
import com.example.flightbookingmanagement.service.CustomerService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CustomerService CustomerService;

    public void init() {
        CustomerService = new CustomerService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String departureDate = req.getParameter("leaving_date");
//        System.out.println("leaving_date from request: " + departureDate);
        try {
            CustomerService.updateSearchTicketForm(req);
            CustomerService.selectAllFlightsFromSearchForm(req);
            CustomerService.jumpToOneWayTicket(req, resp);

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

}
