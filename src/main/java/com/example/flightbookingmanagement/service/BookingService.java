package com.example.flightbookingmanagement.service;

import com.example.flightbookingmanagement.config.DatabaseConfig;
import com.example.flightbookingmanagement.dao.impl.CustomerDAOImpl;
import com.example.flightbookingmanagement.dto.SearchedTicketDTO;
import com.example.flightbookingmanagement.model.Ticket;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;

import static com.example.flightbookingmanagement.config.DatabaseConfig.getConnection;

public class BookingService {

    public static final String SELECT_FLIGHT_ID_TRAVEL_DATE = "SELECT f.flight_id, DATE(f.departure_time) as departure_date\n" +
            "FROM flights f\n" +
            "WHERE flight_code = ?;";
    public static final String INSERT_PAYMENT="INSERT INTO payments (ticket_id, amount, payment_status)\n " +
                                                "VALUES (?, ?, ?)";

    public static final String INSERT_TICKET ="INSERT INTO tickets (user_id, flight_id, travel_date, seat_number, status)\n " +
            "VALUES (?, ?, ?, ?, 'booked')";

    public void bookTicket(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String flight_code = request.getParameter("flightCode");
        int user_id = Integer.parseInt(request.getParameter("userId"));
        int seatNumber = Integer.parseInt(request.getParameter("seat_number"));
        System.out.println(flight_code);
        System.out.println(user_id);
        System.out.println(seatNumber);
        int price = 2000000; //  giá vé duoc tinh tu bang flight va luggage

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        int rowsInserted = -1;
        int flightId = -1;
        try {
            conn = DatabaseConfig.getConnection();
            conn.setAutoCommit(false); // Tắt tự động commit

            // 1. Lấy flight_id và departure_date tương ứng flight_code
            stmt = conn.prepareStatement(SELECT_FLIGHT_ID_TRAVEL_DATE);
            stmt.setString(1, flight_code);
            rs = stmt.executeQuery();

            if (rs.next()) {
                flightId = rs.getInt("flight_id");
                Date travelDate = rs.getDate("departure_date");

                // 1️⃣ Kiểm tra ghế trống
                stmt = conn.prepareStatement("SELECT available_seats FROM flights WHERE flight_id = ? FOR UPDATE");
                stmt.setInt(1, flightId);
                rs = stmt.executeQuery();

                if (rs.next() && rs.getInt("available_seats") > 0) {
                    // 2️⃣ Trừ số ghế trống
                    stmt = conn.prepareStatement("UPDATE flights SET available_seats = available_seats - 1 WHERE flight_id = ?");
                    stmt.setInt(1, flightId);
                    stmt.executeUpdate();

                    // 3️⃣ Thêm vé vào bảng tickets
                    stmt = conn.prepareStatement(INSERT_TICKET,Statement.RETURN_GENERATED_KEYS);
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
                        // 4️⃣ Thêm giao dịch thanh toán
                        stmt = conn.prepareStatement(INSERT_PAYMENT);
                        stmt.setInt(1, ticketId);
                        stmt.setInt(2, price);
                        stmt.setString(3, "pending");
                        stmt.executeUpdate();
                        // 5️⃣ Xác nhận giao dịch
                        conn.commit();
                        response.getWriter().println("BOOKING SUCCESSFULLY!");
                    } else {
                        response.getWriter().println("OUT OF SEAT!");
                    }
                }
            }

        } catch (Exception e) {
            try {
                if (conn != null) conn.rollback(); // Hủy giao dịch nếu lỗi
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            response.getWriter().println("ERROR BOOKING TICKET: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.setAutoCommit(true); // Bật lại AutoCommit
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
