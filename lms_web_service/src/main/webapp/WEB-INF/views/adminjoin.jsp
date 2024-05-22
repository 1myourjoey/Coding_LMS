<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>관리자 등록</title>
    <!-- Bootstrap CSS CDN 추가 -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            padding-top: 50px;
        }
        .container {
            max-width: 500px;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .btn-custom {
            background-color: #323232;
            color: white;
        }
        .btn-custom:hover {
            background-color: #505050;
        }
    </style>
</head>
<body>
<div class="container">
    <h2 class="text-center">관리자 등록</h2>
    <form id="registerForm" action="/adminregister" method="post">
        <div class="form-group">
            <label for="loginId">회원 아이디:</label>
            <input type="text" class="form-control" id="loginId" name="loginId" required>
        </div>
        <div class="form-group">
            <label for="userName">이름:</label>
            <input type="text" class="form-control" id="userName" name="userName" required>
        </div>
        <div class="form-group">
            <label for="pw">비밀번호:</label>
            <input type="password" class="form-control" id="pw" name="pw" required>
        </div>
        <div class="form-group">
            <label for="email">이메일:</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>
        <button type="submit" class="btn btn-custom btn-block">가입</button>
    </form>
</div>

<!-- jQuery 및 Bootstrap JS CDN 추가 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

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
