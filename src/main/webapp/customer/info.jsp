<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang cá nhân</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<!-- Navbar -->
<header>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Trang Chủ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Giới Thiệu</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Dịch Vụ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Liên Hệ</a>
                    </li>
                </ul>
                <select class="form-select w-auto" onchange="window.location.href=this.value;">
                    <option value="" selected>Tên</option>
                    <option value="" >Thông tin cá nhân</option>
                    <option value="logout.html">Đăng xuất</option>
                </select>
            </div>
        </div>
    </nav>
</header>

<div class="container-fluid mt-3">

    <div class="row">
        <div class="col-md-3 left-section border p-3">
            <a href="personal-info.html" class="d-block mb-2 text-primary">Thông tin cá nhân</a>
            <a href="payment.html" class="d-block mb-2 text-primary">Thanh toán</a>
            <a href="transaction-history.html" class="d-block mb-2 text-primary">Lịch sử giao dịch</a>
            <a href="change-password.html" class="d-block mb-2 text-primary">Đổi mật khẩu</a>
        </div>

        <div class="col-md-9 right-section border p-3 position-relative">
            <p>Tên: </p>
            <p>Ngày sinh: </p>
            <p>Địa chỉ: </p>
            <p>Email: </p>
            <p>Giới tính: </p>
            <p>Điện thoại: </p>
            <p>Xếp hạng: </p>
            <button type="button" class="btn btn-primary position-absolute bottom-0 end-0 m-3" onclick="showEditForm()">Chỉnh sửa</button>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="editInfo" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editModalLabel">Chỉnh sửa</h5>
                <button type="button" class="btn-close" onclick="hideEditForm()" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="mb-3">
                        <label for="name" class="form-label">Tên:</label>
                        <input type="text" class="form-control" id="name" name="name">
                    </div>

                    <div class="mb-3">
                        <label for="dob" class="form-label">Ngày sinh:</label>
                        <input type="date" class="form-control" id="dob" name="dob">
                    </div>

                    <div class="mb-3">
                        <label for="address" class="form-label">Địa chỉ:</label>
                        <input type="text" class="form-control" id="address" name="address">
                    </div>

                    <div class="mb-3 d-flex align-items-center">
                        <label class="form-label me-3">Giới tính:</label>
                        <div class="d-flex gap-3">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="gender" id="male" value="Nam">
                                <label class="form-check-label" for="male">Nam</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="gender" id="female" value="Nữ">
                                <label class="form-check-label" for="female">Nữ</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="gender" id="other" value="Khác">
                                <label class="form-check-label" for="other">Khác</label>
                            </div>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="email" class="form-label">Email:</label>
                        <input type="email" class="form-control" id="email" name="email">
                    </div>

                    <div class="mb-3">
                        <label for="phone" class="form-label">Điện thoại:</label>
                        <input type="tel" class="form-control" id="phone" name="phone">
                    </div>

                    <div class="mb-3">
                        <label for="passport" class="form-label">Hộ chiếu:</label>
                        <input type="text" class="form-control" id="passport" name="passport">
                    </div>

                    <div class="mb-3">
                        <label for="nationality" class="form-label">Quốc tịch:</label>
                        <input type="text" class="form-control" id="nationality" name="nationality">
                    </div>

                    <div class="mb-3">
                        <label for="avatar" class="form-label">Ảnh đại diện:</label>
                        <input type="file" class="form-control" id="avatar" name="avatar" accept="image/*">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" onclick="hideEditForm()">Hủy</button>
                <button type="submit" class="btn btn-primary">Sửa thông tin</button>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS và Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

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
</body>
</html>