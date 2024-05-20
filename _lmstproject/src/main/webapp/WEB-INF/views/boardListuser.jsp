<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>board</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
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
                       <td>${list.boardIdx}</td>
                       <td class="title"><a href="/BoardDetailuser?boardIdx=${list.boardIdx}">${list.title}</a></td>
                       <td>${list.hitCnt}</td>
                       <td> ${list.createdDatetime}</td>
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

</div>
</body>
</html>
