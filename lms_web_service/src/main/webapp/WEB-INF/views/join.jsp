<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 가입</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        var emconfirmchk = false;

        function checkDuplicate() {
            var loginId = document.getElementById("loginId").value;
            var email = document.getElementById("email").value;
            var password = document.getElementById("pw").value;

            // 비밀번호 길이 확인
            if (password.length < 6) {
                alert("비밀번호를 6글자 이상으로 설정해주세요.");
                return;
            }

            var xhr = new XMLHttpRequest();
            xhr.open("GET", "/checkDuplicate?loginId=" + loginId + "&email=" + email, true);
            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    var response = xhr.responseText;
                    if (response === "duplicate") {
                        alert("이미 사용 중인 아이디 또는 이메일입니다.");
                    } else {
                        if (emconfirmchk) {
                            document.getElementById("registerForm").submit();
                        } else {
                            alert("이메일 인증을 완료해주세요.");
                        }
                    }
                }
            };
            xhr.send();
        }
    </script>
    <script>
        $(document).ready(function() {
            var $checkEmail = $("#checkEmail");
            var $email = $("#email");
            var $emailconfirm = $("#emailconfirm");
            var $emailconfirmTxt = $("#emailconfirmTxt");

            $checkEmail.click(function() {
                $.ajax({
                    type: "POST",
                    url: "/generateEmailCode", // 수정된 부분
                    data: {
                        "email": $email.val()
                    },
                    success: function(data) {
                        alert("해당 이메일로 인증번호 발송이 완료되었습니다. \n 확인부탁드립니다.")
                        console.log("data : " + data);
                        chkEmailConfirm(data, $emailconfirm, $emailconfirmTxt);
                    }
                })
            });

            function chkEmailConfirm(data, $emailconfirm, $emailconfirmTxt) {
                $emailconfirm.on("keyup", function() {
                    $.ajax({
                        type: "POST",
                        url: "/verifyEmailCode",
                        data: {
                            "code": $emailconfirm.val()
                        },
                        success: function(response) {
                            if (response === "verified") {
                                emconfirmchk = true;
                                $emailconfirmTxt.html("<span id='mconfirmchk'>인증번호 확인 완료</span>")
                                $("#mconfirmchk").css({
                                    "color": "#0D6EFD",
                                    "font-weight": "bold",
                                    "font-size": "10px"
                                });
                            } else {
                                emconfirmchk = false;
                                $emailconfirmTxt.html("<span id='emconfirmchk'>인증번호가 잘못되었습니다</span>")
                                $("#emconfirmchk").css({
                                    "color": "#FA3E3E",
                                    "font-weight": "bold",
                                    "font-size": "10px"
                                });
                            }
                        }
                    });
                });
            }

            // 폼 제출 시에도 인증 확인
            $("#registerForm").submit(function(event) {
                event.preventDefault();
                checkDuplicate();
            });
        });
    </script>
    <!-- 부트스트랩 CDN 추가 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            padding: 50px;
        }

        .form-label {
            font-weight: bold;
        }

        .form-control {
            margin-bottom: 10px;
        }

        .btn-submit {
            background-color: #323232;
            border-color: #323232;
            color: #ffffff;
        }

        .btn-submit:hover {
            background-color: #323232;
            border-color: #0056b3;
        }

        .container-md {
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            max-width: 600px; /* 폼의 최대 너비를 설정합니다. */
            margin: auto; /* 가운데 정렬을 위해 margin을 auto로 설정합니다. */
        }

        .btn-outline-primary {
            color: #fff;
            background-color: #323232;
            border-color: #323232;
        }

        .btn-outline-primary:hover {
            color: #0056b3;
            border-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container-md">
<h2>회원 가입</h2>
<form id="registerForm" action="/register" method="post">
    <div style="display: flex; flex-direction: column;">
        <label for="loginId">회원 아이디:</label>
        <input type="text" id="loginId" name="loginId" required>
    </div>
    <div style="display: flex; flex-direction: column;">
        <label for="userName">이름:</label>
        <input type="text" id="userName" name="userName" required>
    </div>
    <div style="display: flex; flex-direction: column;">
        <label for="pw">비밀번호:</label>
        <input type="password" id="pw" name="pw" required>
        <br>
        <div class="form-group last mb-4 email_input">
        <br>
            <label for="email" id="mailTxt">이메일을 입력해주세요</label>
            <input type="text" class="form-control" name="email" id="email">
        </div>
        <button class="btn btn-outline-primary" type="button" id="checkEmail">인증번호 전송</button>
        <br>
        <br>
        <div class="form-group last mb-4 check_input">
            <label for="emailconfirm" id="emailconfirmTxt">인증번호를 입력해주세요</label>
            <input type="text" class="form-control" id="emailconfirm">
        </div>
        <input type="submit" class="btn btn-submit" value="가입">
    </form>
</div>
<!-- 부트스트랩 자바스크립트 CDN -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
