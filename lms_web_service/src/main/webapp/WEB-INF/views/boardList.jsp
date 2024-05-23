<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자료실</title>
    <link rel="stylesheet" href="/css/styles.css">
     <img src="/img/lms.png" alt="로고" class="logo-img">
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

        /* 글쓰기 버튼과 페이지 버튼 스타일 */
        #btn_q, .pagination a {
            background-color: #323232;
            color: white;
            border: none;
            padding: 10px 20px;
            text-decoration: none;
            margin: 5px;
            border-radius: 5px;
        }

        .pagination a:hover {
            background-color: #555;
        }

        .pagination a:focus {
            outline: none;
            box-shadow: 0 0 0 2px #555;
        }
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
</head>
<body>

   <a href="/logout" class="logout-link">로그아웃</a> <!-- 로그아웃 링크 추가 -->
        <nav class="menu-bar con-min-width">
            <div class="con text-align-center">

              <ul class="menu-bar__box">
                <li><a href="/">HOME</a></li>
                <li><a href="/sugangReg">수강신청</a></li>
                <li><a href="/content">교육과정</a></li>
                <li><a href="/board/openBoardList.do">자료실</a></li>
                <li><a href="/post">공지사항</a></li>
                <li><a href="/qna/openQnaList.do">Q&A</a></li>
              </ul>
            </div>
          </nav>


<!-- 자료실 테이블 -->
<section class="notice">
    <div class="page-title">
        <div class="container">
            <h3>자료실</h3>
        </div>
    </div>

    <div id="board-list">
        <div class="container">
            <table class="board-table">
                <thead>
                <tr>
                    <th scope="col" class="th-num">번호</th>
                    <th scope="col" class="th-title">제목</th>
                    <th scope="col" class="th-date">등록일</th>
                    <th scope="col" class="th-date">조회수</th>
                </tr>
                </thead>
                <tbody>
                 <c:if test="${not empty list}">
                            <c:forEach var="list" items="${list}">
                                <tr>
                                    <td>${list.boardIdx}</td>
                                    <td class="title"><a href="/board/openBoardDetail.do?boardIdx=${list.boardIdx}">${list.title}</a></td>
                                    <td> ${list.createdDatetime}</td>
                                    <td>${list.hitCnt}</td>
                                </tr>
                            </c:forEach>
                        </c:if>
                        <c:if test="${empty list}">
                            <tr>
                                <td colspan="4">조회된 결과가 없습니다.</td>
                            </tr>
                        </c:if>
                </tbody>
            </table>
        </div>
    </div>
</section>

<!-- 글쓰기 버튼 -->
<div style="margin-top: 20px; text-align: right; padding-right: 380px;">
    <a href="/board/openBoardWrite.do" class="btn btn-dark" style="color: #ffffff;">글 쓰기</a>
</div>


 <nav aria-label="Page navigation">
        <ul class="pagination justify-content-center">
            <c:if test="${currentPage > 1}">
                <li class="page-item"><a class="page-link" href="?page=1">처음</a></li>
                <li class="page-item"><a class="page-link" href="?page=${currentPage - 1}">이전</a></li>
            </c:if>
            <c:forEach begin="1" end="${totalPages}" var="page">
                <li class="page-item ${page == currentPage ? 'active' : ''}">
                    <a class="page-link" href="?page=${page}">${page}</a>
                </li>
            </c:forEach>
            <c:if test="${currentPage < totalPages}">
                <li class="page-item"><a class="page-link" href="?page=${currentPage + 1}">다음</a></li>
                <li class="page-item"><a class="page-link" href="?page=${totalPages}">마지막</a></li>
            </c:if>
        </ul>
    </nav>

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

<!-- 부트스트랩 자바스크립트 CDN -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
