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
    <link rel="stylesheet" href="css/stylecard.css">
    <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.7.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body class="bg-white text-black">
<div class="h-screen flex overflow-hidden text-sm bg-white text-black">
    <%@ include file="/WEB-INF/views/layout/Left_Side_bar.jsp"%>
    <div class="flex-grow overflow-hidden h-full flex flex-col">
        <%@include file="/WEB-INF/views/layout/header.jsp"%>
        <div class="">
            <div class="flex items-center space-x-3 sm:mt-7 mt-4">


            </div>
        </div>
        <div> <br> </div>
        <div class="album py-5 bg-body-tertiary">
            <div class="container">
                <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                    <!-- SugangRegWithDetails를 사용하여 각각의 강의 정보를 표시 -->
                    <c:forEach var="lecture" items="${lectures}">
                        <div class="col-md-4">
                            <div class="card" data-state="#about">
                                <div class="card-header">
                                    <div class="card-cover" style="background-image: url('https://images.unsplash.com/photo-1549068106-b024baf5062d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80')"></div>
                                    <img class="card-avatar" src="https://images.unsplash.com/photo-1549068106-b024baf5062d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80" alt="avatar" />
                                    <h1 class="card-fullname">${lecture.getLecName()}</h1>
                                    <h2 class="card-jobtitle">${lecture.getUserName()}</h2>
                                </div>
                                <div class="row">
                                <div class="row">
                                    <div class="card-section is-active" id="about">
                                        <div class="card-content">
                                            <div class="card-subtitle">ABOUT</div>
                                            <p class="card-desc">${lecture.getLecEx()}</p>
                                        </div>
                                    </div>
                                    </div>
                                    <div class="card-buttons">
                                        <button data-section="#about" class="is-active" onclick="window.location.href='${pageContext.request.contextPath}/contents_List?lecName=${lecture.lecName}'"><strong>강좌 보기</strong></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div class="flex w-full mt-5 space-x-2 justify-end">
            <button class="inline-flex items-center h-8 w-8 justify-center text-black rounded-md shadow border border-gray-200 dark:border-gray-800 leading-none">
                <svg class="w-4" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round">
                    <polyline points="15 18 9 12 15 6"></polyline>
                </svg>
            </button>
            <button class="inline-flex items-center h-8 w-8 justify-center text-black rounded-md shadow border border-gray-200 dark:border-gray-800 leading-none">1</button>
            <button class="inline-flex items-center h-8 w-8 justify-center text-black rounded-md shadow border border-gray-200 dark:border-gray-800 leading-none">2</button>
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
