<%@page import="com.sky.lms_web_service.dto.User"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="css/styles.css">
 <img src="/img/lms.png" alt="로고" class="logo-img">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>개인정보 수정</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
    crossorigin="anonymous"/>
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
            crossorigin="anonymous"></script>
</head>
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
</style>

<body>
     <a href="/logout" class="logout-link">로그아웃</a> <!-- 로그아웃 링크 추가 -->
        <nav class="menu-bar con-min-width">
            <div class="con text-align-center">

              <ul class="menu-bar__box">
                <li>
                                        <c:choose>
                                    <c:when test="${sessionScope.loggedInUser != null && sessionScope.loggedInUser.adminYn eq 'Y'}">
                                        <a href="/indexadmin">HOME</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="/">HOME</a>
                                    </c:otherwise>
                                </c:choose>
                            </li>
                <li><a href="/sugangReg">수강신청</a></li>
                <li><a href="/sugangList">수강목록</a></li>
                <li><a href="/board/openBoardList.do">자료실</a></li>
                <li><a href="/post">공지사항</a></li>
                <li><a href="/qna/openQnaList.do">Q&A</a></li>
              </ul>
            </div>
          </nav>

    <div class="container" style="padding-top: 50px;">
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>No</th>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>이메일</th>
                    <th>개인정보 수정</th>
                    <th>비밀번호 수정</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${userList}" var="user">
                    <tr>
                        <td>${user.userNo}</td>
                        <td>${user.loginId}</td>
                        <td>${user.userName}</td>
                        <td>${user.email}</td>
                        <td><a href="/memberList/${user.loginId}/updateForm">개인정보 수정</a></td>
                        <td><a href="/memberList/${user.loginId}/passwordupdate">비밀번호 수정</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <br>
    </div>
<br><br><br><br><br><br><br>
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
</body>
</html>