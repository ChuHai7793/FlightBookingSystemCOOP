<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Ký</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body, html {
            height: 100%; /* Đảm bảo body và html chiếm toàn bộ chiều cao */
            margin: 0;
            padding: 5px;
        }

        .form-container {
            max-width: 500px; /* Giới hạn chiều rộng */
            width: 90%; /* Responsive trên mobile */
            margin: 0 auto; /* Căn giữa, bỏ margin top/bottom */
            padding: 15px; /* Giảm padding */
            background-color: #f8f9fa;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            height: calc(100vh - 10px); /* Chiếm toàn bộ chiều cao màn hình */
            display: flex;
            flex-direction: column; /* Sắp xếp các phần tử theo cột */
            justify-content: center; /* Căn giữa theo chiều dọc */
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 20px; /* Giảm margin */
            font-size: 1.5rem; /* Giảm font-size */
        }

        /* Giảm khoảng cách và kích thước field */
        .mb-3 {
            margin-bottom: 10px !important; /* Giảm margin giữa các field */
        }

        .form-label {
            font-size: 0.9rem; /* Giảm font-size label */
            margin-bottom: 2px; /* Giảm khoảng cách dưới label */
        }

        .form-control, .form-select {
            font-size: 0.9rem; /* Giảm font-size input/select */
            padding: 6px 10px; /* Giảm padding */
            height: auto; /* Đảm bảo chiều cao tự động */
        }

        .form-control#address {
            min-height: 60px; /* Giới hạn chiều cao textarea */
            resize: none; /* Ngăn kéo giãn textarea */
        }

        .btn {
            font-size: 0.9rem; /* Giảm font-size button */
            padding: 8px; /* Giảm padding */
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Đăng Ký</h2>
    <form action="#" method="POST">
        <div class="mb-3">
            <label for="email" class="form-label">Email:</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>

        <div class="mb-3">
            <label for="password" class="form-label">Mật khẩu:</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>

        <div class="mb-3">
            <label for="confirm-password" class="form-label">Xác nhận mật khẩu:</label>
            <input type="password" class="form-control" id="confirm-password" name="confirm-password" required>
        </div>

        <div class="mb-3">
            <label for="phone" class="form-label">Điện thoại:</label>
            <input type="tel" class="form-control" id="phone" name="phone" required>
        </div>

        <div class="mb-3">
            <label for="fullname" class="form-label">Họ và Tên:</label>
            <input type="text" class="form-control" id="fullname" name="fullname" required>
        </div>

        <div class="mb-3">
            <label for="dob" class="form-label">Ngày sinh:</label>
            <input type="date" class="form-control" id="dob" name="dob" required>
        </div>

        <div class="mb-3">
            <label for="address" class="form-label">Địa chỉ:</label>
            <textarea class="form-control" id="address" name="address" required></textarea>
        </div>

        <div class="mb-3">
            <label for="gender" class="form-label">Giới tính:</label>
            <select class="form-select" id="gender" name="gender">
                <option value="male">Nam</option>
                <option value="female">Nữ</option>
                <option value="other">Khác</option>
            </select>
        </div>

        <button type="submit" class="btn btn-primary w-100">Đăng Ký</button>
    </form>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>