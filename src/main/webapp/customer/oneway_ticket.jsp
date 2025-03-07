<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang cá nhân</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
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
            font-size: 13px; /* Font chữ cho label */
            margin-bottom: 4px;
        }

        .sidebar .form-control,
        .sidebar .form-select {
            font-size: 13px; /* Font chữ cho input/select */
            padding: 6px 8px; /* Giảm padding */
        }

        .sidebar .btn {
            font-size: 14px;
            padding: 8px;
        }
        .table-container {
            height:fit-content;
            max-height: calc(100vh - 150px); /* Chiều cao cố định, bạn có thể điều chỉnh */
            overflow-y: auto; /* Hiển thị thanh cuộn dọc khi nội dung vượt quá */
            border: 10px solid #dee2e6; /* Tùy chọn: thêm viền để khớp với bảng */
            padding: 0; /* Loại bỏ padding nếu không cần thiết */
        }
        .table-container table {
            margin: 0; /* Loại bỏ margin mặc định của table */
            width: 100%; /* Đảm bảo bảng chiếm toàn bộ chiều ngang */
        }
    </style>


</head>
<body>
<!-- Navbar -->
<header>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Trang Chủ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Giới Thiệu</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Dịch Vụ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Liên Hệ</a>
                    </li>
                </ul>
                <select class="form-select w-auto" onchange="window.location.href=this.value;">
                    <option value="" selected>Tên</option>
                    <option value="logout.html">Đăng xuất</option>
                </select>
            </div>
        </div>
    </nav>
</header>
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
                        <th scope="col" class="text-center">Chi tiết</th>
                        <th scope="col" class="text-center">Đặt vé</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:choose>
                        <c:when test="${empty searchedTickets}">
                            <tr>
                                <td class="text-center" colspan="6">Không tìm thấy chuyến bay khớp với tìm kiếm </td>
                            </tr>

                        </c:when>
                        <c:otherwise>
                            <c:forEach var="searchedTicket" items="${searchedTickets}">
                                <tr>
                                    <td class="text-center">${searchedTicket.airlineName}</td>
                                    <td class="text-center">${searchedTicket.flight_code}</td>
                                    <td class="text-center">${searchedTicket.flight_time}</td>
                                    <td class="text-center">${searchedTicket.price}</td>
                                    <td class="text-center"><a href="#" class="btn btn-link p-0">Chi tiết</a></td>
                                    <td class="text-center">
                                        <input type="checkbox" class="form-check-input rounded-circle">
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>


<%--                    <tr>--%>
<%--                        <td class="text-center">VNairline</td>--%>
<%--                        <td class="text-center">VNA101</td>--%>
<%--                        <td class="text-center">13:30-15:30</td>--%>
<%--                        <td class="text-center">2,000,000</td>--%>
<%--                        <td class="text-center"><a href="#" class="btn btn-link p-0">Chi tiết</a></td>--%>
<%--                        <td class="text-center">--%>
<%--                            <input type="checkbox" class="form-check-input rounded-circle">--%>
<%--                        </td>--%>
<%--                    </tr>--%>
                    <!-- Thêm nhiều hàng để kiểm tra scroll -->
<%--                    <tr>--%>
<%--                        <td class="text-center">VNairline</td>--%>
<%--                        <td class="text-center">VNA102</td>--%>
<%--                        <td class="text-center">14:00-16:00</td>--%>
<%--                        <td class="text-center">2,500,000</td>--%>
<%--                        <td class="text-center"><a href="#" class="btn btn-link p-0">Chi tiết</a></td>--%>
<%--                        <td class="text-center">--%>
<%--                            <input type="checkbox" class="form-check-input rounded-circle">--%>
<%--                        </td>--%>
<%--                    </tr>--%>
                    <!-- Thêm thêm hàng nếu cần -->
                    </tbody>
                </table>
            </div>
        </div>

    <!-- Container mới bên phải -->
    <div class="col-lg-4">
        <div class="sidebar">
            <div class="card">
                <div class="card-body p-3"> <!-- Giảm padding card -->
                    <!-- Checkbox Sắp xếp -->
                    <div class="mb-3">
                        <h6 class="card-title mb-2" style="font-size: 15px;">Sắp xếp</h6>
                        <select id ="sortSelect" class="form-select" aria-label="Sắp xếp">
                            <option name ="recommend" value="recommend" selected>Đề xuất</option>
                            <option  value="price">Giá (thấp đến cao)</option>
                            <option  value="time">Thời gian khởi hành</option>
                            <option  value="airline">Hãng hàng không</option>
                        </select>
                    </div>

                    <!-- Form tìm kiếm -->
                    <form action="customer" method="GET">
                        <input type="hidden" name="action" value="searchTicket">
                        <div class="mb-2">
                            <label for="departure_location" class="form-label">Điểm đi</label>
                            <input type="text" class="form-control" id="departure_location" name="departure_location" value="${SearchedTicketForm.departure_location}">
                        </div>
                        <div class="mb-2">
                            <label for="arrival_location" class="form-label">Điểm đến</label>
                            <input type="text" class="form-control" id="arrival_location" name="arrival_location" value="${SearchedTicketForm.arrival_location}">
                        </div>
                        <div class="mb-2">
                            <label for="leaving_date" class="form-label">Ngày đi</label>
                            <input type="date" class="form-control" id="leaving_date" name="leaving_date" value="${SearchedTicketForm.leaving_date}">
                        </div>
                        <div class="mb-2">
                            <label for="return_date" class="form-label">Ngày về</label>
                            <input type="date" class="form-control" id="return_date" name="return_date"  value="${SearchedTicketForm.departure_location}">
                        </div>
                        <%-- Xet gia tri cua nguoi lon --%>
                        <div class="mb-2">
                            <label for="adult_num" class="form-label">Người lớn</label>
                            <input type="number" class="form-control" id="adult_num" name="adult_num" min="0" value="${SearchedTicketForm.adult_num}">
                        <%-- Xet gia tri cua tre em --%>
                        </div>
                        <div class="mb-2">
                            <label for="kid_num" class="form-label">Trẻ em</label>
                            <input type="number" class="form-control" id="kid_num" name="kid_num" min="0" value="${SearchedTicketForm.kid_num}">
                        </div>
                        <%-- Xet gia tri cua baby --%>
                        <div class="mb-3">
                            <label for="baby_num" class="form-label">Em bé</label>
                            <input type="number" class="form-control" id="baby_num" name="baby_num" min="0" value="${SearchedTicketForm.baby_num}">
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Tìm kiếm</button>
                    </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS và Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

<script>

    document.getElementById("sortSelect").addEventListener("change", function() {
        let selectedValue = this.value;

        fetch("customer?sort=" + selectedValue, {
            method: "GET"
        })
            .catch(error => console.error("Lỗi:", error));
    });
</script>

</body>
</html>