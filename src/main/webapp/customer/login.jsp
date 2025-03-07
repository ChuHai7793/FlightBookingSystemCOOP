<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/common/header.jsp" %>

<div class="container mt-5">
  <div class="card mx-auto" style="max-width: 400px;">
    <div class="card-header text-center">
      <h3>Đăng nhập</h3>
    </div>
    <div class="card-body">
      <form action="LoginServlet" method="POST">
        <div class="mb-3">
          <input type="text" class="form-control" name="email" placeholder="Email" required>
        </div>
        <div class="mb-3">
          <input type="password" class="form-control" name="password" placeholder="Mật khẩu" required>
        </div>
        <button type="submit" class="btn btn-primary w-100">Đăng nhập</button>
        <div class="text-center mt-2">
          <a href="register.jsp">Chưa có tài khoản? Đăng ký ngay</a>
        </div>
        <div class="text-center mt-2">
          <span style="color: red;">${errorMessage}</span>
        </div>
      </form>
    </div>
  </div>
</div>

<%@ include file="/WEB-INF/view/common/footer.jsp" %>
