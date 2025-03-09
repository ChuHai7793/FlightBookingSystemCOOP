package com.example.flightbookingmanagement.dao.interfaces;

import com.example.flightbookingmanagement.dto.PaymentInfoDTO;
import com.example.flightbookingmanagement.dto.SearchedTicketDTO;
import com.example.flightbookingmanagement.dto.TransactionHistoryDTO;
import com.example.flightbookingmanagement.model.User;

import java.sql.SQLException;
import java.util.List;

public interface ICustomerDAO {
    List<TransactionHistoryDTO> selectTransactionHistory(int user_id) throws SQLException;
    List<PaymentInfoDTO> selectPaymentInfo(int userId) throws SQLException;
    List<SearchedTicketDTO> selectFlightsFromSearchedForm(String departure_location,
                                                          String arrival_location,
                                                          String departure_time) throws SQLException;
//    User validateUser(String email, String password);
}
