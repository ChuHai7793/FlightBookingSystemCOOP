package com.example.flightbookingmanagement.controller;

import com.example.flightbookingmanagement.service.VNPayService;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/payment")
public class PaymentServlet extends HttpServlet {
    private final VNPayService vnPayService = new VNPayService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Lấy ticketId và amount từ request
            int ticketId = Integer.parseInt(request.getParameter("ticketId"));
            int amount = Integer.parseInt(request.getParameter("amount"));

            // Gọi service để tạo URL thanh toán
            String paymentUrl = vnPayService.generatePaymentUrl(ticketId, amount, request);

            // Chuyển hướng sang trang thanh toán VNPay
            response.sendRedirect(paymentUrl);
        } catch (NumberFormatException e) {
            response.getWriter().println("Lỗi: ticketId hoặc amount không hợp lệ!");
        }
    }
}
