<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
    .col-md-3 {
        flex: 0 0 25%;
        max-width: 250px;
        padding-left: 0 !important; /* Xóa padding trái */
        margin-left: 0 !important;  /* Xóa margin trái */
    }

    .account-menu {
        background: #f8f9fa;
        border-radius: 10px;
        padding: 15px;
        width: 100%;
        min-width: 250px;
        margin-left: 0 !important; /* Xóa margin trái */
    }

    .account-menu h5 {
        font-weight: bold;
        color: #333;
        margin-bottom: 15px;
    }

    .account-menu a {
        display: block;
        padding: 10px 15px;
        border-radius: 5px;
        font-weight: 500;
        text-decoration: none;
        color: #333;
        transition: 0.3s;
        white-space: nowrap;
    }

    .account-menu a:hover, .account-menu a.active {
        background: #007bff;
        color: #fff;
    }

    /* Định dạng trang */
    @media (min-width: 768px) {
        .col-md-3 {
            flex: 0 0 25%;  /* Chiếm 25% chiều rộng */
            max-width: 250px;  /* Giới hạn tối đa 250px */
        }
    }
    .account-container {
        max-width: 100%;
        padding-left: 0 !important;
        margin-left: 0 !important;
    }

    .account-menu.w-100 {
        width: auto !important;
    }


</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<div class="container-fluid account-container mt-4">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-3 d-flex flex-column">
            <div class="account-menu shadow-sm w-100">
                <h5>🔹 Tài khoản</h5>
                <hr>
                <div class="menu-container">
                    <a href="account.jsp?page=info" class="d-block mb-2 text-primary">Thông tin cá nhân</a>
                    <a href="account.jsp?page=payment" class="d-block mb-2 text-primary">Thanh toán</a>
                    <a href="account.jsp?page=history" class="d-block mb-2 text-primary">Lịch sử giao dịch</a>
                    <a href="account.jsp?page=change_password" class="d-block mb-2 text-primary">Đổi mật khẩu</a>

                    <c:if test="${sessionScope.user.role == 'staff'}">
                        <a href="account.jsp?page=manage_customer" class="d-block mb-2 text-primary">Quản lý khách hàng</a>
                    </c:if>
                    <c:if test="${sessionScope.user.role == 'admin'}">
                        <a href="account.jsp?page=manage_staff" class="d-block mb-2 text-primary">Quản lý nhân viên</a>
                        <a href="account.jsp?page=logs"class="d-block mb-2 text-primary">Quản lý Log</a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>
