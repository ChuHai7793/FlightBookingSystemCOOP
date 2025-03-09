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
    <style>
        /* Căn giữa theo chiều dọc */
        .table td, .table th {
            vertical-align: middle;
        }
    </style>

</head>
<body>
<!-- Main Content -->
<div class="container-fluid mt-3">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-3 border p-3">
            <a href="../customer/info.jsp?userId=${sessionScope.user.userId}" class="d-block mb-2 text-primary">Thông tin cá nhân</a>
            <a href="../customer?action=checkPaymentInfo" class="d-block mb-2 text-primary">Thanh toán</a>
            <a href="../customer?action=checkTransactionHistory" class="d-block mb-2 text-primary">Lịch sử giao dịch</a>
            <a href="../customer/change_password.jsp" class="d-block mb-2 text-primary">Đổi mật khẩu</a>
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
                <c:forEach var="payment_info" items="${payment_infos}">
                    <tr>
                        <th scope="col" class="text-center">${payment_info.flight_code}</th>
                        <th scope="col" class="text-center">${payment_info.departure_location}</th>
                        <th scope="col" class="text-center">${payment_info.arrival_location}</th>
                        <th scope="col" class="text-center">${payment_info.booking_date}</th>
                        <th scope="col" class="text-center">${payment_info.travel_date}</th>
                        <th scope="col" class="text-center">${payment_info.price}</th>
                        <th scope="col" class="text-center">Hủy</th>
                        <th scope="col" class="text-center">Chọn</th>
                    </tr>
                </c:forEach>
<%--                <tr>--%>
<%--                    <td class="text-center">DN001</td>--%>
<%--                    <td class="text-center">Đà Nẵng</td>--%>
<%--                    <td class="text-center">Hồ Chí Minh</td>--%>
<%--                    <td class="text-center">15/05/2023</td>--%>
<%--                    <td class="text-center">25/05/2023</td>--%>
<%--                    <td class="text-center">1,000,000</td>--%>
<%--                    <td class="text-center"><a href="#" class="text-danger">Hủy</a></td>--%>
<%--                    <td class="text-center"><input type="checkbox" class="form-check-input"></td>--%>
<%--                </tr>--%>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Bootstrap JS và Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
<%@ include file="/WEB-INF/view/common/footer.jsp" %>
</body>
</html>