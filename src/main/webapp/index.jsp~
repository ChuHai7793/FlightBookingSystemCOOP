<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/common/header.jsp" %>
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
                            <input type="text" class="form-control" name="username" placeholder="Tài khoản" required>
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
                            <a hrer="#" class=="text-decoration-none">Đăng ký</a>
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


    <!-- Form đặt vé -->
    <div class="container mt-4">
        <div class="card shadow-lg p-4 booking-form">
            <h2 class="text-primary text-center">Đặt vé máy bay</h2>
            <form action="BookingServlet" method="POST">
                <div class="row">
                    <!-- Một chiều -->
                    <div class="col-md-6">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="ticket_type" id="one-way" value="one-way"
                                   checked>
                            <label class="form-check-label" for="one-way">Một chiều</label>
                        </div>
                        <label class="form-label">Điểm đi</label>
                        <input type="text" class="form-control" name="departure" placeholder="Nhập điểm đi" required>

                        <label class="form-label">Ngày đi</label>
                        <input type="date" class="form-control" name="departure_date" required>
                    </div>

                    <!-- Khứ hồi -->
                    <div class="col-md-6">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="ticket_type" id="round-trip"
                                   value="round-trip">
                            <label class="form-check-label" for="round-trip">Khứ hồi</label>
                        </div>
                        <label class="form-label">Điểm đến</label>
                        <input type="text" class="form-control" name="destination" placeholder="Nhập điểm đến" required>

                        <label class="form-label">Ngày về</label>
                        <input type="date" class="form-control" name="return_date" id="return-date" disabled>
                    </div>
                </div>

                <!-- Số lượng hành khách -->
                <div class="row mt-3">
                    <div class="col-md-4">
                        <label class="form-label">Người lớn</label>
                        <input type="number" class="form-control" name="adults" min="1" required>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Trẻ em</label>
                        <input type="number" class="form-control" name="children" min="0">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Em bé</label>
                        <input type="number" class="form-control" name="infants" min="0">
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
