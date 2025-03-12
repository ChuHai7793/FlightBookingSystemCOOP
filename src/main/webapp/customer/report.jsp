<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Báo cáo nhân viên</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; }
        table { width: 80%; margin: 20px auto; border-collapse: collapse; background: white; }
        th, td { padding: 10px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background-color: #4CAF50; color: white; }
    </style>
</head>
<body>

<h2 style="text-align: center;">Báo cáo Nhân viên phòng vé ngày ${date}</h2>

<table>
    <tr>
        <th>ID</th>
        <th>Họ Tên</th>
        <th>Email</th>
        <th>Điện thoại</th>
        <th>Địa chỉ</th>
        <th>Ngày sinh</th>
    </tr>
    <c:forEach var="staff" items="${staffList}">
        <tr>
            <td>${staff.userId}</td>
            <td>${staff.fullName}</td>
            <td>${staff.email}</td>
            <td>${staff.phone}</td>
            <td>${staff.address}</td>
            <td>${staff.birthDate}</td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
