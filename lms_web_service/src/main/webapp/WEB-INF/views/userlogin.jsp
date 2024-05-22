<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 20px;
        }

        #loginForm {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 300px;
            margin: auto;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #323232;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <form id="loginForm">
        <label for="loginId">ID:</label>
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
                        if (response === "user") {
                            // 사용자 로그인 성공 시 사용자 페이지로 이동
                            window.location.href = "/";
                        } else if (response === "admin") {
                            // 관리자 로그인 성공 시 관리자 페이지로 이동
                            window.location.href = "/indexadmin";
                        } else {
                            // 로그인 실패 시 알림 표시
                            alert("아이디 또는 비밀번호가 일치하지 않습니다.");
                        }
                    },
                    error: function() {
                        // 에러 발생 시 처리
                        alert("로그인 중 오류가 발생했습니다.");
                    }
                });
            });
        });
    </script>
</body>
</html>
