<%--
  Created by IntelliJ IDEA.
  User: haich_ahutcq2
  Date: 05/03/2025
  Time: 09:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Trang Đăng Nhập</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .login-container {
      max-width: 400px;
      margin: 100px auto;
    }
    .social-login .btn {
      width: 100%;
      margin-bottom: 10px;
    }
    .facebook-btn,.facebook-btn:hover {
      background-color: #3b5998;
      border-color: #3b5998;
    }
    .facebook-btn:hover{
      scale: 1.1;
    }
    .google-btn,.google-btn:hover {
      background-color: #db4437;
      border-color: #db4437;
    }
    .google-btn:hover {
      scale: 1.1;
    }
  </style>
</head>
<body>
<div class="login-container">
  <form class="p-4 border rounded">
    <h3 class="text-center mb-4">Đăng nhập</h3>
    <div class="mb-3">
      <input type="text" class="form-control" placeholder="Tài khoản" required>
    </div>
    <div class="mb-3">
      <input type="password" class="form-control" placeholder="Mật khẩu" required>
    </div>
    <div class="d-flex justify-content-between align-items-center mb-3">
      <div class="form-check">
        <input type="checkbox" class="form-check-input" id="remember">
        <label class="form-check-label" for="remember">Ghi nhớ đăng nhập</label>
      </div>
      <a href="#" class="text-decoration-none">Quên mật khẩu?</a>
    </div>
    <div class="text-center mb-3">
      <span class="text-muted">OR</span>
    </div>
    <div class="social-login">
      <button type="button" class="btn facebook-btn text-white">Đăng nhập bằng Facebook</button>
      <button type="button" class="btn google-btn text-white">Đăng nhập bằng Gmail</button>
    </div>
  </form>
</div>

<!-- Bootstrap JS (Optional) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
