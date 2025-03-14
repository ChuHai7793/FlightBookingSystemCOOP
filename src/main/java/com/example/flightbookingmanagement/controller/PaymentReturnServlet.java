package com.example.flightbookingmanagement.controller;

import com.example.flightbookingmanagement.service.PaymentReturnService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/payment-result")
public class PaymentReturnServlet extends HttpServlet {
    private final PaymentReturnService paymentReturnService = new PaymentReturnService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String> fields = new HashMap<>();
        for (Enumeration<String> params = request.getParameterNames(); params.hasMoreElements(); ) {
            String fieldName = params.nextElement();
            String fieldValue = request.getParameter(fieldName);
            if (fieldValue != null && !fieldValue.isEmpty()) {
                fields.put(fieldName, fieldValue);
            }
        }

        // Nhận SecureHash từ VNPAY
        String vnpSecureHash = fields.get("vnp_SecureHash");
        System.out.println("Received vnp_SecureHash: " + vnpSecureHash);

        // Gọi hàm xác minh thanh toán
        boolean isValid = paymentReturnService.verifyPayment(fields);

        if (isValid) {
            response.getWriter().println("✅ Thanh toán thành công!");
        } else {
            response.getWriter().println("❌ Lỗi xác minh thanh toán!");
        }
    }
}