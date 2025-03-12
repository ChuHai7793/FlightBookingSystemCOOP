<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/common/header.jsp" %>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

<div class="container-fluid account-container">
    <div class="row">
        <!-- Menu tài khoản: 25% -->
        <div class="col-md-3">
            <%@ include file="/WEB-INF/view/common/account_menu.jsp" %>
        </div>

        <!-- Main Content -->
        <div class="col-md-9 border p-3">
            <div class="row">
                <form action="../customer" method="post">
                    <input type="hidden" name="action" value="changePassword">

                    <div class="mb-3">
                        <label for="current-password" class="form-label">Mật khẩu hiện tại:</label>
                        <input type="password" class="form-control" id="current-password" name="current_password" required>
                    </div>

                    <div class="mb-3">
                        <label for="new-password" class="form-label">Nhập mật khẩu mới:</label>
                        <input type="password" class="form-control" id="new-password" name="new_password" required>
                    </div>

                    <div class="mb-3">
                        <label for="confirm-password" class="form-label">Xác nhận mật khẩu:</label>
                        <input type="password" class="form-control" id="confirm-password" name="confirm_password" required>
                    </div>

                    <div class="d-flex justify-content-end">
                        <button type="submit" class="btn btn-primary">Đổi mật khẩu</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap Modal -->
<div class="modal fade" id="alertChangePWModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Thông báo</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                ${alertMessage}
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">OK</button>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        var message = "<%= request.getAttribute("alertMessage") %>";
        if (message && message !== "null") {
            var myModal = new bootstrap.Modal(document.getElementById('alertChangePWModal'));
            myModal.show();
        }
    });
</script>

<%@ include file="/WEB-INF/view/common/footer.jsp" %>
