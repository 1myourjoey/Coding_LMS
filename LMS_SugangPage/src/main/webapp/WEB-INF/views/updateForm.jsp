<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정</title>
</head>
<body>
    <h2>회원 정보 수정</h2>
    <form action="/memberList/${loginId}/update" method="post">
    <input type="hidden" name="userNo" value="${user.userNo}">
    <input type="hidden" name="loginId" value="${user.loginId}">
    <label for="loginId">아이디:</label>
    <input type="text" id="loginId" name="loginId" value="${user.loginId}" readonly>
    <br>
    <label for="userName">이름:</label>
    <input type="text" id="userName" name="userName" value="${user.userName}">
    <br>
    <label for="pw">비밀번호:</label>
    <input type="password" id="pw" name="pw" value="${user.pw}">
    <br>
    <label for="email">이메일:</label>
    <input type="email" id="email" name="email" value="${user.email}">
    <br>
    <input type="submit" value="수정">
</form>

</body>
</html>
