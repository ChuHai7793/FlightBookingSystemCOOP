package com.example.flightbookingmanagement.service;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.*;

public class PaymentReturnService {
    private static final String VNP_HASH_SECRET = "X55GLPDDIK85CA2IQ8Z29KJ70A1EDHHA"; // Thay bằng secret key thực tế

    /**
     * Xác minh chữ ký từ VNPAY
     */
    public boolean verifyPayment(Map<String, String> fields) {
        // Nhận chữ ký từ request
        String vnpSecureHash = fields.get("vnp_SecureHash");

        // Debug toàn bộ dữ liệu nhận được từ VNPAY
        System.out.println("=== DỮ LIỆU NHẬN TỪ VNPAY ===");
        fields.forEach((k, v) -> System.out.println(k + " = " + v));
        System.out.println("============================");

        // Tạo SecureHash từ dữ liệu
        String generatedSecureHash = generateHash(fields);

        // Debug kết quả
        System.out.println("🔹 Received vnp_SecureHash: " + vnpSecureHash);
        System.out.println("🔹 Generated SecureHash: " + generatedSecureHash);
        System.out.println("🔹 Comparison result: " + generatedSecureHash.equalsIgnoreCase(vnpSecureHash));

        // So sánh hai hash
        return generatedSecureHash.equalsIgnoreCase(vnpSecureHash);
    }

    /**
     * Tạo SecureHash từ danh sách tham số
     */
    public String generateHash(Map<String, String> fields) {
        // Tạo bản sao để tránh thay đổi dữ liệu gốc
        Map<String, String> clonedFields = new HashMap<>(fields);

        // Loại bỏ vnp_SecureHash trước khi hash
        clonedFields.remove("vnp_SecureHash");

        // Giải mã OrderInfo nếu cần
        String orderInfo = clonedFields.get("vnp_OrderInfo");
        if (orderInfo != null) {
            try {
                String decodedOrderInfo = URLDecoder.decode(orderInfo, StandardCharsets.UTF_8.name());
                clonedFields.put("vnp_OrderInfo", decodedOrderInfo.trim()); // Trim để loại bỏ khoảng trắng thừa
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }

        // **Sắp xếp tham số theo thứ tự Alphabet**
        List<String> fieldNames = new ArrayList<>(clonedFields.keySet());
        Collections.sort(fieldNames);

        // **Tạo chuỗi dữ liệu để hash**
        StringBuilder hashData = new StringBuilder();
        for (String fieldName : fieldNames) {
            hashData.append(fieldName).append('=').append(clonedFields.get(fieldName)).append('&');
        }
        hashData.deleteCharAt(hashData.length() - 1); // Xóa dấu & cuối cùng

        // **THÊM `VNP_HASH_SECRET` VÀO CUỐI**
        hashData.append("&").append(VNP_HASH_SECRET);

        String finalHashData = hashData.toString();

        // **Tạo mã hash**
        String secureHash = hmacSHA512(VNP_HASH_SECRET, finalHashData);

        // **Debug từng tham số**
        System.out.println("🔹 Fields used for hash:");
        clonedFields.forEach((key, value) -> System.out.println(key + " = " + value));
        System.out.println("🔹 Final Hash Input String: " + finalHashData);
        System.out.println("🔹 Generated SecureHash: " + secureHash);

        return secureHash;
    }

    /**
     * Tạo mã HMAC SHA512
     */
    private static String hmacSHA512(String key, String data) {
        try {
            Mac mac = Mac.getInstance("HmacSHA512");
            SecretKeySpec secretKey = new SecretKeySpec(key.getBytes(StandardCharsets.UTF_8), "HmacSHA512");
            mac.init(secretKey);
            byte[] hash = mac.doFinal(data.getBytes(StandardCharsets.UTF_8));
            StringBuilder hexString = new StringBuilder();
            for (byte b : hash) {
                hexString.append(String.format("%02X", b));
            }
            return hexString.toString();
        } catch (Exception e) {
            throw new RuntimeException("Error while hashing", e);
        }
    }
}