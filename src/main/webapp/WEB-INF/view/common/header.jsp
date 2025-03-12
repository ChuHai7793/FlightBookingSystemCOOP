<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TWOR AIRLINE</title>
    <link rel="stylesheet" href="/assets/css/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
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
                <li class="nav-item"><a class="nav-link" href="/home">Trang chủ</a></li>
                <li class="nav-item"><a class="nav-link" href="flights.jsp">Đặt vé</a></li>
                <li class="nav-item"><a class="nav-link" href="contact.jsp">Liên hệ</a></li>
                <c:if test="${sessionScope.user.role == 'staff'}">
                    <li class="nav-item"><a class="nav-link" href="/staff/report.jsp">Gửi báo cáo</a></li>
                </c:if>

                <c:if test="${sessionScope.user.role == 'admin'}">
                    <li class="nav-item"><a class="nav-link" href="/admin/view_reports.jsp">Xem báo cáo</a></li>
                </c:if>
            </ul>
            </ul>
            <div class="ms-3">
                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <div class="dropdown">
                            <a href="#" class="dropdown-toggle text-light text-decoration-none" id="userDropdown" data-bs-toggle="dropdown">
                                Xin chào, ${sessionScope.user.fullName}
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="userDropdown">
                                <li><a class="dropdown-item" href="/customer/info.jsp?userId=${sessionScope.user.userId}">Thông tin cá nhân</a></li>
                                <li><a class="dropdown-item" href="#" onclick="logout()">Đăng xuất</a></li>
                            </ul>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <a href="#" class="btn btn-light btn-login" data-bs-toggle="modal" data-bs-target="#loginModal">Đăng nhập</a>
                    </c:otherwise>
                </c:choose>
            </div>

        </div>
    </div>
</nav>
<script>
    function logout() {
        fetch('/LogoutServlet')
            .then(response => response.json())
            .then(data => {
                if (data.status === "logged_out") {
                    location.reload();
                }
            })
            .catch(error => console.error('Lỗi khi logout:', error));
    }
</script>
