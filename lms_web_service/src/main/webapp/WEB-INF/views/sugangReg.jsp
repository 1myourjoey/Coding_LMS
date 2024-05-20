<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>수강신청</title>
    <!-- 부트스트랩 CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
    <!-- 커스텀 CSS -->
    <link rel="stylesheet" type="text/css" href="css/style.css">



</head>
<body>
<header>
    <%@ include file="/WEB-INF/views/layout/header.jsp"%>
</header>
<main role="main" class="container mt-5">
    <section class="form-basic">
        <form name="hiding">
            <input type="hidden" name="lms_lect_no" value="2024-O004">
            <input type="hidden" id="hide_prev_id" name="prev_id" value="req.do">
        </form>

        <div id="section1" class="section1">
            <h2 class="text-bg-info text-primary my-4">수강신청 온라인 과목 정보</h2>
            <div class="table-responsive small">
                <table class="table table-striped table-hover table-sm">
                    <thead>
                    <tr>
                        <th scope="col">강좌 번호</th>
                        <th scope="col">강좌명</th>
                        <th scope="col">강좌 설명</th>
                        <th scope="col">강좌 시작 일자</th>
                        <th scope="col">강좌 종료 일자</th>
                        <th scope="col"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="lecture" items="${lectures}">
                        <tr>
                            <td>${lecture.lecNum}</td>
                            <td>${lecture.lecName}</td>
                            <td>${lecture.lecEx}</td>
                            <td>${lecture.lecStartDate}</td>
                            <td>${lecture.lecEndDate}</td>
                            <td class="align-center" style="width: 200px;">
                                <a href="<c:url value='/lecture/${lecture.lecNum}' />" class="btn btn-primary">보기</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </section>
</main>
<footer>
    <%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</footer>
<!-- 부트스트랩 JavaScript 및 jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.7.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
