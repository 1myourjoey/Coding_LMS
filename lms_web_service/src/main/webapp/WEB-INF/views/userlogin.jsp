<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>


    <style>
           /* normalize */
           body, ul, li {
               padding:0;
               margin:0;
               list-style:none;
           }

           a {
               color:inherit;
               text-decoration:none;
           }

           /* customize */
           /* font */
           @font-face {
               font-family: 'LotteMartDream';
               font-style: normal;
               font-weight: 400;
               src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff') format('woff');
           }
           @font-face {
               font-family: 'LotteMartDream';
               font-style: normal;
               font-weight: 700;
               src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamBold.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamBold.woff') format('woff');
           }
           @font-face {
               font-family: 'LotteMartDream';
               font-style: normal;
               font-weight: 300;
               src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamLight.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamLight.woff') format('woff');
           }
           html {
               font-family: 'LotteMartDream', sans-serif;
           }

           /* setting */
           :root {
               --site-width:1200px;
           }

           .con-min-width {
               min-width:var(--site-width);
               padding:0 330px;
               justify-content: flex-end; /* 수정 */
           }

           .con {
               width:var(--site-width);
           }

           /* menu-bar */
           .menu-bar {
               margin-top:0px;
           }

           .menu-bar__box {
               display: flex; /* 수정 */
               justify-content: center; /* 가운데 정렬 */
               border-bottom: 1px solid black; /* 검은 줄 추가 */
           }

           .menu-bar__box > li {
               margin: 0 10px; /* 간격 조절 */
           }

           .menu-bar__box > li > a {
               padding:10px 50px;
               display:block;
               font-weight:700;
               font-size:1.2rem;
           }

           .menu-bar__box > li:hover > a {
               color:gray;
               text-decoration:underline;
           }
           .logo-img {
               width: 100px; /* 로고 이미지의 너비 */
               height: auto; /* 자동으로 높이 설정 */
               margin-left: 130px; /* 로고 이미지를 오른쪽으로부터 130px만큼 떨어지도록 설정하여 좀 더 왼쪽으로 이동시킵니다. */
               margin-top: 40px; /* 로고 이미지를 아래로 40px 이동시킵니다. */
           }

           .logout-link {
               position: absolute;
               top: 50px;
               right: 20px;
               font-weight: bold;
               margin-right: 100px;
           }

           body {
               font-family: Arial, sans-serif;
               background-color: #ffff;
               padding: 30px;
           }

          #loginForm {
              background-color: #fff;
              padding: 20px;
              border-radius: 5px;
              box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
              max-width: 800px;
              margin: auto;
              min-height: 500px; /* 최소 높이 설정 */
              text-align: center; /* 폼 내부의 텍스트와 요소를 가운데 정렬 */
          }

           label {
               font-weight: bold;
               margin-bottom: 5px;
           }

           input[type="text"] {
                          width: 70%;
                          padding: 10px;
                          margin-top: 90px;
                          margin-bottom: 20px;
                          border: 1px solid #ccc;
                          border-radius: 4px;
                          box-sizing: border-box;
           }
           input[type="password"] {
               width: 70%;
               padding: 10px;
               margin-bottom: 60px;
               border: 1px solid #ccc;
               border-radius: 4px;
               box-sizing: border-box;
           }

           button[type="submit"] {
               width: 60%;
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
     <link rel="stylesheet" href="/css/styles.css">
       <img src="/img/lms.png" alt="로고" class="logo-img">
</head>
<body>

    <a href="/logout" class="logout-link">로그아웃</a> <!-- 로그아웃 링크 추가 -->
    <nav class="menu-bar con-min-width">
        <div class="con text-align-center">

          <ul class="menu-bar__box">
            <li><a href="/">HOME</a></li>
            <li><a href="/sugangReg">수강신청</a></li>
            <li><a href="/content">교육과정</a></li>
            <li><a href="/boardlistuser">자료실</a></li>
            <li><a href="/post">공지사항</a></li>
            <li><a href="/qna/openQnaList.do">Q&A</a></li>
          </ul>
        </div>
      </nav>

     <br><br><br><br><br><br>
    <form id="loginForm">
        <h1>LogIn</h1>
        <label for="loginId">ID:</label>
        <input type="text" id="loginId" name="loginId" required><br><br>
        <label for="pw">PW:</label>
        <input type="password" id="pw" name="pw" required><br><br>
        <button type="submit">Login</button>
        <br><br><br>
        <td><a href="/join">회원가입</a></td>

    </form>
      <br><br><br><br>
<footer id="footer">
    <div class="foot-quick">
    </div>
    <div class="inner">
        <div class="f-cnt">
            <div class="f-info">
                <p class="info-addr">(04104) 서울 마포구 신촌로 176 중앙빌딩 중앙정보처리학원</p>
                <ul class="info-cs">

                    <li><strong class="strong">사업자 등록번호 : 220-95-00629</strong><span class="span"></span>
                    <li><strong class="strong">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 대표전화 : 02-704-1711</strong><span class="span">(평일 09시~18시)</span></li>
                    <li><strong class="strong">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FAX : 02-393-9218</strong><span class="span"></span>
                    </li>
                </ul>
            </div>

            <div class="f-link">
                <div class="link-go">
                    <a href="#" class="btn btn-txt sm ico-arr">찾아오시는 길</a>
                    <a href="#" class="btn btn-txt sm ico-arr">이용안내</a>
                    <a href="#" class="btn btn-txt sm ico-arr">직원검색</a>
                </div>
            </div>
        </div>

        <div class="f-btm">
            <div class="f-btm-text">
                <div class="f-menu">
                    <a href="#" class="point">개인정보처리방침</a>
                    <a href="#">저작권 정책</a>
                    <a href="#">웹 접근성 품질인증 마크 획득</a>
                </div>
                <p class="f-copy">© Ministry of Education. All rights reserved.</p>
            </div>
            <div class="f-btm-ban">
            </div>
        </div>
    </div>
</footer>

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
