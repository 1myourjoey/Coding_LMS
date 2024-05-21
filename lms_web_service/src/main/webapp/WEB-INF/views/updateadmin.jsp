<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정</title>
</head>
<body>
    <h2>회원 정보 수정(관리자)</h2>
    <form id="updateForm" action="/memberList/${loginId}/updateadmin" method="post">
    <input type="hidden" name="userNo" value="${user2.userNo}">
    <input type="hidden" name="loginId" value="${user2.loginId}">
    <label for="loginId">아이디:</label>
    <input type="text" id="loginId" name="loginId" value="${user2.loginId}" readonly>
    <br>
    <label for="userName">이름:</label>
    <input type="text" id="userName" name="userName" value="${user2.userName}">
    <br>
    <label for="email">이메일:</label>
    <input type="email" id="email" name="email" value="${user2.email}">
    <br>
    <input type="submit" value="수정" onclick="return confirmUpdate();">
</form>

<script>
    function confirmUpdate() {
        return confirm("정말로 수정하시겠습니까?");
    }
</script>

</body>
</html>
