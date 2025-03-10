package com.example.flightbookingmanagement.dao.impl;

import com.example.flightbookingmanagement.dto.PaymentInfoDTO;
import com.example.flightbookingmanagement.dto.SearchedTicketDTO;
import com.example.flightbookingmanagement.dto.TransactionHistoryDTO;
import com.example.flightbookingmanagement.dao.interfaces.ICustomerDAO;
import com.example.flightbookingmanagement.model.User;


import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import static com.example.flightbookingmanagement.config.DatabaseConfig.getConnection;

public class CustomerDAOImpl implements ICustomerDAO {


    private static final String PAYMENT_INFO_SQL = "SELECT f.flight_code, \n" +
            "f.departure_location,f.arrival_location,\n" +
            "t.booking_date,t.travel_date,f.price \n" +
            "FROM tickets t JOIN flights f ON t.flight_id = f.flight_id \n" +
            "WHERE t.user_id = ?;";

    private static final String TRANSACTION_HISTORY_SQL = "SELECT f.departure_location,\n" +
            " f.arrival_location ,t.booking_date,\n" +
            " t.travel_date,f.price, t.status \n" +
            "FROM tickets t\n" +
            "JOIN flights f ON t.flight_id = f.flight_id \n" +
            "WHERE t.user_id = ?;";

    private static final String FLIGHTS_INFO_SQL = "SELECT\n" +
            "    f.airline ,\n" +
            "    f.flight_code ,\n" +
            " CONCAT(TIME_FORMAT(f.departure_time, '%H:%i'), ' → ', TIME_FORMAT(f.arrival_time, '%H:%i')) AS flight_time," +
            "    f.price \n" +
            "FROM flights f\n" +
            "WHERE\n" +
            "    f.departure_location = ?\n" +
            "    AND f.arrival_location = ?\n" +
            "    AND DATE(f.departure_time) = ?;";


    private static final String UPDATE_USERS_SQL = "UPDATE users SET full_name = ?, birth_date = ?, address = ?, email = ?, phone = ? WHERE user_id = ?";
    private static final String UPDATE_PASSWORD_SQL = "UPDATE users SET password = ? WHERE user_id = ?";



    public CustomerDAOImpl() {
    }

    @Override
    public List<PaymentInfoDTO> selectPaymentInfo(int userId) throws SQLException {
        List<PaymentInfoDTO> payment_infos = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(PAYMENT_INFO_SQL)) {
            preparedStatement.setInt(1, userId);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String flight_code = rs.getString("flight_code");
                String departure_location = rs.getString("departure_location");
                String arrival_location = rs.getString("arrival_location");
                Timestamp booking_date = rs.getTimestamp("booking_date");
                Date travel_date = rs.getDate("travel_date");
                Integer price = rs.getInt("price");

                PaymentInfoDTO payment_info = new PaymentInfoDTO(flight_code, departure_location, arrival_location
                        , booking_date, travel_date, price);
                payment_infos.add(payment_info);
            }
        }
        return payment_infos;
    }

    @Override
    public List<TransactionHistoryDTO> selectTransactionHistory(int userId) throws SQLException {
        List<TransactionHistoryDTO> transaction_histories = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(TRANSACTION_HISTORY_SQL)) {
            preparedStatement.setInt(1, userId);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String departure_location = rs.getString("departure_location");
                String arrival_location = rs.getString("arrival_location");
                String booking_date = rs.getString("booking_date");
                String travel_date = rs.getString("travel_date");
                String price = rs.getString("price");
                String status = rs.getString("status");

                TransactionHistoryDTO transaction_history = new TransactionHistoryDTO(departure_location, arrival_location
                        , booking_date, travel_date, price, status);
                transaction_histories.add(transaction_history);
            }
        }
        return transaction_histories;
    }

    @Override
    public List<SearchedTicketDTO> selectFlightsFromSearchedForm(String departure_location,
                                                                 String arrival_location,
                                                                 String departure_time) throws SQLException {
        List<SearchedTicketDTO> searchedTickets = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(FLIGHTS_INFO_SQL)) {
            preparedStatement.setString(1, departure_location);
            preparedStatement.setString(2, arrival_location);

            // Chuyển đổi từ String sang java.sql.Date
            LocalDate localDate = LocalDate.parse(departure_time); // Nếu departure_time là "2025-03-05"
            preparedStatement.setDate(3, Date.valueOf(localDate)); // Dùng setDate thay vì setString


            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String airlineName = rs.getString("airline");
                String flight_code = rs.getString("flight_code");
                String flight_time = rs.getString("flight_time");
                String price = rs.getString("price");

                SearchedTicketDTO searchedTicket = new SearchedTicketDTO(airlineName, flight_code, flight_time, price);
                searchedTickets.add(searchedTicket);
            }
        }
        return searchedTickets;
    }

    public boolean updateCustomer(User user) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL);) {
            statement.setString(1, user.getFullName());
            statement.setString(2, user.getBirthDate());
            statement.setString(3, user.getAddress());
            statement.setString(4, user.getEmail());
            statement.setString(5, user.getPhone());
            statement.setInt(6, user.getUserId());


            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    public boolean updatePassword(User user,String new_password) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_PASSWORD_SQL);) {
            statement.setString(1,new_password);
            statement.setInt(2,user.getUserId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

}
