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
                        <%--                        <th scope="col" class="text-center">Chi tiết</th>--%>
                        <%--                        <th scope="col" class="text-center">Đặt vé</th>--%>
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
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <%--            <div class="text-center mt-3">--%>
            <%--                <button type="button" class="btn btn-success">Xác Nhận</button>--%>
            <%--            </div>--%>
        </div>

        <!-- Container mới bên phải -->
        <div class="col-lg-4">
            <div class="sidebar">
                <div class="card">
                    <div class="card-body p-3"> <!-- Giảm padding card -->
                        <!-- Form tìm kiếm -->
                        <form id="SearchForm" action="customer" method="GET">
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
                            <div class="mb-2">
                                <label for="return_date" class="form-label">Ngày về</label>
                                <input type="date" class="form-control" id="return_date" name="return_date"
                                       value="${SearchedTicketForm.departure_location}">
                            </div>
                            <%-- Xet gia tri cua nguoi lon --%>
                            <div class="mb-2">
                                <label for="adult_num" class="form-label">Người lớn</label>
                                <input type="number" class="form-control" id="adult_num" name="adult_num" min="0"
                                       value="${SearchedTicketForm.adult_num}">
                                <%-- Xet gia tri cua tre em --%>
                            </div>
                            <div class="mb-2">
                                <label for="kid_num" class="form-label">Trẻ em</label>
                                <input type="number" class="form-control" id="kid_num" name="kid_num" min="0"
                                       value="${SearchedTicketForm.kid_num}">
                            </div>
                            <%-- Xet gia tri cua baby --%>
                            <div class="mb-3">
                                <label for="baby_num" class="form-label">Em bé</label>
                                <input type="number" class="form-control" id="baby_num" name="baby_num" min="0"
                                       value="${SearchedTicketForm.baby_num}">
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
<div class="modal fade modal-lg" id="detailModal" tabindex="-1" aria-labelledby="modalTitle" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalTitle">Chi tiết vé</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Điểm đi và đến -->
                <h5 class="text-center">Hà Nội → Hồ Chí Minh</h5>

                <!-- Chia thành 3 phần -->
                <div class="row text-center">
                    <!-- Phần 1: Hà Nội -->
                    <div class="col-md-4">
                        <p><strong>Hà Nội</strong></p>
                        <p>08:00</p>
                        <p>Nội Bài (HAN)</p>
                    </div>
                    <!-- Phần 2: HCM -->
                    <div class="col-md-4">
                        <p><strong>Hồ Chí Minh</strong></p>
                        <p>10:00</p>
                        <p>Tân Sơn Nhất (SGN)</p>
                    </div>
                    <!-- Phần 3: Hãng & Chuyến bay -->
                    <div class="col-md-4">
                        <p><strong>Vietnam Airlines</strong></p>
                        <p>Chuyến bay: VN123</p>
                        <p>Hạng vé: Phổ thông</p>
                    </div>
                </div>

                <!-- Bảng thông tin giá vé -->
                <table class="table table-bordered mt-3">
                    <thead class="table-light">
                    <tr>
                        <th>Loại hành khách</th>
                        <th>Số lượng vé</th>
                        <th>Giá mỗi vé</th>
                        <th>Thuế và phí</th>
                        <th>Tổng giá</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>Người lớn</td>
                        <td>1</td>
                        <td>$400</td>
                        <td>$100</td>
                        <td>$500</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đặt vé ngay</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
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
    document.getElementById("sortSelect").addEventListener("change", function () {
        document.getElementById("SearchForm").submit();
    });

</script>

</body>
<%@ include file="/WEB-INF/view/common/footer.jsp" %>
</html>