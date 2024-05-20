<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정</title>
</head>
<body>
    <h2>회원 정보 수정</h2>
    <form action="/memberList/${loginId}/passwordupdate" method="post">
    <input type="hidden" name="loginId" value="${user.loginId}">
    <label for="newPassword">새 비밀번호:</label>
    <input type="password" id="newPassword" name="newPassword">
    <br>
    <label for="confirmPassword">비밀번호 확인:</label>
    <input type="password" id="confirmPassword" name="confirmPassword">
    <br>
    <input type="submit" value="수정">
</form>

</body>
</html>
