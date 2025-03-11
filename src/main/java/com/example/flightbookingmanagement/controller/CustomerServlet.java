package com.example.flightbookingmanagement.controller;


import com.example.flightbookingmanagement.dto.TransactionHistoryDTO;
import com.example.flightbookingmanagement.dao.impl.CustomerDAOImpl;
import com.example.flightbookingmanagement.model.User;
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
    private CustomerService customerService;


    public void init() {
        customerService = new CustomerService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        System.out.println(action);
        try {
            switch (action) {
                case "searchTicket":

                    customerService.updateSearchTicketForm(req);
                    customerService.selectAllFlightsFromSearchForm(req);
                    customerService.jumpToOneWayTicket(req, resp);
                    break;

                case "checkTransactionHistory":
                    customerService.showAllTransactionHistories(req);
                    customerService.jumpToTransactionHistory(req, resp);
                    break;

                case "checkPaymentInfo":
                    customerService.showAllPaymentInfos(req);
                    customerService.jumpToPaymentInfos(req, resp);
                    break;

                case "sortByName":

                    break;
                default:

                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        System.out.println(action);
        try {
            switch (action) {
                case "sort":

                    customerService.updateSearchTicketForm(req);
                    customerService.selectAllFlightsFromSearchForm(req);
                    customerService.jumpToOneWayTicket(req, resp);
                    break;
                case "edit":
                    customerService.updateCustomer(req, resp);
                    break;
                case "changePassword":
                    customerService.updatePassword(req, resp);
                    break;

                case "findByCountry":

                    break;
                case "sortByName":

                    break;
                default:

                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

}
