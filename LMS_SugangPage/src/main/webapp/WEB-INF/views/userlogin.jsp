<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
</head>
<body>
    <form id="loginForm">
        <label for="loginId"> ID:</label>
        <input type="text" id="loginId" name="loginId" required><br><br>
        <label for="pw">Password:</label>
        <input type="password" id="pw" name="pw" required><br><br>
        <button type="submit">Login</button>
    </form>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            $("#loginForm").submit(function(event) {
                event.preventDefault(); // 폼 기본 동작 방지

                $.ajax({
                    type: "POST",
                    url: "/setlogin",
                    data: {
                        loginId: $("#loginId").val(),
                        pw: $("#pw").val()
                    },
                    success: function(response) {
                        if (response === "success") {
                            // 로그인 성공 시 홈 페이지로 이동
                            window.location.href = "/index";
                           
                        } else {
                            // 로그인 실패 시 팝업창 띄우기
                            alert("아이디 또는 패스워드가 일치하지 않습니다.");
                        }
                    },
                    error: function() {
                        // 에러 발생 시 처리
                        alert("An error occurred during login.");
                    }
                });
            });
        });
    </script>
</body>
</html>
