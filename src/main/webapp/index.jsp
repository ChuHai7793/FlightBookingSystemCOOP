<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/common/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<div class="main-content">
    <!-- Banner -->
    <div class="banner">
        <div class="text-center">
            <h1>Chào mừng đến với TWOR AIRLINE</h1>
            <p>Đặt vé nhanh chóng, dễ dàng với giá tốt nhất.</p>
        </div>
    </div>
    <!-- Modal Đăng Nhập -->
    <div class="modal fade ${not empty errorMessage ? 'show' : ''}" id="loginModal" tabindex="-1"
         aria-labelledby="loginModalLabel" aria-hidden="${not empty errorMessage ? 'false' : 'true'}"
         style="${not empty errorMessage ? 'display: block;' : ''}">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="loginModalLabel">Đăng nhập</h3>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger">${errorMessage}</div>
                </c:if>
                <div class="modal-body">
                    <form action="LoginServlet" method="POST">
                        <div class="mb-3">
                            <input type="text" class="form-control" name="phone" placeholder="Tài khoản" required>
                        </div>
                        <div class="mb-3">
                            <input type="password" class="form-control" name="password" placeholder="Mật khẩu"
                                   required>
                        </div>
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <div class="form-check">
                                <input type="checkbox" class="form-check-input" id="remember">
                                <label class="form-check-label" for="remember">Ghi nhớ đăng nhập</label>
                            </div>
                            <a href="#" class="text-decoration-none">Quên mật khẩu?</a>
                            <a href="#" class="text-decoration-none" data-bs-toggle="modal"
                               data-bs-target="#registerModal">Đăng ký</a>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Đăng nhập</button>
                        <div class="text-center mt-2">
                            <span class="text-muted">OR</span>
                        </div>
                        <div class="social-login">
                            <button type="button" class="facebook-btn">
                                <i class="fab fa-facebook-f"></i> Đăng nhập bằng Facebook
                            </button>
                            <button type="button" class="google-btn">
                                <i class="fab fa-google"></i> Đăng nhập bằng Google
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--Model Đăng Ký-->
    <div class="modal fade" id="registerModal" tabindex="-1" aria-labelledby="registerModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="registerModalLabel">Đăng ký tài khoản</h3>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="RegisterServlet" method="POST">
                        <div class="mb-3">
                            <input type="text" class="form-control" name="full_name" placeholder="Họ và tên"
                                   required>
                        </div>
                        <div class="mb-3">
                            <input type="text" class="form-control" name="phone" placeholder="Số điện thoại"
                                   required>
                        </div>
                        <div class="mb-3">
                            <input type="email" class="form-control" name="email" placeholder="Email" required>
                        </div>
                        <div class="mb-3">
                            <input type="password" class="form-control" name="password" placeholder="Mật khẩu"
                                   required>
                        </div>
                        <div class="mb-3">
                            <input type="password" class="form-control" name="confirm_password"
                                   placeholder="Xác nhận mật khẩu" required>
                        </div>
                        <button type="submit" class="btn btn-success w-100">Đăng ký</button>
                        <!-- Quay lại Đăng nhập -->
                        <div class="text-center mt-2">
                            <span class="text-muted">Đã có tài khoản? </span>
                            <a href="#" class="text-decoration-none" data-bs-dismiss="modal" data-bs-toggle="modal"
                               data-bs-target="#loginModal">Đăng nhập</a>
                        </div>
                        <div class="text-center mt-2">
                            <span class="text-muted">Hoặc đăng nhập bằng</span>
                        </div>
                        <div class="social-login">
                            <button type="button" class="facebook-btn">
                                <i class="fab fa-facebook-f"></i> Đăng nhập bằng Facebook
                            </button>
                            <button type="button" class="google-btn">
                                <i class="fab fa-google"></i> Đăng nhập bằng Google
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Form đặt vé -->
    <div class="container mt-4">
        <div class="card shadow-lg p-4 booking-form">
            <h2 class="text-primary text-center">Đặt vé máy bay</h2>
            <form action="customer" method="GET">
                <input type="hidden" name="action" value="searchTicket">
                <div class="row">
                    <!-- Một chiều -->
                    <div class="col-md-6">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="ticket_type" id="one-way"
                                   value="one-way"
                                   checked>
                            <label class="form-check-label" for="one-way">Một chiều</label>
                        </div>
                        <label class="form-label">Điểm đi</label>
                        <input type="text" class="form-control" name="departure_location" placeholder="Nhập điểm đi"
                               required>
                        <label class="form-label">Ngày đi</label>
                        <input type="date" class="form-control" name="leaving_date" required>
                    </div>
                    <!-- Khứ hồi -->
                    <div class="col-md-6">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="ticket_type" id="round-trip"
                                   value="round-trip">
                            <label class="form-check-label" for="round-trip">Khứ hồi</label>
                        </div>
                        <label class="form-label">Điểm đến</label>
                        <input type="text" class="form-control" name="arrival_location" placeholder="Nhập điểm đến"
                               required>

                        <label class="form-label">Ngày về</label>
                        <input type="date" class="form-control" name="return_date" id="return-date" disabled>
                    </div>
                </div>

                <!-- Số lượng hành khách -->
                <div class="row mt-3">
                    <div class="col-md-4">
                        <label class="form-label">Người lớn</label>
                        <input type="number" class="form-control" name="adult_num" min="1" required>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Trẻ em</label>
                        <input type="number" class="form-control" name="kid_num" min="0">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Em bé</label>
                        <input type="number" class="form-control" name="baby_num" min="0">
                    </div>
                </div>
                <!-- Nút tìm vé -->
                <div class="text-center mt-3">
                    <button type="submit" class="btn btn-primary btn-lg">Tìm chuyến bay</button>
                </div>
            </form>
        </div>
    </div>
    <a href="customer/register.jsp"> chuyển hướng register</a><br>
    <a href="customer/login.jsp"> chuyển hướng login</a><br>
    <a href="customer/info.jsp"> chuyển hướng info</a><br>
    <a href="customer/payment.jsp"> chuyển hướng payment</a><br>
    <a href="customer/transaction_history.jsp"> chuyển hướng history</a><br>
    <a href="customer/change_password.jsp"> chuyển hướng change pw</a><br>
    <a href="customer/oneway_ticket.jsp"> chuyển hướng one way</a><br>
    <a href="customer/roundtrip_ticket.jsp"> chuyển hướng roundtrip</a><br>
    <script>
        const ticketTypeRadios = document.querySelectorAll('input[name="ticket_type"]');
        const returnDateInput = document.getElementById("return-date");
        ticketTypeRadios.forEach(radio => {
            radio.addEventListener("change", function () {
                returnDateInput.disabled = this.value === "one-way";
            });
        });
        document.getElementById("one-way").checked = true;

        document.addEventListener("DOMContentLoaded", function () {
            if (document.querySelector(".modal.show")) {
                var loginModal = new bootstrap.Modal(document.getElementById("loginModal"));
                loginModal.show();
            }
        });
    </script>
</div>
<%@ include file="/WEB-INF/view/common/footer.jsp" %>
