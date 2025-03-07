<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/common/header.jsp" %>
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
    <div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="loginModalLabel">Đăng nhập</h3>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="LoginServlet" method="POST">
                        <div class="mb-3">
                            <input type="text" class="form-control" name="email" placeholder="Tài khoản" required>
                        </div>
                        <div class="mb-3">
                            <input type="password" class="form-control" name="password" placeholder="Mật khẩu" required>
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
                        <div class="social-login mt-3">
                            <button type="button" class="btn facebook-btn text-white w-100 mb-2">Đăng nhập bằng
                                Facebook
                            </button>
                            <button type="button" class="btn google-btn text-white w-100">Đăng nhập bằng Gmail</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- JavaScript để tự động mở modal nếu có lỗi -->
    <script>
        <c:if test="${not empty errorMessage}">
        var myModal = new bootstrap.Modal(document.getElementById('loginModal'));
        myModal.show();
        </c:if>
    </script>
    <!--Model Đăng Ký-->
    <div class="modal fade" id="registerModal" tabindex="-1" aria-labelledby="registerModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="registerModalLabel">Đăng ký tài khoản</h3>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="RegisterServlet" method="POST">
                        <div class="mb-3">
                            <input type="text" class="form-control" name="full_name" placeholder="Họ và tên" required>
                        </div>
                        <div class="mb-3">
                            <input type="text" class="form-control" name="phone" placeholder="Số điện thoại" required>
                        </div>
                        <div class="mb-3">
                            <input type="email" class="form-control" name="email" placeholder="Email" required>
                        </div>
                        <div class="mb-3">
                            <input type="password" class="form-control" name="password" placeholder="Mật khẩu" required>
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
                            <span class="text-muted">Hoặc đăng ký bằng</span>
                        </div>
                        <div class="social-login mt-3">
                            <button type="button" class="btn facebook-btn text-white w-100 mb-2">Đăng ký bằng Facebook
                            </button>
                            <button type="button" class="btn google-btn text-white w-100">Đăng ký bằng Gmail</button>
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
            <form action="/customer" method="GET">
                <div class="row">
                    <!-- Một chiều -->
                    <div class="col-md-6">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="ticket_type" id="one-way" value="one-way"
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

    <script>
        const ticketTypeRadios = document.querySelectorAll('input[name="ticket_type"]');
        const returnDateInput = document.getElementById("return-date");
        ticketTypeRadios.forEach(radio => {
            radio.addEventListener("change", function () {
                returnDateInput.disabled = this.value === "one-way";
            });
        });
        document.getElementById("one-way").checked = true;
    </script>
</div>
<%@ include file="/WEB-INF/view/common/footer.jsp" %>
