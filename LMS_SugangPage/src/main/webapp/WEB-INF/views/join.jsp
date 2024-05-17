<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 가입</title>
</head>
<body>
<h2>회원 가입</h2>
<form id="registerForm" action="/register" method="post">
    <label for="loginId">회원 아이디:</label>
    <input type="text" id="loginId" name="loginId" required>
    <br>
    <label for="userName">이름:</label>
    <input type="text" id="userName" name="userName" required>
    <br>
    <label for="pw">비밀번호:</label>
    <input type="password" id="pw" name="pw" required>
    <br>
    <label for="email">이메일:</label>
    <input type="email" id="email" name="email" required>
    <br>
    <input type="submit" value="가입">
</form>


</body>
</html>
