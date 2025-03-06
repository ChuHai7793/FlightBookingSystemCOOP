package com.example.flightbookingmanagement.service;

import com.example.flightbookingmanagement.dao.impl.CustomerDAOImpl;
import com.example.flightbookingmanagement.dto.SearchedTicketDTO;
import com.example.flightbookingmanagement.dto.SearchedTicketFormDTO;
import com.example.flightbookingmanagement.dto.TransactionHistoryDTO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

public class CustomerService {
    static private CustomerDAOImpl customerDAO;

    public CustomerService() {
        customerDAO = new CustomerDAOImpl();
    }

    public void showAllTransactionHistories(HttpServletRequest request)
            throws SQLException, IOException, ServletException {

        List<TransactionHistoryDTO> transaction_histories = customerDAO.selectTransactionHistory();
        request.setAttribute("transaction_histories", transaction_histories);

    }


    public void updateSearchTicketForm(HttpServletRequest request)
            throws SQLException, IOException, ServletException {

        String ticket_type = request.getParameter("ticket_type");
        String departure_location = request.getParameter("departure_location");
        String arrival_location = request.getParameter("arrival_location");
        String leaving_date = request.getParameter("leaving_date");
        String adult_num = request.getParameter("adult_num");
        String kid_num = request.getParameter("kid_num");
        String baby_num = request.getParameter("baby_num");

        SearchedTicketFormDTO SearchedTicketForm = new SearchedTicketFormDTO(ticket_type,departure_location,arrival_location,
                                                    leaving_date,adult_num,kid_num,baby_num);

        request.setAttribute("SearchedTicketForm", SearchedTicketForm);

    }

    public void selectAllFlightsFromSearchForm(HttpServletRequest request )
            throws SQLException, IOException, ServletException {
        String departure_location = request.getParameter("departure_location");
        String arrival_location = request.getParameter("arrival_location");
        String departure_time = request.getParameter("leaving_date");

//        ĐỔI TỪ ĐỊNH DẠNG '05/03/2025' sang  '2025-03-05' để dùng trong QUERY
//        String new_departure_time = LocalDate.parse(departure_time, DateTimeFormatter.ofPattern("dd/MM/yyyy"))
//                .format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
//        System.out.print(departure_time);

        List<SearchedTicketDTO> searchedTickets = customerDAO.selectFlightsFromSearchedForm(departure_location,
                arrival_location,departure_time);

        request.setAttribute("searchedTickets", searchedTickets);


    }

    public void jumpToOneWayTicket(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/oneway_ticket.jsp");
        dispatcher.forward(request, response);

    }
}
