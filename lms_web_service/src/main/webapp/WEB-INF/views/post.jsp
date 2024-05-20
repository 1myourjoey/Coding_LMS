<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>부트스트랩 네비게이션 바</title>
    <!-- 부트스트랩 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- 부트스트랩 아이콘 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">

    <style>
        body, html {
            height: 100%;
            margin: 0;
            padding-bottom: 250px;
        }

        .container {
            z-index: 2;
            width: 1300px;
            margin: 0 auto;
        }

        footer {
            background-color: #2c3e50;
            color: #ffffff;
            font-family: Arial, sans-serif;
            border-top: 200px solid #ffffff;
        }

        .wrap-footer {
            max-width: 1000px;
            top: 100px;
            margin: 20px;
            height: 250px;
            display: flex;
            flex-direction: column;
        }

        .footer-top-wrap {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            flex-direction: row;
        }

        .footer2 {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
        }

        .footer2 a {
            text-decoration: none;
            color: white;
        }

        .footer2 a::before {
            content: "•";
            margin-right: 5px;
        }

        .logos img {
            max-width:  20%;
            height: auto;
            margin-bottom: 10px;
            filter: grayscale(100%);
        }

        .personalinfo,
        .address {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .personalinfo li,
        .address li {
            margin-bottom: 5px;
        }

        .footer-btm-wrap {
            margin-top: 100px;
        }

        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            min-width: 160px;
            z-index: 1;
            flex-direction: column;
        }

        .dropdown:hover .dropdown-content {
            display: flex;
        }

        .dropdown-content a {
            color: #000000;
            text-decoration: none;
            margin: 10px;
        }

        .navbar-nav {
            position: absolute;
            left: 30%;
            transform: translateX(-50%);
            font-family: 'Roboto', sans-serif;
            font-size: 18px;
            color: #333;
            letter-spacing: 1px;
        }

        .nav-link {
            margin-right: 80px;
        }

        .btn-primary {
            width: 200px;
        }

        table {
            border-collapse: collapse;
            border-spacing: 0;
        }

        section.notice {
            padding: 80px 0;
        }

        .page-title {
            margin-bottom: 60px;
        }

        .page-title h3 {
            font-size: 28px;
            color: #333333;
            font-weight: 400;
            text-align: center;
        }

        #board-search .search-window {
            padding: 15px 0;
            background-color: #f9f7f9;
        }

        #board-search .search-window .search-wrap {
            position: relative;
            width: 80%;
            max-width: 564px;
        }

        #board-search .search-window .search-wrap input {
            height: 40px;
            width: 100%;
            font-size: 14px;
            padding: 7px 14px;
            border: 1px solid #ccc;
        }

        #board-search .search-window .search-wrap input:focus {
            border-color: #333;
            outline: 0;
            border-width: 1px;
        }

        #board-search .search-window .search-wrap .btn {
            position: absolute;
            right: 0;
            top: 0;
            bottom: 0;
            width: 108px;
            padding: 0;
            font-size: 16px;
        }

        .board-table {
            font-size: 13px;
            width: 100%;
            border-top: 1px solid #ccc;
            border-bottom: 1px solid #ccc;
        }

        .board-table a {
            color: #333;
            display: inline-block;
            line-height: 1.4;
            word-break: break-all;
            vertical-align: middle;
        }

        .board-table a:hover {
            text-decoration: underline;
        }

        .board-table th {
            text-align: center;
        }

        .board-table .th-num {
            width: 100px;
            text-align: center;
        }

        .board-table .th-date {
            width: 200px;
        }

        .board-table th, .board-table td {
            padding: 14px 0;
        }

        .board-table tbody td {
            border-top: 1px solid #e7e7e7;
            text-align: center;
        }

        .board-table tbody th {
            padding-left: 28px;
            padding-right: 14px;
            border-top: 1px solid #e7e7e7;
            text-align: left;
        }

        .board-table tbody th p{
            display: none;
        }
    </style>



</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <!-- 로고 -->
        <a href="index">
                <h1>LMS</h1>
            </a>

        <!-- 네비게이션 토글 버튼 -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- 네비게이션 메뉴 -->
        <div class="navbar-nav">
            <div class="dropdown">
                <a class="nav-link" href="#">강좌</a>
                <div class="dropdown-content">
                    <a href="lecex">나의 강좌 목록</a>
                    <a href="/">수강 신청</a>
                </div>
            </div>
            <div class="dropdown">
                <a class="nav-link" href="#">공지사항</a>
                <div class="dropdown-content">
                    <a href="#">서브메뉴2-1</a>
                    <a href="#">서브메뉴2-2</a>
                </div>
            </div>
        </div>

        <div style="margin-top: 0px; text-align: right; padding-right: 0px;">
          <a href="/logout">로그아웃</a>
        </div>
    </div>
</nav>





<!-- 값 보여주는 란 -->
<section class="notice">
    <div class="page-title">
        <div class="container">
            <h3>공지사항</h3>
        </div>
    </div>


    <div id="board-list">
        <div class="container">
            <table class="board-table">
                <thead>
                <tr>
                    <th scope="col" class="th-num">번호</th>
                  <!--  <th scope="col" class="th-user"></th>-->
                    <th scope="col" class="th-title">제목</th>
                  <!--  <th scope="col" class="th-title">내용</th> -->
                    <th scope="col" class="th-date">등록일</th>
                    <th scope="col" class="th-date">조회수</th>

                </tr>
                </thead>
            <tbody>
                <c:forEach items="${plist}" var="post">
                    <tr>
                        <td>${post.postNum}</td>
                   <!--   <td>${post.userNo}</td> -->
                      <td><a href="postlist?postNum=${post.postNum}">${post.postTitle}</a></td>

                        <!--   <td>${post.postContents}</td>-->
                        <td>${post.postCreated}</td>
                        <td>${post.hitCnt}</td>
                    </tr>
                </c:forEach>
            </tbody>
            </table>
        </div>
    </div>

</section>
<div style="margin-top: 20px; text-align: right; padding-right: 100px;">
    <c:if test="${sessionScope.loggedInUser != null && sessionScope.loggedInUser.adminYn eq 'Y'}">
        <a href="postinsert" class="btn btn-secondary btn-sm" id="btn_q" style="margin-left: 10px;">
            등록
        </a>
    </c:if>
</div>


<footer>
    <div class="wrap-footer">
        <div class="footer-top-wrap">

            <div class="footer2">
                <ul class="personalinfo">
                    <li><a href="https://ltikorea.or.kr/kr/contents/policy/view.do">개인정보처리방침</a></li>
                    <li><a href="https://ltikorea.or.kr/kr/contents/about_inst_5/view.do">오시는길</a></li>
                    <li><a href="https://ltikorea.or.kr/kr/contents/userAgreement/view.do">이용약관</a></li>
                    <li><a href="https://www.ltikorea.or.kr/kr/contents/refusal/view.do">이메일무단수집금지</a></li>
                </ul>
                <ul class="address">
                    <li>대표자 : 김영민 사업자등록번호 : 102-82-6549 Tel : 032-6919-7714 Fax : 032-695-5485</li>
                </ul>
                <p class="copyright">Copyright ⓒ Literature Translation Institute of Korea. All Rights Reserved.</p>
            </div>
        </div>
    </div>
</footer>

<!-- 부트스트랩 자바스크립트 CDN -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
