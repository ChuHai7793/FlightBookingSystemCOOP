<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TWOR AIRLINE</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="/assets/css/style.css">
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">
            <img src="/assets/img/logo.png" alt="Logo">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="index.jsp">Trang chủ</a></li>
                <li class="nav-item"><a class="nav-link" href="flights.jsp">Đặt vé</a></li>
                <li class="nav-item"><a class="nav-link" href="contact.jsp">Liên hệ</a></li>
            </ul>
            <div class="ms-3">
                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <a href="LogoutServlet" class="btn btn-light">Đăng xuất</a>
                        <span class="nav-link text-light">Xin chào, ${sessionScope.user.fullName}!</span>
                    </c:when>
                    <c:otherwise>
                        <a href="#" class="btn btn-light btn-login" data-bs-toggle="modal" data-bs-target="#loginModal">Đăng nhập</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</nav>
