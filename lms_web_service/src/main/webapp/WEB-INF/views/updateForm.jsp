<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정</title>
    <!-- 부트스트랩 CDN 추가 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
           font-family:
           Arial, sans-serif;
           background-color: #f4f4f4;
           padding: 20px;
        }

        .form-label {
            font-weight: bold;
        }

        .form-control {
            margin-bottom: 10px;
        }

        .btn-submit {
            width: 100%;
            padding: 10px;
             background-color: #323232;
             color: #fff;
             border: none;
             border-radius: 4px;
             cursor: pointer;
             transition: background-color 0.3s ease;
        }

        .btn-submit:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }


        form {
                    background-color: #fff;
                    padding: 20px;
                    border-radius: 5px;
                    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                    max-width: 800px;
                    margin: auto;
                }

    </style>
</head>
<body>
    <div class="container">

        <form action="/memberList/${loginId}/update" method="post" >
            <div class="mb-3">
                <input type="hidden" name="userNo" value="${user.userNo}">
                <input type="hidden" name="loginId" value="${user.loginId}">
            </div>
            <h2>회원 정보 수정</h2>
            <br><br>
            <div class="mb-3">
                <label for="loginId" class="form-label">아이디</label>
                <input type="text" id="loginId" name="loginId" value="${user.loginId}" class="form-control" readonly>
            </div><br>
            <div class="mb-3">
                <label for="userName" class="form-label">이름</label>
                <input type="text" id="userName" name="userName" value="${user.userName}" class="form-control">
            </div><br>
            <div class="mb-3">
                <label for="email" class="form-label">이메일</label>
                <input type="email" id="email" name="email" value="${user.email}" class="form-control">
            </div><br>
            <button type="submit" class="btn btn-submit btn btn-primary">수정</button>
        </form>
    </div>

    <!-- 부트스트랩 자바스크립트 CDN -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
