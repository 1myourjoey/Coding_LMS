<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 가입</title>
    <script>
        function checkDuplicate() {
            var loginId = document.getElementById("loginId").value;
            var email = document.getElementById("email").value;

            var xhr = new XMLHttpRequest();
            xhr.open("GET", "/checkDuplicate?loginId=" + loginId + "&email=" + email, true);
            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    var response = xhr.responseText;
                    if (response === "duplicate") {
                        // 중복이 발생한 경우 경고 창 표시
                        alert("이미 사용 중인 아이디 또는 이메일입니다.");
                    } else {
                        // 중복이 발생하지 않은 경우 폼을 제출
                        document.getElementById("registerForm").submit();
                    }
                }
            };
            xhr.send();
        }
    </script>
</head>
<body>
<h2>회원 가입</h2>
<form id="registerForm" action="/register" method="post" onsubmit="event.preventDefault(); checkDuplicate();">
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
