package com.example.flightbookingmanagement.dao.impl;

import com.example.flightbookingmanagement.dto.Transaction_history_dto;
import com.example.flightbookingmanagement.dao.interfaces.ICustomerDAO;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.example.flightbookingmanagement.config.DatabaseConfig.getConnection;

public class CustomerDAOImpl implements ICustomerDAO {


    private static final String TRANSACTION_HISTORY_SQL = "SELECT\n" +
                                                        "    f.departure_location,\n" +
                                                        "    f.arrival_location ,\n" +
                                                        "    t.booking_date,\n" +
                                                        "    t.travel_date,\n" +
                                                        "    f.price ,\n" +
                                                        "    t.status \n" +
                                                        "FROM tickets t\n" +
                                                        "JOIN flights f ON t.flight_id = f.flight_id;";


    public CustomerDAOImpl() {
    }

    public List<Transaction_history_dto> selectTransactionHistory() throws SQLException {
        List<Transaction_history_dto> transaction_histories = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(TRANSACTION_HISTORY_SQL)) {

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String departure_location = rs.getString("departure_location");
                String arrival_location = rs.getString("arrival_location");
                String booking_date = rs.getString("booking_date");
                String travel_date = rs.getString("travel_date");
                String price = rs.getString("price");
                String status = rs.getString("status");

                Transaction_history_dto transaction_history = new Transaction_history_dto(departure_location,arrival_location
                                                                                        ,booking_date,travel_date,price,status);
                transaction_histories.add(transaction_history);
            }
        } catch (SQLException e) {
            throw new SQLException(e);
        }
        return transaction_histories;
    }
}
