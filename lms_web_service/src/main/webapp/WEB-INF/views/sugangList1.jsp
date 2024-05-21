<%@ page import="com.sky.lms_web_service.dto.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>수강 목록</title>
    <!-- 부트스트랩 CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- 부트스트랩 JavaScript 및 jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.7.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/album/">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
</head>

<body>

<%@ include file="/WEB-INF/views/layout/header.jsp"%>

<!-- 수강신청온라인과목정보(학생)(LM2420M) -->
<div class="center LM2420M">
    <!-- 컨텐츠 -->
    <div class="container">
        <div>
            <form name="hiding">
                <input type="hidden"  name="lms_lect_no" value="2024-O004">
                <input type="hidden" id="hide_prev_id" name="prev_id" value="req.do">
            </form>
            <div class="wrap-title">
                <p class="pagetitle">온라인 강의정보</p>
                <div>
                    <button title="돌아가기" class="button button_blkline" id="btn_rtn" value="req.do" onclick="fn_rtn_onclick(this)">돌아가기</button>
                </div>
            </div>
            <div class="form-basic">
                <div id="div_table">
                    <table class="table_default table_1vertical-1 table_data table_bdr_top">
                        <%
                            // 세션에서 userNo 값을 가져옵니다.
                            int userNo = (int) session.getAttribute("userNo");

                            // 가져온 userNo 값을 출력합니다.
                            out.println("userNo: " + userNo);
                        %>
                        <colgroup>
                            <col width="13.333%">
                            <col width="20%">
                            <col width="13.333%">
                            <col width="20%">
                            <col width="13.333%">
                            <col width="20%">
                        </colgroup>
                        <tbody>
                        <tr>

                            <th scope="col">학기</th>
                            <td><input type="text" id="txt_inp1_term_div" class="form_default form_typed width_100" maxlength="50" disabled=""></td>
                            <th scope="col">진행상태</th>
                            <td><input type="text" id="txt_inp1_sts_div" class="form_default form_typed width_100" maxlength="50" disabled=""></td>
                        </tr>
                        <tr>
                            <th scope="col">강좌번호</th>
                            <td><input type="text" id="" class="form_default width_100" maxlength="50" disabled=""></td>
                            <th scope="col">강좌명</th>
                            <td>
                                <input type="hidden" id="txt_inp1_lms_lect_no">
                                <input type="text" id="txt_inp1_lms_lect_nm" class="form_default width_100" maxlength="50" disabled="">
                            </td>

                        </tr>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div id="section1" class="section1" style="display: revert;">
            <br>

            <div class="classprogress">
                <p class="progress-p"><strong>전체진도율</strong></p>
                <div class="boxprogress">
                    <div class="progress-status">
                        <p>0/6</p>
                        <p>0%</p>
                    </div>
                    <div class="progress-wrap progress" data-progress-percent="0">
                        <div class="progress-bar progress" style="left: 0px;"></div>
                    </div>
                    <div></div>
                </div>
            </div>
            <form name="form">
                <input type="hidden" id="hide_lms_lect_no" name="lms_lect_no">
            </form>
            <div class="album py-5 bg-body-tertiary">
                <div class="container">
                    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                        <!-- SugangRegWithDetails를 사용하여 각각의 강의 정보를 표시 -->
                        <c:forEach var="lecture" items="${lectures}">
                            <div class="col">
                                <div class="card shadow-sm">
                                    <!-- 수업 정보에 맞게 카드 내용을 수정 -->
                                    <div class="card-body">
                                        <h5 class="card-title">${lecture.getLecName()}</h5>
                                        <h4>${lecture.getUserName()}</h4>
                                        <p class="card-text">${lecture.getLecEx()}</p>
                                        <!-- View, Edit 버튼 또는 기타 작업 버튼 추가 -->
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div class="btn-group">
                                                <a href="${pageContext.request.contextPath}/contents_List?lecName=${lecture.lecName}" class="btn btn-sm btn-outline-secondary">보기</a>
                                                <button type="button" class="btn btn-sm btn-outline-secondary">수정</button>
                                            </div>
                                            <!-- 예시로 진행 시간 표시 -->
                                            <small class="text-body-secondary">수강기간 : ${lecture.getLecStartDate()} </br>
                                                - ${lecture.getLecEndDate()}</small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>

<script>
    // 데이터에 따라 프로그레스 바의 너비를 조정하는 함수
    function updateProgressBar(percent) {
        $('.progress-bar').css('width', percent + '%').attr('aria-valuenow', percent);
        $('.progress-status p:last-child').text(percent + '%');
    }

    // 페이지 로드시 프로그레스 바 초기화
    $(document).ready(function() {
        updateProgressBar(0);
    });
</script>
</body>
</html>
