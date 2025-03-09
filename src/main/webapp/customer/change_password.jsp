<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/common/header.jsp" %>
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

<!-- Main Content -->
<div class="container-fluid mt-3">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-3 border p-3">
            <a href="../customer/info.jsp" class="d-block mb-2 text-primary">Thông tin cá nhân</a>
            <a href="../customer?action=checkPaymentInfo" class="d-block mb-2 text-primary">Thanh toán</a>
            <a href="../customer?action=checkTransactionHistory" class="d-block mb-2 text-primary">Lịch sử giao dịch</a>
            <a href="../customer/change_password.jsp" class="d-block mb-2 text-primary">Đổi mật khẩu</a>
        </div>


        <!-- Main Content -->
        <div class="col-md-9 right-section border p-3">
            <form action="../customer" method="post">
                <input type="hidden" name="action" value="changePassword">
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
<%@ include file="/WEB-INF/view/common/footer.jsp" %>
</body>
</html>