<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.lecture.dto.LectureDto" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>부트스트랩 네비게이션 바</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

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
        </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">

       <h1>LMS</h1>


        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>


       <div class="navbar-nav">
    <div class="dropdown">
        <a class="nav-link" href="#">강좌</a>
        <div class="dropdown-content">
            <a href="lecex">나의 강좌 목록</a>
            <a href="#">수강신청</a>
        </div>
    </div>
    <div class="dropdown">
        <a class="nav-link" href="post">공지사항</a>
        <div class="dropdown-content">
            <a href="post">서브메뉴2-1</a>
            <a href="#">서브메뉴2-2</a>
        </div>
    </div>
</div>
    </div>
    <a href="/logout" style="padding-right: 50px;">로그아웃</a>

</nav>


<div style="margin-top: 100px; text-align: right; padding-right: 120px;">
   <button title="돌아가기" class="btn btn-secondary" id="btn_rtn" value="null" onclick="fn_rtn_onclick(this)">
       <i class="bi bi-arrow-left"></i> 돌아가기
   </button>
</div>



<div class="container">
    <div id="section1" class="section1" style="display: revert;">
        <div class="wrap-title">
            <p class="pagetitle" style="font-size: 24px; font-weight: bold;">온라인 강의목록</p>
        </div>
    </div>


        <table id="grid1" class="table table-bordered">

            <thead class="table-light">
            <tr>
                <th scope="col">강좌번호</th>
                <th scope="col">온라인 강좌명</th>
                <th scope="col">신청 시작일</th>
                <th scope="col">신청 종료일</th>
                <th scope="col">강좌 설명</th>
                <th scope="col">강의 정보</th>
                <th scope="col">강의 보기</th>
            </tr>
            </thead>
            <tbody>
                    <c:forEach items="${leclist}" var="lecture">
                            <tr>
                                <td>${lecture.lecNum}</td>
                                <td>${lecture.lecName}</td>
                                 <td><fmt:formatDate value="${lecture.lecStartDate}"
                                        pattern="yyyy-MM-dd"/></td>
                                <td><fmt:formatDate value="${lecture.lecEndDate}"
                                     pattern="yyyy-MM-dd"/></td>
                                  <td>${lecture.lecEx}</td>
                                    <td>운영중</td>
                               <td class="align-center" style="width: 200px;">
                                   <button class="btn btn-primary"${lecture.lecNum}> 보기</button>
                               </td>

                            </tr>
                        </c:forEach>
            </tbody>
        </table>
    </div>
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
<script>
    document.getElementById("btn_rtn").addEventListener("click", function() {
        history.back();
    });
</script>
</body>
</html>
