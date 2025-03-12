package com.example.flightbookingmanagement.service;

import com.example.flightbookingmanagement.dao.impl.CustomerDAOImpl;
import com.example.flightbookingmanagement.dto.PaymentInfoDTO;
import com.example.flightbookingmanagement.dto.SearchedTicketDTO;
import com.example.flightbookingmanagement.dto.SearchedTicketFormDTO;
import com.example.flightbookingmanagement.dto.TransactionHistoryDTO;
import com.example.flightbookingmanagement.model.User;
import com.example.flightbookingmanagement.utils.TicketsSorter;
import com.example.flightbookingmanagement.utils.Validate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class CustomerService {
    static private CustomerDAOImpl customerDAO;

    public CustomerService() {
        customerDAO = new CustomerDAOImpl();
    }

    public void showAllTransactionHistories(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        HttpSession session = request.getSession(false);
        // Kiểm tra nếu session tồn tại
        // Lấy user từ session
        User user = (User) session.getAttribute("user");
        List<TransactionHistoryDTO> transaction_histories = customerDAO.selectTransactionHistory(user.getUserId());
        request.setAttribute("transaction_histories", transaction_histories);
        request.getRequestDispatcher("customer/transaction_history.jsp").forward(request, response);
    }

    public void showAllPaymentInfos(HttpServletRequest request,HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        HttpSession session = request.getSession(false);
        // Kiểm tra nếu session tồn tại
        // Lấy user từ session
        User user = (User) session.getAttribute("user");
        List<PaymentInfoDTO> payment_infos = customerDAO.selectPaymentInfo(user.getUserId());
        request.setAttribute("payment_infos", payment_infos);
        request.getRequestDispatcher("customer/payment_info.jsp").forward(request, response);
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

        HttpSession session = request.getSession(false);
        session.setAttribute("SearchedTicketForm", SearchedTicketForm);

    }

    public void selectAllFlightsFromSearchForm(HttpServletRequest request,HttpServletResponse response )
            throws SQLException, IOException, ServletException {
        String departure_location = request.getParameter("departure_location");
        String arrival_location = request.getParameter("arrival_location");
        String departure_time = request.getParameter("leaving_date");
        String orderBy = null;

        List<SearchedTicketDTO> searchedTickets = customerDAO.selectFlightsFromSearchedForm(departure_location,
                arrival_location,departure_time);
        try{
            orderBy = request.getParameter("orderBy");
        } catch (RuntimeException ignored){}

        TicketsSorter.sortSearchedTicketsByOrder(searchedTickets, orderBy);

        HttpSession session = request.getSession(false);
        session.setAttribute("searchedTickets", searchedTickets);

//        request.getRequestDispatcher("customer/oneway_ticket.jsp").forward(request, response);
        response.sendRedirect("customer/oneway_ticket.jsp");
    }

    //--------------------------------------------------------------------------------
    public void jumpToChangePassword(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {

        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/change_password.jsp");
        dispatcher.forward(request, response);
    }

    //-------------------------------------- UPDATE CUSTOMER TO DATABASE ------------------------------------------
    public void updateCustomer(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {

        String name = request.getParameter("name");
        String birth_date = request.getParameter("birth_date");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");


        // Lấy session hiện tại (không tạo mới)
        HttpSession session = request.getSession(false);
        // Kiểm tra nếu session tồn tại
        // Lấy user từ session
        User user = (User) session.getAttribute("user");

        // Update thông tin user
        user.setFullName(name);
        user.setBirthDate(birth_date);
        user.setGender(gender);
        user.setAddress(address);
        user.setEmail(email);
        user.setPhone(phone);
        System.out.println(user);
        customerDAO.updateCustomer(user);
        session.setAttribute("user", user);

        request.setAttribute("userId", user.getUserId());
        request.getRequestDispatcher("customer/info.jsp").forward(request, response);

    }

    public void updatePassword(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String message;
        String current_password = request.getParameter("current_password");
        String new_password = request.getParameter("new_password");
        String confirm_password = request.getParameter("confirm_password");


        // Lấy session hiện tại (không tạo mới)
        HttpSession session = request.getSession(false);
        // Kiểm tra nếu session tồn tại. Lấy user từ session
        User user = (User) session.getAttribute("user");
        String correct_current_password = user.getPassword();

        if (Validate.isValidPassword(current_password,correct_current_password,
                new_password,confirm_password)){
            user.setPassword(new_password);
            customerDAO.updatePassword(user,new_password);
            session.setAttribute("user", user);

            message = "Thông báo: Đổi password thành công!";
        }else {
            message = "Thông báo: mật khẩu hoặc xác nhận mật khẩu mới không chính xác!";
        };
        request.setAttribute("alertMessage", message);
        jumpToChangePassword(request, response);

    }
}
