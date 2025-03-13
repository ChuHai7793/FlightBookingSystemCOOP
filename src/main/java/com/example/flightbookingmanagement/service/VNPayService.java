package com.example.flightbookingmanagement.service;

import org.apache.commons.codec.binary.Hex;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.*;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;

public class VNPayService {
    private static final String VNP_TMN_CODE = "7PBSZG9L";
    private static final String VNP_HASH_SECRET = "X55GLPDDIK85CA2IQ8Z29KJ70A1EDHHA";
    private static final String VNP_URL = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
    private static final String RETURN_URL = "http://localhost:8080/payment-result";

    public static String generatePaymentUrl(int ticketId, int amount, HttpServletRequest request) throws UnsupportedEncodingException {
        Map<String, String> params = new HashMap<>();
        params.put("vnp_Version", "2.1.0");
        params.put("vnp_Command", "pay");
        params.put("vnp_TmnCode", VNP_TMN_CODE);
        params.put("vnp_Amount", String.valueOf(amount * 100));
        params.put("vnp_CurrCode", "VND");
        params.put("vnp_TxnRef", String.valueOf(ticketId));
        params.put("vnp_OrderInfo", "Thanh toán vé máy bay #" + ticketId);
        params.put("vnp_OrderType", "billpayment");
        params.put("vnp_Locale", "vn");
        params.put("vnp_ReturnUrl", RETURN_URL);
        params.put("vnp_IpAddr", request.getRemoteAddr());

        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Asia/Ho_Chi_Minh"));
        params.put("vnp_CreateDate", String.format("%tY%<tm%<td%<tH%<tM%<tS", cld));

        List<String> fieldNames = new ArrayList<>(params.keySet());
        Collections.sort(fieldNames);

        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        for (String fieldName : fieldNames) {
            String value = params.get(fieldName);
            if (value != null && !value.isEmpty()) {
                hashData.append(fieldName).append('=').append(URLEncoder.encode(value, String.valueOf(StandardCharsets.US_ASCII))).append('&');
                query.append(fieldName).append('=').append(URLEncoder.encode(value, String.valueOf(StandardCharsets.US_ASCII))).append('&');
            }
        }
        hashData.deleteCharAt(hashData.length() - 1);
        query.deleteCharAt(query.length() - 1);

        String vnp_SecureHash = hmacSHA512(VNP_HASH_SECRET, hashData.toString());
        query.append("&vnp_SecureHash=").append(vnp_SecureHash);

        return VNP_URL + "?" + query.toString();
    }

    public static String hmacSHA512(String key, String data) {
        try {
            Mac mac = Mac.getInstance("HmacSHA512");
            SecretKeySpec secretKey = new SecretKeySpec(key.getBytes(StandardCharsets.UTF_8), "HmacSHA512");
            mac.init(secretKey);
            byte[] hash = mac.doFinal(data.getBytes(StandardCharsets.UTF_8));
            return Hex.encodeHexString(hash).toUpperCase();
        } catch (Exception e) {
            throw new RuntimeException("Error while hashing", e);
        }
    }

    public static boolean validatePayment(Map<String, String> params, String vnp_SecureHash) {
        // Tạo chuỗi để xác thực
        List<String> fieldNames = new ArrayList<>(params.keySet());
        fieldNames.remove("vnp_SecureHash"); // Bỏ tham số SecureHash ra khỏi danh sách xác thực
        Collections.sort(fieldNames);

        StringBuilder hashData = new StringBuilder();
        for (String fieldName : fieldNames) {
            String value = params.get(fieldName);
            if (value != null && !value.isEmpty()) {
                hashData.append(fieldName).append('=').append(value).append('&');
            }
        }
        hashData.deleteCharAt(hashData.length() - 1); // Xóa ký tự `&` cuối cùng

        // Mã hóa chuỗi với HMAC SHA-512
        String calculatedHash = hmacSHA512(VNP_HASH_SECRET, hashData.toString());

        // So sánh hash vừa tính với hash nhận được từ VNPAY
        return calculatedHash.equals(vnp_SecureHash);
    }

}
