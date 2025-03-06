<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thanh toán</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        /* Căn giữa theo chiều dọc */
        .table td, .table th {
            vertical-align: middle;
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

<!-- Main Content -->
<div class="container-fluid mt-3">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-3 left-section border p-3 bg-light">
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a href="personal-info.html" class="nav-link text-primary">Thông tin cá nhân</a>
                </li>
                <li class="nav-item">
                    <a href="payment.html" class="nav-link text-primary active">Thanh toán</a>
                </li>
                <li class="nav-item">
                    <a href="transaction-history.html" class="nav-link text-primary">Lịch sử giao dịch</a>
                </li>
                <li class="nav-item">
                    <a href="change-password.html" class="nav-link text-primary">Đổi mật khẩu</a>
                </li>
            </ul>
        </div>

        <div class="col-md-9 right-section border p-3">
            <table class="table table-bordered table-hover">
                <thead class="table-light">
                <tr>
                    <th scope="col" class="text-center">Mã vé</th>
                    <th scope="col" class="text-center">Nơi đi</th>
                    <th scope="col" class="text-center">Nơi đến</th>
                    <th scope="col" class="text-center">Ngày đặt</th>
                    <th scope="col" class="text-center">Ngày bay</th>
                    <th scope="col" class="text-center">Giá</th>
                    <th scope="col" class="text-center">Hủy</th>
                    <th scope="col" class="text-center">Chọn</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td class="text-center">DN001</td>
                    <td class="text-center">Đà Nẵng</td>
                    <td class="text-center">Hồ Chí Minh</td>
                    <td class="text-center">15/05/2023</td>
                    <td class="text-center">25/05/2023</td>
                    <td class="text-center">1,000,000</td>
                    <td class="text-center"><a href="#" class="text-danger">Hủy</a></td>
                    <td class="text-center"><input type="checkbox" class="form-check-input"></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Bootstrap JS và Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>