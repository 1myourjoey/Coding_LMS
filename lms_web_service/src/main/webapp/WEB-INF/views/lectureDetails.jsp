

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.sky.lms_web_service.dto.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>수강 신청</title>
    <link href="https://assets.codepen.io/344846/style.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">

    <style>
        #registerButton {
            background-color: #323232;
            border-color: #323232;
            border-radius: 80px;
            padding: 10px 20px;
            color: #fff;
            text-transform: uppercase;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        #registerButton:hover {
            background-color: #505050;
            border-color: #505050;
        }
    </style>

</head>
<body class="bg-white text-black">
<div class="h-screen flex overflow text-sm bg-white text-black">
    <%@ include file="/WEB-INF/views/layout/Left_Side_bar.jsp"%>
    <div class="flex-grow overflow-hidden h-full flex flex-col">
        <%@include file="/WEB-INF/views/layout/header.jsp"%>
        <div class="">
            <div class="flex items-center space-x-3 sm:mt-7 mt-4">
                <a  class="px-3 border-b-2 border text dark:text-black dark:border-white pb-1.5"></a>

            </div>
        </div>
        <div style="display: flex; justify-content:right; margin-right: 20px; margin-bottom: 20px">

            <button center type="button" id="registerButton" class="btn btn-primary">수강신청</button>

        </div>

        <table class="text-left">
            <thead>
            <tr class="text-black-400">
                <th class="font-normal px-3 pt-0 pb-3 border-b border-gray-200 dark:border-gray-800">이미지</th>
                <th class="font-normal px-3 pt-0 pb-3 border-b border-gray-200 dark:border-gray-800">강좌 번호</th>
                <th class="font-normal px-3 pt-0 pb-3 border-b border-gray-200 dark:border-gray-800">강좌명</th>
                <th class="font-normal px-3 pt-0 pb-3 border-b border-gray-200 dark:border-gray-800">컨텐츠 넘버</th>
                <th class="font-normal px-3 pt-0 pb-3 border-b border-gray-200 dark:border-gray-800">컨텐츠 이름</th>
                <th class="font-normal px-3 pt-0 pb-3 border-b border-gray-200 dark:border-gray-800">강좌 설명</th>

            </tr>
            </thead>
            <tbody class="text-black-600 dark:text-black-100">
            <c:forEach var="content" items="${contents}">
                <tr data-lecNum="${content.lecNum}">
                <tr>
                    <td class="sm:p-3 py-2 px-1 border-b border-gray-200 dark:border-gray-800"><img src="${content.thumbUrl}" ></td>
                    <td class="sm:p-3 py-2 px-1 border-b border-gray-200 dark:border-gray-800">${content.lecNum}</td>
                    <td class="sm:p-3 py-2 px-1 border-b border-gray-200 dark:border-gray-800">${content.lecName}</td>
                    <td class="sm:p-3 py-2 px-1 border-b border-gray-200 dark:border-gray-800">${content.conNum}</td>
                    <td class="sm:p-3 py-2 px-1 border-b border-gray-200 dark:border-gray-800">${content.conName}</td>
                    <td class="sm:p-3 py-2 px-1 border-b border-gray-200 dark:border-gray-800">${content.description}</td>

                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="flex w-full mt-5 space-x-2 justify-end">
            <button class="inline-flex items-center h-8 w-8 justify-center text-black rounded-md shadow border border-gray-200 dark:border-gray-800 leading-none">
                <svg class="w-4" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round">
                    <polyline points="15 18 9 12 15 6"></polyline>
                </svg>
            </button>
            <button class="inline-flex items-center h-8 w-8 justify-center text-black rounded-md shadow border border-gray-200 dark:border-gray-800 leading-none">1</button>
            <button class="inline-flex items-center h-8 w-8 justify-center text-black rounded-md shadow border border-gray-200 dark:border-gray-800 bg-gray-100 dark:bg-gray-800 dark:text-white leading-none">2</button>
            <button class="inline-flex items-center h-8 w-8 justify-center text-black rounded-md shadow border border-gray-200 dark:border-gray-800 leading-none">3</button>
            <button class="inline-flex items-center h-8 w-8 justify-center text-black rounded-md shadow border border-gray-200 dark:border-gray-800 leading-none">4</button>
            <button class="inline-flex items-center h-8 w-8 justify-center text-black rounded-md shadow border border-gray-200 dark:border-gray-800 leading-none">
                <svg class="w-4" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round">
                    <polyline points="9 18 15 12 9 6"></polyline>
                </svg>
            </button>
        </div>
    </div>
</div>
</body>
</html>


<!-- 부트스트랩 JavaScript 및 jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.7.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    const lecNum = '${contents[0].lecNum}'; // 페이지에서 로딩할 때 lecNum을 받는거임
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