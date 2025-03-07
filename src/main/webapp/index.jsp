<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt vé - MyWebsite</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>
<!-- Header với Navbar -->
<header>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">2HAI AIRLINE</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="http://localhost:8080/">Trang Chủ</a>
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
                <c:choose>
                    <!-- Nếu userId là null (chưa đăng nhập) -->
                    <c:when test="${empty userId}">
                        <div class="d-flex gap-2">
                            <button class="btn btn-outline-primary btn-register" onclick="window.location.href='customer/register.jsp'">
                                Đăng ký
                            </button>
                            <button class="btn btn-primary btn-login" onclick="window.location.href='customer/login.jsp'">
                                Đăng nhập
                            </button>
                        </div>
                        <div class="mb-3">
                            <input type="password" class="form-control" name="password" placeholder="Mật khẩu" required>
                        </div>
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <div class="form-check">
                                <input type="checkbox" class="form-check-input" id="remember">
                                <label class="form-check-label" for="remember">Ghi nhớ đăng nhập</label>
                            </div>
                            <a href="#" class="text-decoration-none">Quên mật khẩu?</a>
                            <a hrer="#" class=="text-decoration-none">Đăng ký</a>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Đăng nhập</button>
                        <div class="text-center mt-2">
                            <span class="text-muted">OR</span>
                        </div>
                        <div class="social-login mt-3">
                            <button type="button" class="btn facebook-btn text-white w-100 mb-2">Đăng nhập bằng
                                Facebook
                            </button>
                            <button type="button" class="btn google-btn text-white w-100">Đăng nhập bằng Gmail</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Form đặt vé -->
    <div class="container mt-4">
        <div class="card shadow-lg p-4 booking-form">
            <h2 class="text-primary text-center">Đặt vé máy bay</h2>
            <form action="BookingServlet" method="POST">
                <div class="row">
                    <!-- Một chiều -->
                    <div class="col-md-6">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="ticket_type" id="one-way" value="one-way"
                                   checked>
                            <label class="form-check-label" for="one-way">Một chiều</label>
                        </div>
                        <label class="form-label">Điểm đi</label>
                        <input type="text" class="form-control" name="departure" placeholder="Nhập điểm đi" required>
<!-- Form đặt vé -->
<div class="container mt-5">
    <form action="/customer" method="get">
        <fieldset class="border p-4 rounded">
            <legend class="float-none w-auto px-2">Đặt vé</legend>

                    <!-- Khứ hồi -->
                    <div class="col-md-6">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="ticket_type" id="round-trip"
                                   value="round-trip">
                            <label class="form-check-label" for="round-trip">Khứ hồi</label>
                        </div>
                        <label class="form-label">Điểm đến</label>
                        <input type="text" class="form-control" name="destination" placeholder="Nhập điểm đến" required>

                        <label class="form-label">Ngày về</label>
                        <input type="date" class="form-control" name="return_date" id="return-date" disabled>
                    </div>
                </div>

                <!-- Số lượng hành khách -->
                <div class="row mt-3">
                    <div class="col-md-4">
                        <label class="form-label">Người lớn</label>
                        <input type="number" class="form-control" name="adults" min="1" required>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Trẻ em</label>
                        <input type="number" class="form-control" name="children" min="0">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Em bé</label>
                        <input type="number" class="form-control" name="infants" min="0">
                    </div>
                </div>


            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="departure_location" class="form-label">Điểm đi</label>
                    <input required type="text" class="form-control" id="departure_location" name="departure_location" placeholder="Nhập điểm đi">
                </div>
                <div class="col-md-6">
                    <label for="arrival_location" class="form-label">Điểm đến</label>
                    <input required type="text" class="form-control" id="arrival_location" name="arrival_location" placeholder="Nhập điểm đến">
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="leaving_date" class="form-label">Ngày đi</label>
                    <input type="date" class="form-control" id="leaving_date" name="leaving_date">
                </div>
                <div class="col-md-6">
                    <label for="return_date" class="form-label">Ngày về</label>
                    <input type="date" class="form-control" id="return_date" name="return_date">
                </div>
            </div>

        ticketTypeRadios.forEach(radio => {
            radio.addEventListener("change", function () {
                returnDateInput.disabled = this.value === "one-way";
            });
        });

        document.getElementById("one-way").checked = true;
    </script>
</div>
