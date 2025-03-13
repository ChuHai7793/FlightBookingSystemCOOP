<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/common/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang cá nhân</title>
    <!-- Bootstrap CSS -->

    <style>
        /* Căn giữa theo chiều dọc */
        .table td, .table th {
            vertical-align: middle;
        }

        /* Style cho container bên phải */
        .sidebar {
            position: sticky;
            top: 20px; /* Khoảng cách từ top khi stick */
            height: fit-content; /* Chiều cao tự điều chỉnh theo nội dung */
            max-height: calc(100vh - 40px); /* Giới hạn chiều cao tối đa */
            overflow-y: auto; /* Cho phép scroll nếu nội dung quá dài */
        }

        .sidebar .card {
            font-size: 14px; /* Giảm kích thước font chữ */
        }

        .sidebar .form-label {
            font-size: 12px; /* Font chữ cho label */
            margin-bottom: 2px;
        }

        .sidebar .form-control,
        .sidebar .form-select {
            font-size: 13px; /* Font chữ cho input/select */
            padding: 4px 6px; /* Giảm padding */
        }

        .sidebar .btn {
            font-size: 14px;
            padding: 8px;
        }

        .table-container {
            height: fit-content;
            max-height: calc(100vh - 150px); /* Chiều cao cố định, bạn có thể điều chỉnh */
            overflow-y: auto; /* Hiển thị thanh cuộn dọc khi nội dung vượt quá */
            border: 10px solid #dee2e6; /* Tùy chọn: thêm viền để khớp với bảng */
            padding: 0; /* Loại bỏ padding nếu không cần thiết */
        }

        .table-container table {
            margin: 0; /* Loại bỏ margin mặc định của table */
            width: 100%; /* Đảm bảo bảng chiếm toàn bộ chiều ngang */
        }
        tr.vna td {
            background-color: #005bac !important;
            color: white !important;
        }
        tr.vietjet td {
            background-color: #ec1c24 !important;
            color: white !important;
        }
        tr.pacific td {
            background-color: #f7941e !important;
            color: black !important;
        }
        tr.default td {
            background-color: white !important;
            color: black !important;
        }

        .seat {
            width: 50px;
            height: 50px;
            text-align: center;
            font-weight: bold;
        }

    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>

<div class="container mt-4">
    <div class="row">
        <div class="col-lg-8">
            <div class="table-container">
                <table class="table table-bordered table-hover">
                    <thead class="table-light">
                    <tr>
                        <th scope="col" class="text-center">Hãng</th>
                        <th scope="col" class="text-center">Mã chuyến bay</th>
                        <th scope="col" class="text-center">Giờ</th>
                        <th scope="col" class="text-center">Giá</th>
                        <th scope="col" class="text-center">Đặt vé</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="searchedTicket" items="${searchedTickets}">
                        <c:choose>
                            <c:when test='${searchedTicket.airlineName eq "Vietnam Airlines"}'>
                                <c:set var="airlineClass" value="vna"/>
                            </c:when>
                            <c:when test='${searchedTicket.airlineName eq "VietJet Air"}'>
                                <c:set var="airlineClass" value="vietjet"/>
                            </c:when>
                            <c:when test='${searchedTicket.airlineName eq "Pacific Airlines"}'>
                                <c:set var="airlineClass" value="pacific"/>
                            </c:when>
                            <c:otherwise>
                                <c:set var="airlineClass" value="default"/>
                            </c:otherwise>
                        </c:choose>
                        <tr class="${airlineClass}">
                            <td class="text-center">${searchedTicket.airlineName}</td>
                            <td class="text-center">${searchedTicket.flight_code}</td>
                            <td class="text-center">${searchedTicket.flight_time}</td>
                            <td class="text-end">
                                $<fmt:setLocale value="vi_VN"/>
                                <fmt:formatNumber value="${searchedTicket.price}" type="currency"/>
                            </td>
                            <td class="text-center">
                                <button type="button" class="btn btn-link p-0"
<%--                                        onclick="saveTicketInfo('${searchedTicket.airlineName}',--%>
<%--                                                '${searchedTicket.flight_code}','${searchedTicket.flight_time}');--%>
<%--                                        showBookingForm();document.getElementById('flightCode').value = '${searchedTicket.flight_code}';"> --%>
                                        onclick="saveAndShowModal('${searchedTicket.flight_code}','${searchedTicket.airlineName}',
                                                '${searchedTicket.flight_time}','${searchedTicket.price}');
                                                document.getElementById('flightCode').value = '${searchedTicket.flight_code}';">
                                    Đặt vé
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

        </div>

        <!-- Container mới bên phải -->
        <div class="col-lg-4">
            <div class="sidebar">
                <div class="card">
                    <div class="card-body p-3"> <!-- Giảm padding card -->
                        <!-- Form tìm kiếm -->
                        <form id="SearchForm" action="../customer" method="GET">
                            <input type="hidden" name="action" value="searchTicket">

                            <!-- Checkbox Sắp xếp -->
                            <div class="mb-3">
                                <h6 class="card-title mb-2" style="font-size: 15px;">Sắp xếp</h6>
                                <select id="sortSelect" class="form-select" aria-label="Sắp xếp" name="orderBy">
                                    <!-- Thêm name để gửi dữ liệu -->
                                    <option value="recommend" selected>Đề xuất</option>
                                    <option value="price">Giá (thấp đến cao)</option>
                                    <option value="time">Thời gian khởi hành</option>
                                    <option value="airline">Hãng hàng không</option>
                                </select>
                            </div>

                            <div class="mb-2">
                                <label for="departure_location" class="form-label">Điểm đi</label>
                                <input type="text" class="form-control" id="departure_location"
                                       name="departure_location" value="${SearchedTicketForm.departure_location}">
                            </div>
                            <div class="mb-2">
                                <label for="arrival_location" class="form-label">Điểm đến</label>
                                <input type="text" class="form-control" id="arrival_location" name="arrival_location"
                                       value="${SearchedTicketForm.arrival_location}">
                            </div>
                            <div class="mb-2">
                                <label for="leaving_date" class="form-label">Ngày đi</label>
                                <input type="date" class="form-control" id="leaving_date" name="leaving_date"
                                       value="${SearchedTicketForm.leaving_date}">
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Tìm kiếm</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Detail Form Pop-up (Modal) -->
<div class="modal fade modal-lg" id="bookingModal" tabindex="-1" aria-labelledby="modalTitle" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalTitle">Chi tiết vé</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Điểm đi và đến -->
                <h5 class="text-center"> ${SearchedTicketForm.departure_location} → ${SearchedTicketForm.arrival_location}</h5>

                <!-- Chia thành 3 phần -->
                <div class="row text-center">
                    <!-- Phần 1: Hà Nội -->
                    <div class="col-md-4">
                        <p><strong>${SearchedTicketForm.departure_location}</strong></p>
                        <p>08:00</p>
                    </div>
                    <!-- Phần 2: HCM -->
                    <div class="col-md-4">
                        <p><strong>${SearchedTicketForm.arrival_location}</strong></p>
                        <p>10:00</p>
                    </div>
                    <!-- Phần 3: Hãng & Chuyến bay -->
                    <div class="col-md-4">
<%--                        <p id ="displayAirlineName"><strong> </strong></p>--%>
<%--                        <p id ="displayFlightCode"></p>--%>
<%--                        <p id ="displayFlightTime"></p>--%>
                        <p ><strong> ${sessionScope.chosenSearchedTicket.airlineName}</strong></p>
                        <p >${sessionScope.chosenSearchedTicket.flight_code}</p>
                        <p >${sessionScope.chosenSearchedTicket.flight_time}</p>

                    </div>
                </div>

                <!-- Bảng thông tin giá vé -->
                <form action="../bookTicket" method="post" accept-charset="UTF-8">
                    <input type="hidden" name="action" value="bookTicket">
                    <input type="hidden" name="userId" value="${user.userId}">
                    <input type="hidden" name="flightCode" id="flightCode" value="${sessionScope.flightCode}">

                    <div class="row">
                        <!-- Cột bên trái -->
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="seat_number" class="form-label">Số ghế</label>
                                <input type="text" class="form-control" id="seat_number" name="seat_number"
                                       placeholder="Chọn số ghế" readonly >
                            </div>
                        </div>

                        <!-- Cột bên phải -->
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="luggage" class="form-label">Hành lý kí gửi</label>

                                <select class="form-select" id="luggage" name="luggage">
                                    <option value="20">20kg</option>
                                    <option value="30">30kg</option>
                                    <option value="50">50kg</option>
                                </select>

                            </div>
                        </div>
                    </div>

                    <!-- Footer Buttons -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                        <input type="submit" class="btn btn-primary" value="Đặt vé">
                    </div>
                </form>

                <!-- Sơ đồ ghế -->
                <h5 class="mt-4">Chọn ghế</h5>
                <div class="seat-map">
                    <div class="d-flex flex-wrap gap-2">
<%--                        <c:forEach var="seat" items="${seatList}">--%>
<%--                            <c:choose>--%>
<%--                                <c:when test="${seat.status == 'booked'}">--%>
<%--                                    <button class="btn btn-danger seat" disabled>${seat.seatNumber}</button>--%>
<%--                                </c:when>--%>
<%--                                <c:otherwise>--%>
<%--                                    <button class="btn btn-outline-primary seat" onclick="selectSeat('${seat.seatNumber}')">${seat.seatNumber}</button>--%>
<%--                                </c:otherwise>--%>
<%--                            </c:choose>--%>
<%--                        </c:forEach>--%>

                        <c:forEach var="seat" items="${seatMap.values()}">
                            <c:choose>
                                <c:when test="${seat.status == 'booked'}">
                                    <button class="btn btn-danger seat seat-booked" disabled>${seat.seatNumber}</button>
                                </c:when>
                                <c:otherwise>
                                    <button class="btn btn-outline-primary seat seat-available" onclick="selectSeat('${seat.seatNumber}')">${seat.seatNumber}</button>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- Bootstrap JS và Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
        integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
        crossorigin="anonymous"></script>

<script>

    window.onload = function() {
        if (sessionStorage.getItem("openModal") === "true") {
            // Xóa trạng thái để tránh mở lại nhiều lần
            sessionStorage.removeItem("openModal");
            // Hiển thị modal
            showBookingModal();
        }
    };

    document.getElementById("sortSelect").addEventListener("change", function () {
        document.getElementById("SearchForm").submit();
    });
    function showBookingModal() {
        var modal = new bootstrap.Modal(document.getElementById('bookingModal'));
        modal.show();
    }

    // function saveTicketInfo(airlineName, flightCode, flightTime) {
    //     // Lấy dữ liệu từ sessionStorage và hiển thị trên trang
    //     document.getElementById("displayAirlineName").innerText = airlineName|| "Không có dữ liệu";
    //     document.getElementById("displayFlightCode").innerText = flightCode || "Không có dữ liệu";
    //     document.getElementById("displayFlightTime").innerText = flightTime || "Không có dữ liệu";
    // }

    function saveAndShowModal(flightCode,airlineName,flightTime,price) {
        // Xóa trước khi đặt lại để tránh lỗi giữ giá trị cũ
        // sessionStorage.removeItem("openModal");
        sessionStorage.setItem("openModal", "true");
        // Gửi dữ liệu lên Servlet
        fetch('/bookTicket', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
            },
            body: 'flightCode=' + encodeURIComponent(flightCode)+
                '&airlineName=' + encodeURIComponent(airlineName)+
                '&flightTime=' + encodeURIComponent(flightTime)+
                '&price=' + encodeURIComponent(price)+
                '&action=showBookingModal'
        })
            // .then(response => response.json()) // Nhận phản hồi từ Servlet
            .then(() => {
                // Như ấn nút refresh
                window.location.href = window.location.href;
            })
            // .then(()=>{
            //     // Hiển thị Modal
            //     showBookingModal();
            // })
            .catch(error => console.error('Lỗi:', error));
    }

    function selectSeat(seatNumber) {
        // Xóa ghế đã chọn trước đó (nếu có)
        document.querySelectorAll(".seat-selected").forEach(seat => {
            console.log(seat.classList);
            seat.classList.add("seat-available");
            seat.classList.add("btn-outline-primary");
            seat.classList.remove("seat-booked");
            seat.classList.remove("btn-success");
            seat.classList.remove("seat-selected");

        });
        // Chọn ghế mới
        var seatElements = document.querySelectorAll(".seat-available"); // Lấy tất cả ghế có class "seat-available"

        var seatElement = Array.from(seatElements).find(seat => seat.textContent.trim() === seatNumber);

        if (seatElement) {
            console.log(seatElement.classList);
            seatElement.classList.add("seat-selected");
            seatElement.classList.add("seat-booked");
            seatElement.classList.add("btn-success");
            seatElement.classList.remove("seat-available");
            seatElement.classList.remove("btn-outline-primary");
        }


        // Gán số ghế vào ô input
        document.getElementById("seat_number").value = seatNumber;
    }

</script>

</body>
<%@ include file="/WEB-INF/view/common/footer.jsp" %>
</html>