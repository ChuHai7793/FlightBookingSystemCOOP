package com.example.flightbookingmanagement.utils;

import com.example.flightbookingmanagement.dto.SearchedTicketDTO;

import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

public class FlightsSorter {
    public static void sortSearchedTicketsByOrder(List<SearchedTicketDTO> searchedTickets, String orderBy) {
        if (searchedTickets == null || searchedTickets.isEmpty()||orderBy==null) {
            return ; // Nếu danh sách rỗng, không cần sắp xếp
        }

        switch (orderBy) {
            case "price":
                searchedTickets.sort(Comparator.comparing(ticket -> parsePrice(ticket.getPrice())));
                break;
            case "time":
                searchedTickets.sort(Comparator.comparing(ticket -> parseTime(ticket.getFlight_time())));
                break;
            case "airline":
                searchedTickets.sort(Comparator.comparing(SearchedTicketDTO::getAirlineName));
                break;
            default:
                System.out.println("⚠ Lỗi: Không có tiêu chí sắp xếp hợp lệ!");
                break;
        }
    }

    // Chuyển đổi giá từ String -> int
    private static int parsePrice(String price) {
        try {
            return Integer.parseInt(price.replaceAll("[^0-9]", "")); // Loại bỏ ký tự không phải số
        } catch (NumberFormatException e) {
            return 0; // Nếu lỗi, trả về 0 để tránh lỗi khi so sánh
        }
    }

    // Chuyển đổi giờ từ String -> LocalTime
    private static LocalTime parseTime(String flightTime) {
        try {
            String startTime = flightTime.split(" → ")[0]; // Lấy giờ bắt đầu (trước dấu "→")
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");
            return LocalTime.parse(startTime, formatter);
        } catch (Exception e) {
            return LocalTime.MIN; // Nếu lỗi, trả về 00:00 để tránh lỗi khi so sánh
        }
    }

    // Test thử
    public static void main(String[] args) {
        List<SearchedTicketDTO> tickets = new ArrayList<>();
        tickets.add(new SearchedTicketDTO("Vietnam Airlines", "VN123", "08:00 → 10:00", "500"));
        tickets.add(new SearchedTicketDTO("Bamboo Airways", "QH456", "07:30 → 09:30", "400"));
        tickets.add(new SearchedTicketDTO("VietJet Air", "VJ789", "09:15 → 11:15", "300"));

        System.out.println("🔹 Trước khi sắp xếp:");
        tickets.forEach(System.out::println);

        sortSearchedTicketsByOrder(tickets, "time"); // Sắp xếp theo thời gian bay

        System.out.println("\n🔹 Sau khi sắp xếp theo thời gian:");
        tickets.forEach(System.out::println);
    }
}
