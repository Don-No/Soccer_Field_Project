<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error Page</title>
    <!-- Thêm các phần CSS hoặc thư viện khác nếu cần thiết -->
</head>
<body>
    <div style="text-align: center; margin-top: 50px;">
        <h1>Error Occurred</h1>
        <p>Sorry, an error occurred while processing your request.</p>
        <p>Error Details:</p>
        <p><%= exception.getMessage() %></p>
        <p><%= exception.getClass().getName() %></p>
    </div>
</body>
</html>
