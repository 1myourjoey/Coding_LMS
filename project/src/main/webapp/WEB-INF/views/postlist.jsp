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
        <a href="logout" class="btn btn-outline-secondary my-2 my-sm-0">로그아웃</a>
    </div>
</nav>

<div class="container mt-5">
    <h2>공지사항</h2>
    <table class="table table-bordered">
        <tbody>
            <c:forEach items="${post}" var="post">
                <form action="/updatePost" method="post">
                    <!-- hidden input을 사용하여 수정할 게시물의 번호를 전달 -->
                    <input type="hidden" name="postNum" value="${post.postNum}">
                    <tr>
                        <th scope="row">제목</th>
                        <td><input type="text" id="postTitle" name="postTitle" class="form-control" value="${post.postTitle}"></td>
                    </tr>
                    <tr>
                        <th scope="row">내용</th>
                        <td colspan="3" class="view_text">
                            <!-- 수정할 내용을 입력하는 textarea -->
                            <textarea title="내용" id="postContents" name="postContents" class="form-control">${post.postContents}</textarea>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <c:if test="${sessionScope.loggedInUser != null}">
                                <c:choose>
                                    <c:when test="${sessionScope.loggedInUser.adminYn eq 'N'}">
                                        <a href="/post" id="list" class="btn btn-dark">목록으로</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="/post" id="list" class="btn btn-dark">목록으로</a>
                                        <button type="submit" class="btn btn-primary">수정하기</button>
                                        <a href="/deletePost?postNum=${post.postNum}" id="delete" class="btn btn-dark">삭제하기</a>
                                    </c:otherwise>
                                </c:choose>
                            </c:if>
                        </td>
                    </tr>
                </form>
            </c:forEach>
        </tbody>
    </table>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
