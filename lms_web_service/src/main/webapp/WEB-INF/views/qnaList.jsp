<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Q&A</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <span style="font-size: 35px;"><a href="/root" style="text-decoration: none; color: black;">Q&A</a></span>
    <a class="navbar-brand" href="/">홈 화면</a>

    <table class="table table-striped">
        <thead class="thead-dark">
        <tr>
            <th scope="col">글번호</th>
            <th scope="col">제목</th>
            <th scope="col">조회수</th>
            <th scope="col">작성일</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${not empty list}">
           <c:forEach var="list" items="${list}">
               <tr>
                  <td>${list.qNum}</td>
                  <td class="qnaTitle"><a href="/qna/openQnaDetail.do?qNum=${list.qNum}">${list.qnaTitle}</a></td>
                  <td>${list.hitCnt}</td>
                  <td>${list.qnaCreated}</td>
               </tr>
           </c:forEach>
        </c:if>
        <c:if test="${empty list}">
            <tr>
                <td colspan="4">조회된 글이 없습니다.</td>
            </tr>
        </c:if>
        </tbody>
    </table>


    <a href="/qna/openQnaWrite.do" class="btn btn-primary">글 쓰기</a>

</div>


</body>
</html>
