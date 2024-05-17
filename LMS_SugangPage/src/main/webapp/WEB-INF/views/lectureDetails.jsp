<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.sky.dto.User" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>강좌 상세 정보</title>
    <!-- 부트스트랩 CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- 부트스트랩 JavaScript 및 jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.7.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/album/">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
</head>
<body>

<%@ include file="/WEB-INF/views/layout/header.jsp"%>
<!-- 강좌 상세 정보 -->
<!-- 강좌 상세 정보 -->
<div class="center LM2420M">
    <!-- 컨텐츠 -->
    <div class="container">
        <!-- Other elements... -->
        <div class="table-responsive small">
            <table class="table table-striped table-sm">
                <thead>
                <tr>
                    <th scope="col">이미지</th>
                    <th scope="col">강좌 번호</th>
                    <th scope="col">강좌명</th>
                    <th scope="col">컨텐츠 넘</th>
                    <th scope="col">컨텐츠 명</th>
                    <th scope="col">강좌 설명</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="content" items="${contents}">
                    <tr data-lecNum="${content.lecNum}">
                        <td><img src="${content.thumbUrl}" style="width: 100px;"></td>
                        <td>${content.lecNum}</td>
                        <td>${content.lecName}</td>
                        <td>${content.conNum}</td>
                        <td>${content.conName}</td>
                        <td>${content.description}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="text-center">
            <button type="button" id="registerButton" class="btn btn-primary mt-3" >수강 신청</button>
        </div>
        <div id="section1" class="section1" style="display: revert;">
            <br>
            <%@ include file="/WEB-INF/views/layout/footer.jsp"%>
        </div>
    </div>
</div>

<script>
    // 데이터에 따라 프로그레스 바의 너비를 조정하는 함수r
    function updateProgressBar(percent) {
        $('.progress-bar').css('width', percent + '%').attr('aria-valuenow', percent);
        $('.progress-status p:last-child').text(percent + '%');
    }

    // 페이지 로드시 프로그레스 바 초기화
    $(document).ready(function () {
        updateProgressBar(0);
    });
</script>
<script>
    const lecNum = '${contents[0].lecNum}'; // 페이지에서 로딩할때 lecnum을 받는거임
    $("#registerButton").click(function() {
        const userNo = '<%=session.getAttribute("userNo")%>'; // 세션에서 userNo 가져오기

        console.log("userNo: ", userNo); // 콘솔에 userNo 출력
        console.log("lecNum: ", lecNum);
        $.ajax({
            url: '/registerLecture', // 요청을 보낼 URL
            type: 'POST', // HTTP 메소드
            data: { // 서버에 보낼 데이터
                userNo: userNo,
                lecNum: lecNum
            },
            success: function(response) { // 요청이 성공적으로 처리된 경우
                if (response === "이미 수강 신청한 항목입니다.") {
                    alert(response);
                } else {
                    alert('수강 신청이 완료되었습니다.');
                }
            },
            error: function() { // 요청이 실패한 경우
                alert('수강 신청에 실패하였습니다.');
            }
        });
    });
</script>

</body>
</html>