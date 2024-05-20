<%@page import="com.sky.dto.UserDto"%>
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
<title>개인정보 수정</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
    crossorigin="anonymous">
</head>
<body>
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
            <a class="navbar-brand" href="/indexadmin">홈 화면</a>
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
