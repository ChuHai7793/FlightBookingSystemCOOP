<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thanh toán</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
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

        <!-- Main Content -->
        <div class="col-md-9 right-section border p-3">
            <form>
                <div class="mb-3">
                    <label for="current-password" class="form-label">Mật khẩu hiện tại:</label>
                    <input type="password" class="form-control" id="current-password" name="current-password">
                </div>

                <div class="mb-3">
                    <label for="new-password" class="form-label">Nhập mật khẩu mới:</label>
                    <input type="password" class="form-control" id="new-password" name="new-password">
                </div>

                <div class="mb-3">
                    <label for="confirm-password" class="form-label">Xác nhận mật khẩu:</label>
                    <input type="password" class="form-control" id="confirm-password" name="confirm-password">
                </div>

                <div class="d-flex justify-content-end">
                    <button type="submit" class="btn btn-primary">Đổi mật khẩu</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Bootstrap JS và Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>