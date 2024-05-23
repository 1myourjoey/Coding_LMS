<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시글 상세 화면</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/styles.css">
     <a href="/">
           <img src="/img/lms.png" class="logo-img" alt="로고 이미지">
       </a>
    <style>
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
    footer {
                                   position: absolute;
                                   bottom: 0;
                                   width: 100%;
                                   height: 100px; /* 적절한 높이로 조정하세요 */
                               }

    </style>
</head>
<body>
<a href="/logout" class="logout-link">로그아웃</a> <!-- 로그아웃 링크 추가 -->
    <nav class="menu-bar con-min-width">
        <div class="con text-align-center">

          <ul class="menu-bar__box">
            <li><a href="/">HOME</a></li>
            <li><a href="/sugangReg">수강신청</a></li>
             <li><a href="/sugangList">수강목록</a></li>
            <li><a href="/boardlistuser">자료실</a></li>
            <li><a href="/post">공지사항</a></li>
            <li><a href="/qna/openQnaList.do">Q&A</a></li>
          </ul>
        </div>
      </nav>

<div class="container mt-5">
    <h2>공지사항</h2>
    <form action="insert" method="post">
        <table class="table table-bordered">
            <input type="hidden" name="hitCnt" value="0"> <!-- hitCnt 필드를 히든 필드로 추가 -->
         <!--    <div class="form-group">
                            <label for="userNO">관리자 번호</label>
                            <input type="text" class="form-control" id="userNO" name="userNO" readonly>
                        </div>-->
            <div class="form-group">
                <label for="postTitle">제목</label>
                <input type="text" class="form-control" id="postTitle" name="postTitle" placeholder="제목을 입력하세요">
            </div>
            <div class="form-group">
                <label for="postContents">내용</label>
                <textarea class="form-control" id="postContents" name="postContents" rows="7" placeholder="내용을 입력하세요"></textarea>
            </div>

            <button type="submit" class="btn" onclick="return checkForm()" style="background-color: #323232; color: white;">등록</button>

                &nbsp;

            <a href="/post" id="list" class="btn" style=" background-color: #323232; color: white;">목록으로</a>
        </table>
    </form>
</div>


<footer id="footer">
    <div class="foot-quick">
    </div>
    <div class="inner">
        <div class="f-cnt">
            <div class="f-info">
                <p class="info-addr">(04104) 서울 마포구 신촌로 176 중앙빌딩 중앙정보처리학원</p>
                <ul class="info-cs">

                    <li><strong class="strong">사업자 등록번호 : 220-95-00629</strong><span class="span"></span>
                    <li><strong class="strong">대표전화 : 02-704-1711</strong><span class="span">(평일 09시~18시)</span></li>
                    <li><strong class="strong"> FAX : 02-393-9218</strong><span class="span"></span>
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







<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script>
        function checkForm() {
            var postTitle = document.getElementById("postTitle").value;
            var postContents = document.getElementById("postContents").value;

            if (postTitle === "" && postContents === "") {
                alert("제목과 내용을 입력하세요.");
                return false;
            } else if (postTitle === "") {
                alert("제목을 입력하세요.");
                return false;
            } else if (postContents === "") {
                alert("내용을 입력하세요.");
                return false;
            }
            return true;
        }
    </script>

</body>
</html>
