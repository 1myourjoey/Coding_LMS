<%@page import="com.sky.lms_web_service.dto.User"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원정보 수정</title>
<link rel="stylesheet" href="css/styles.css">
 <img src="/img/lms.png" alt="로고" class="logo-img">
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
    crossorigin="anonymous">
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
            /* 버튼과 링크의 배경색과 글꼴 색상 변경 */
            .btn-primary,
            .btn-primary:hover,
            .btn-primary:active,
            .btn-primary:focus,
            .page-link {
                background-color: #323232;
                border-color: #323232;
                color: #ffffff;
            }


            /* 페이지네이션 링크의 색상 변경 */
            .pagination a.page-link {
            border-color: #323232;
                color: #323232;
            }
        </style>
</head>
<body>
     <a href="/logout" class="logout-link">로그아웃</a> <!-- 로그아웃 링크 추가 -->
            <nav class="menu-bar con-min-width">
                <div class="con text-align-center">

                  <ul class="menu-bar__box">
                    <li><a href="/indexadmin">HOME</a></li>
                    <li><a href="/sugangReg">수강신청</a></li>
                    <li><a href="/content">교육과정</a></li>
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
                    <th>관리자 여부</th>
                    <th>수정</th>
                    <th>삭제</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${userList1}" var="user">
                    <tr>
                        <td>${user.userNo}</td>
                        <td>${user.loginId}</td>
                        <td>${user.userName}</td>
                        <td>${user.email}</td>
                        <td>${user.adminYn}</td>
                        <td><a href="/memberList/${user.loginId}/adminupdateform">수정</a></td>
                        <td><a href="#" onclick="confirmDelete('${user.loginId}')">삭제</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    <a href="/adminjoin" class="btn btn-primary">관리자 등록</a>

        <br>
    </div>

    <div class="pagination justify-content-center">
        <c:if test="${currentPage > 1}">
            <a href="/memberlistadmin?page=${currentPage - 1}&size=${size}" class="page-link">이전</a>
        </c:if>
        <c:forEach begin="1" end="${totalPages}" step="1" varStatus="loop">
            <c:choose>
                <c:when test="${currentPage == loop.index}">
                    <span class="page-link">${loop.index}</span>
                </c:when>
                <c:otherwise>
                    <a href="/memberlistadmin?page=${loop.index}&size=${size}" class="page-link">${loop.index}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:if test="${currentPage < totalPages}">
            <a href="/memberlistadmin?page=${currentPage + 1}&size=${size}" class="page-link">다음</a>
        </c:if>
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
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>

    <script>
        function confirmDelete(loginId) {
            if (confirm("정말로 삭제하시겠습니까?")) {
                window.location.href = "/memberList/" + loginId + "/delete";
            } else {
                // 취소 버튼을 누른 경우 아무런 동작 없음
            }
        }
    </script>
</body>
</html>
