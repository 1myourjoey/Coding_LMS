<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 등록</title>
</head>
<body>
<h2>관리자 등록</h2>
<form id="registerForm" action="/adminregister" method="post">
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

<script>
    document.getElementById("registerForm").addEventListener("submit", function(event) {
        event.preventDefault(); // 기본 제출 동작 막기

        // 폼 데이터 가져오기
        var formData = new FormData(this);

        // AJAX를 사용하여 서버로 데이터 전송
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/adminregister", true);
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // 응답 처리
                alert("등록이 완료되었습니다."); // 얼랏 창 띄우기
                // 리다이렉트
                window.location.href = "/indexadmin"; // 리다이렉트할 페이지 URL로 변경
            }
        };
        xhr.send(formData);
    });
</script>
</body>
</html>
