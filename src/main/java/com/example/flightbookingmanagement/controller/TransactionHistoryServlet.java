package com.example.flightbookingmanagement.controller;


import com.example.flightbookingmanagement.dto.Transaction_history_dto;
import com.example.flightbookingmanagement.dao.impl.CustomerDAOImpl;
import com.example.flightbookingmanagement.service.TransactionHistoryService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = "/transactionHistory")
public class TransactionHistoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CustomerDAOImpl customerDAO;

    public void init() {
        customerDAO = new CustomerDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            TransactionHistoryService.showAllTransactionHistories(req,resp);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void showAllTransactionHistories(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Transaction_history_dto> transaction_histories = customerDAO.selectTransactionHistory();
        request.setAttribute("transaction_histories", transaction_histories);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/transaction_history.jsp");
        dispatcher.forward(request, response);
    }

    private void showAllTransactionHistories1(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
//        List<Transaction_history_dto> transaction_histories = customerDAO.selectTransactionHistory();
//        request.setAttribute("transaction_histories", transaction_histories);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/login.jsp");
        dispatcher.forward(request, response);
    }





}
