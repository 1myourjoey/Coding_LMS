<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시글 상세 화면</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <h1>LMS</h1>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        강좌
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="lecex">나의 강좌 목록</a>
                        <a class="dropdown-item" href="/">수강 신청</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        공지사항
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">서브메뉴2-1</a>
                        <a class="dropdown-item" href="#">서브메뉴2-2</a>
                    </div>
                </li>
            </ul>
        </div>
        <button class="btn btn-outline-secondary my-2 my-sm-0" type="submit">로그아웃</button>
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

            <button type="submit" class="btn btn-primary btn-block" style="padding: 5px 10px; font-size: 12px;">등록</button>


            <a href="/post" id="list" class="btn btn-dark">목록으로</a>
        </table>
    </form>
</div>










<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
