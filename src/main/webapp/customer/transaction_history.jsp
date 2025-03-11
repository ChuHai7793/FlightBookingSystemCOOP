
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/common/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
      <a href="../customer/info.jsp?userId=${sessionScope.user.userId}" class="d-block mb-2 text-primary">Thông tin cá nhân</a>
      <a href="../customer?action=checkPaymentInfo" class="d-block mb-2 text-primary">Thanh toán</a>
      <a href="../customer?action=checkTransactionHistory" class="d-block mb-2 text-primary">Lịch sử giao dịch</a>
      <a href="../customer/change_password.jsp" class="d-block mb-2 text-primary">Đổi mật khẩu</a>
    </div>


    <!-- Main Content -->
    <div class="col-md-9 right-section border p-3">
      <table class="table table-bordered table-hover">
        <thead class="table-light">
        <tr>
          <th scope="col" class="text-center">Nơi đi</th>
          <th scope="col" class="text-center">Nơi đến</th>
          <th scope="col" class="text-center">Ngày đặt</th>
          <th scope="col" class="text-center">Ngày bay</th>
          <th scope="col" class="text-center">Giá</th>
          <th scope="col" class="text-center">Tình trạng</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach var="transaction_history" items="${transaction_histories}">
          <tr>
            <td class="text-start">${transaction_history.departure_location}</td>
            <td class="text-start">${transaction_history.arrival_location}</td>
            <td class="text-center">${transaction_history.booking_date}</td>
            <td class="text-center">${transaction_history.travel_date}</td>
            <td class="text-end">$<fmt:setLocale value="vi_VN"/>
              <fmt:formatNumber value="${transaction_history.price}" type="currency"/></td>
            <td class="text-start">${transaction_history.status}</td>
          </tr>
        </c:forEach>


<%--        <tr>--%>
<%--          <td class="text-center">Đà Nẵng</td>--%>
<%--          <td class="text-center">Hồ Chí Minh</td>--%>
<%--          <td class="text-center">15/05/2023</td>--%>
<%--          <td class="text-center">25/05/2023</td>--%>
<%--          <td class="text-center">1,000,000</td>--%>
<%--          <td class="text-center">Đã thanh toán </td>--%>
<%--        </tr>--%>

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