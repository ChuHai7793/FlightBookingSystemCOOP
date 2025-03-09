
<%@ include file="/WEB-INF/view/common/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- Nội dung chính -->
<div class="container mt-3">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-3 border p-3">
            <a href="info.jsp" class="d-block mb-2 text-primary">Thông tin cá nhân</a>
            <a href="../customer?action=checkPaymentInfo" class="d-block mb-2 text-primary">Thanh toán</a>
            <a href="../customer?action=checkTransactionHistory" class="d-block mb-2 text-primary">Lịch sử giao dịch</a>
            <a href="change_password.jsp" class="d-block mb-2 text-primary">Đổi mật khẩu</a>
        </div>

        <!-- Nội dung chính -->
        <div class="col-md-9 border p-3">
            <c:if test="${not empty user}">
                <p><strong>Tên:</strong> ${user.fullName}</p>
                <p><strong>Ngày sinh:</strong> ${user.birthDate}</p>
                <p><strong>Giới tính:</strong> ${user.gender}</p>
                <p><strong>Địa chỉ:</strong> ${user.address}</p>
                <p><strong>Email:</strong> ${user.email}</p>
                <p><strong>Điện thoại:</strong> ${user.phone}</p>
                <p><strong>CCCD:</strong> ${user.nationalId}</p>
                <p><strong>Quốc tịch:</strong> ${user.nationality}</p>
            </c:if>
            <c:if test="${empty user}">
                <p>Không có thông tin người dùng!</p>
            </c:if>
            <button type="button" class="btn btn-primary" onclick="showEditForm()">Chỉnh sửa</button>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/view/common/footer.jsp" %>


<!-- Modal chỉnh sửa thông tin -->
<div class="modal fade" id="editInfo" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Chỉnh sửa thông tin</h5>
                <button type="button" class="btn-close" onclick="hideEditForm()" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="../customer" method="post"> <!-- Hiện tại đang ở /customer nên action="" -->
                    <input type="hidden" name="action" value="edit">
                    <input type="hidden" name="userId" value=${user.userId}>
                    <div class="mb-3">
                        <label for="name" class="form-label">Tên:</label>
                        <input type="text" class="form-control" id="name" name="name" value="${sessionScope.user.fullName}">
                    </div>
                    <div class="mb-3">
                        <label for="birth_date" class="form-label">Ngày sinh:</label>
                        <input type="date" class="form-control" id="birth_date" name="birth_date" value="${sessionScope.user.birthDate}">
                    </div>
                    <div class="mb-3">
                        <label for="address" class="form-label">Địa chỉ:</label>
                        <input type="text" class="form-control" id="address" name="address" value="${sessionScope.user.address}">
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email:</label>
                        <input type="email" class="form-control" id="email" name="email" value="${sessionScope.user.email}">
                    </div>
                    <div class="mb-3">
                        <label for="phone" class="form-label">Điện thoại:</label>
                        <input type="tel" class="form-control" id="phone" name="phone" value="${sessionScope.user.phone}">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" onclick="hideEditForm()">Hủy</button>
                        <input type="submit" class="btn btn-primary" value="Lưu thay đổi">
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script>
    function showEditForm() {
        var modal = new bootstrap.Modal(document.getElementById('editInfo'));
        modal.show();
    }

    function hideEditForm() {
        var modal = bootstrap.Modal.getInstance(document.getElementById('editInfo'));
        modal.hide();
    }
</script>
