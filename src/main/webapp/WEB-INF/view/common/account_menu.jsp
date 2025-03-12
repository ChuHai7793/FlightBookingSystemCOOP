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
</style>

<div class="col-md-3 d-flex flex-column">
    <div class="account-menu shadow-sm w-100">
        <h5>🔹 Tài khoản</h5>
        <hr>
        <div class="menu-container">
            <a href="info.jsp?page=info" class="${param.page == 'info' ? 'active' : ''}">Thông tin cá nhân</a>
            <a href="account_menu.jsp?page=history" class="${param.page == 'history' ? 'active' : ''}">Lịch sử giao dịch</a>
            <a href="change_password.jsp?page=change_password" class="${param.page == 'change_password' ? 'active' : ''}">Đổi mật khẩu</a>

            <c:if test="${sessionScope.user.role == 'staff'}">
                <a href="account_menu.jsp?page=manage_customer" class="${param.page == 'manage_customer' ? 'active' : ''}">Quản lý khách hàng</a>
                <a href="report.jsp?page=report" class="${param.page == 'report' ? 'active' : ''}">Quản lý báo cáo</a>
            </c:if>

            <c:if test="${sessionScope.user.role == 'admin'}">
                <a href="/admin/manage_staff.jsp?page=manage_staff" class="${param.page == 'manage_staff' ? 'active' : ''}"> Quản lý nhân viên</a>
                <a href="account_menu.jsp?page=logs" class="${param.page == 'logs' ? 'active' : ''}">Quản lý Log</a>
            </c:if>
        </div>
    </div>
</div>
