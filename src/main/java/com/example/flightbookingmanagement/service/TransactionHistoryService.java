package com.example.flightbookingmanagement.service;

import com.example.flightbookingmanagement.dao.impl.CustomerDAOImpl;
import com.example.flightbookingmanagement.dto.Transaction_history_dto;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class TransactionHistoryService {

    public TransactionHistoryService() {
    }

    public static void showAllTransactionHistories(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        CustomerDAOImpl customerDAO = new CustomerDAOImpl();
        List<Transaction_history_dto> transaction_histories = customerDAO.selectTransactionHistory();
        request.setAttribute("transaction_histories", transaction_histories);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/transaction_history.jsp");
        dispatcher.forward(request, response);
    }

}
