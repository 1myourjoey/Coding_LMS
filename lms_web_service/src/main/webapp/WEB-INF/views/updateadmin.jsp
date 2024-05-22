<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 20px;
        }

        h2 {
            margin-bottom: 20px;
            text-align: center;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: auto;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
            text-align: left;
        }

        input[type="text"],
        input[type="email"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #323232;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
    <script>
        function confirmUpdate() {
            return confirm("정말로 수정하시겠습니까?");
        }
    </script>
</head>
<body>
    <form id="updateForm" action="/memberList/${loginId}/updateadmin" method="post">
        <h2>회원 정보 수정(관리자)</h2>
        <input type="hidden" name="userNo" value="${user2.userNo}">
        <input type="hidden" name="loginId" value="${user2.loginId}">
        <label for="loginId">아이디</label>
        <input type="text" id="loginId" name="loginId" value="${user2.loginId}" readonly>
        <label for="userName">이름</label>
        <input type="text" id="userName" name="userName" value="${user2.userName}">
        <label for="email">이메일</label>
        <input type="email" id="email" name="email" value="${user2.email}">
        <input type="submit" value="수정" onclick="return confirmUpdate();">
    </form>
    <!-- 부트스트랩 자바스크립트 CDN -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
