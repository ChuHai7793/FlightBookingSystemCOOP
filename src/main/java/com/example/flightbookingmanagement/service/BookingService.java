package com.example.flightbookingmanagement.service;

import com.example.flightbookingmanagement.config.DatabaseConfig;
import com.example.flightbookingmanagement.dao.impl.CustomerDAOImpl;
import com.example.flightbookingmanagement.dto.SearchedTicketDTO;
import com.example.flightbookingmanagement.model.Seat;
import com.example.flightbookingmanagement.model.Ticket;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.*;

import static com.example.flightbookingmanagement.config.DatabaseConfig.getConnection;

public class BookingService {
    public void bookTicket(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String flight_code = request.getParameter("flightCode");
        int user_id = Integer.parseInt(request.getParameter("userId"));
        int seatNumber = Integer.parseInt(request.getParameter("seat_number"));
        String luggage_weight = request.getParameter("luggage");

        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        int rowsInserted = -1;
        int flightId = -1;
        try {
            connection = DatabaseConfig.getConnection();
            connection.setAutoCommit(false); // Tắt tự động commit

            // 1. Lấy flight_id và departure_date tương ứng flight_code
            stmt = connection.prepareStatement(SQLConstants.SELECT_FLIGHT_ID_TRAVEL_DATE);
            stmt.setString(1, flight_code);
            rs = stmt.executeQuery();

            if (rs.next()) {
                flightId = rs.getInt("flight_id");
                Date travelDate = rs.getDate("departure_date");

                // 2. Kiểm tra ghế trống
                stmt = connection.prepareStatement(SQLConstants.SELECT_AVAILABLE_SEATS);
                stmt.setInt(1, flightId);
                rs = stmt.executeQuery();

                if (rs.next() && rs.getInt("available_seats") > 0) {
                    // 3. Trừ số ghế trống
                    stmt = connection.prepareStatement(SQLConstants.UPDATE_AVAILABLE_SEATS_AFTER_BOOKING);
                    stmt.setInt(1, flightId);
                    stmt.executeUpdate();

                    
                    // 5. Thêm vé vào bảng tickets
                    stmt = connection.prepareStatement(SQLConstants.INSERT_TICKET,Statement.RETURN_GENERATED_KEYS);
                    stmt.setInt(1, user_id);
                    stmt.setInt(2, flightId);
                    stmt.setDate(3, travelDate);
                    stmt.setInt(4, seatNumber);
                    rowsInserted = stmt.executeUpdate();


//                Lấy ID (khóa chính tự động tăng) của bản ghi vừa được chèn vào cơ sở dữ liệu.
                    rs = stmt.getGeneratedKeys();
                    int ticketId = 0;
                    if (rs.next()) {
                        ticketId = rs.getInt(1);


                        // Thêm mới luggage
                        stmt = connection.prepareStatement(SQLConstants.INSERT_LUGGAGE);
                        stmt.setInt(1,ticketId);
                        stmt.setString(2,luggage_weight);
                        stmt.executeUpdate();


                        // Lấy tổng tiền cần thanh toán được tính dựa trên từ bảng flights và luggage
                        stmt = connection.prepareStatement(SQLConstants.GET_TOTAL_PRICE);
                        stmt.setInt(1,ticketId );
                        rs = stmt.executeQuery();
                        if (rs.next()) {
                            int total_price = rs.getInt("total_price");
                            // 6. Thêm giao dịch thanh toán
                            stmt = connection.prepareStatement(SQLConstants.INSERT_PAYMENT);
                            stmt.setInt(1, ticketId);
                            stmt.setInt(2, total_price);
                            stmt.setString(3, "pending");
                            stmt.executeUpdate();
                            // 5. Xác nhận giao dịch
                            connection.commit();
                            String paymentUrl = VNPayService.generatePaymentUrl(ticketId, total_price, request);
                            response.sendRedirect(paymentUrl);
//                            response.getWriter().println("BOOKING SUCCESSFULLY!");
                        }
                    } else {
                        response.getWriter().println("OUT OF SEAT!");
                    }
                }
            }

        } catch (Exception e) {
            try {
                if (connection != null) connection.rollback(); // Hủy giao dịch nếu lỗi
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            response.getWriter().println("ERROR BOOKING TICKET: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (connection != null) connection.setAutoCommit(true); // Bật lại AutoCommit
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void setSeatList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Tạo danh sách ghế
        Map<Integer,Seat> seatMap = new HashMap<>();

        for (int i = 1; i <= 26; i++) { // Ví dụ tạo 10 ghế

            seatMap.put(i,new Seat( i, "available"));
        }

//        List<Seat> seatList = new ArrayList<>();

        String flight_code = request.getParameter("flightCode");
        String airlineName = request.getParameter("airlineName");
        String flight_time = request.getParameter("flightTime");
        String price = request.getParameter("price");

        // Kết nối đến database để lấy danh sách ghế
        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(SQLConstants.SELECT_SEAT_NUM_STATUS_BY_FLIGHT_CODE)) {

            ps.setString(1,flight_code); // Lấy mã chuyến bay từ request
            ResultSet rs = ps.executeQuery();
            String status;
            int seat_number;
            while (rs.next()) {
                seat_number= rs.getInt("seat_number");
                status = rs.getString("status");
                Seat seat = new Seat(seat_number,status);
//                seatList.add(seat);

                if ((seatMap.containsKey(seat_number)&& Objects.equals(status, "booked"))) {
                    seatMap.put(seat_number, new Seat(seat_number,status));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        SearchedTicketDTO chosenSearchedTicket = new SearchedTicketDTO(airlineName, flight_code,  flight_time, price);
        HttpSession session = request.getSession(false);
        session.setAttribute("flightCode",flight_code);
        session.setAttribute("seatMap", seatMap);
        session.setAttribute("chosenSearchedTicket", chosenSearchedTicket);
    }
}

