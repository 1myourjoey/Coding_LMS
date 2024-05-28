<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous">

    <script src="https://apis.google.com/js/api.js"></script>
        <script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
        <link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
        <link rel="stylesheet" href="css/modal.css">
        <link rel="stylesheet" href="css/content.css">

<style>
/* 테이블 전체의 너비 설정 */
#myTable {
    width: 100%;
}

/* 길이가 너무 긴 셀에 대한 처리 */
#myTable td {
    max-width: 200px; /* 셀의 최대 너비 설정 */
    white-space: nowrap; /* 텍스트가 셀을 넘어가지 않고 한 줄에 표시되도록 설정 */
    overflow: hidden; /* 셀 내부의 내용이 넘칠 경우 숨김 처리 */
    text-overflow: ellipsis; /* 셀 내용이 넘칠 경우 '...'으로 대체하여 표시 */
}

.checkbox-cell {
    width: 4%; /* 또는 원하는 크기로 지정 */
}


</style>
</head>
<body>

<header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
    <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
      <img src="/img/lms.png" style="width: 100px; height: 80px; margin-right: 10px; margin-left:30px">

    </a>

    <ul class="nav nav-pills">
      <img src="img/person-circle.svg" style="width: 60px; height: 38px; margin: 10px 20px 0px 0px;">

    </ul>
</header>

<main class="d-flex flex-nowrap">
    <div id="sidebar" class="flex-column flex-shrink-0 p-3 bg-body-tertiary" style="width: 280px;">
        <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
            <svg class="bi pe-none me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg>
            <span class="fs-4">LMS</span>
        </a>
        <hr>
        <ul class="nav nav-pills flex-column mb-auto">
            <li class="nav-item">
                <a href="/" class="nav-link active" aria-current="page">
                    <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#home"/></svg>
                    Home
                </a>
            </li>
            <li>
                <a href="#" id="contentLink" class="nav-link link-body-emphasis">
                    <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#speedometer2"/></svg>
                    컨텐츠정보
                </a>
            </li>
            <li>
                <a href="#" id="lectureLink" class="nav-link link-body-emphasis">
                    <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#table"/></svg>
                    강좌정보
                </a>
            </li>
        </ul>

        <button class="btn btn-primary" id="btn-hide" style="margin-top: 450px; margin-left:35px; width: 150px; height: 50px;">메뉴숨기기</button>

</div>
<div>

    <button id="btn-show" class="btn btn-primary" style="margin-top: 650px; border-radius: 50%; width: 70px; height: 60px;"">
        <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8"/>
          </svg>
    </button>
</div>
    <div id="lectureForm" style="width:100%; margin-left: 12px;"></div>
    <div class="container-fluid">
        <div class="row g-3 border p-3"  style="margin-top: 10px; border-radius: 10px;">
            <div class="col-sm-6">
                <form id="searchForm" action="selectSearch" method="post">
                    <div class="form-group" style="margin-left: 40px;">
                        <label for="firstName">콘텐츠명</label>

                        <input type="text" class="form-control" id="firstName" name="conName" placeholder="" value="" style="max-width: 350px;">
                    </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label for="lastName">교과목명</label>

                    <input type="text" class="form-control" id="lastName" name="lecName" placeholder="" value="" style="max-width: 350px;">
                    <input type="submit" class="btn btn-primary" value="검색">
                </div>
            </div>
              </form>
        </div>

        <div class="row g-3 border p-3" style="margin-top: 50px;">
            <h4>온라인콘텐츠</h4>
            <div class="col-md-7" style="overflow-x: auto; overflow-y: auto; max-height: 600px;">

                <table class="table table-striped table-bordered table-hover" id="myTable" style="margin-top:5px";>
                    <thead class="table-light">
                    <tr>
                        <th scope="col" class="checkbox-cell"><input type="checkbox" id="masterCheckbox" onchange="toggleAllCheckboxes()"></th>
                        <th scope="col" style="text-align: center;">교과목</th>
                        <th scope="col" style="text-align: center;">콘텐츠명</th>
                        <th scope="col" style="text-align: center;">Youtube연동번호</th>
                        <th scope="col" style="text-align: center;">학습시간</th>
                    </tr>
                    </thead>

                    <tbody id="tableBody">
                        <c:choose>
                            <c:when test="${empty selectSearch}">
                                <c:forEach var="contents" items="${paging}" varStatus="loop">
                                    <tr>
                                        <td class="checkbox-cell"><input type="checkbox" onclick="handleClick('${contents.conNum}')"></td>
                                        <td onclick="handleClick('${contents.conNum}'); selectChapter('${contents.conNum}'); return false;">${contents.lecName}</td>
                                        <td onclick="handleClick('${contents.conNum}'); selectChapter('${contents.conNum}'); return false;">${contents.conName}</td>
                                        <td onclick="handleClick('${contents.conNum}'); selectChapter('${contents.conNum}'); return false;">${contents.videoId}</td>
                                        <td onclick="handleClick('${contents.conNum}'); selectChapter('${contents.conNum}'); return false;">${contents.durationTime}</td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="search" items="${selectSearch}" varStatus="loop">
                                    <tr>
                                        <td><input type="checkbox" onclick="handleClick('${search.conNum}')"></td>
                                        <td onclick="handleClick('${search.conNum}'); selectChapter('${search.conNum}'); return false;">${search.lecName}</td>
                                        <td onclick="handleClick('${search.conNum}'); selectChapter('${search.conNum}'); return false;">${search.conName}</td>
                                        <td onclick="handleClick('${search.conNum}'); selectChapter('${search.conNum}'); return false;">${search.videoId}</td>
                                        <td onclick="handleClick('${search.conNum}'); selectChapter('${search.conNum}'); return false;">${search.durationTime}</td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </tbody>

                </table>


                    <div class="container" style="width: 250px; text-align: center;">
                        <ul class="pagination">
                            <c:forEach var="pgn" items="${pgnList}">
                                <li class="page-item">
                                    <a class="page-link pgn" data-page="${pgn.pageNo}" style="color: #323232;">
                                        <c:choose>
                                            <c:when test="${pgn.curPage}">
                                                <u>${pgn.display}</u>
                                            </c:when>
                                            <c:otherwise>
                                                ${pgn.display}
                                            </c:otherwise>
                                        </c:choose>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>

            </div>

            <div class="col-md-5" id="tabMenu">

    <div class="tabs">
        <input type="radio" id="tab1" name="tabs" checked>
        <label for="tab1">컨텐츠정보</label>

        <input type="radio" id="tab2" name="tabs">
        <label for="tab2">챕터정보</label>
    </div>

                <div id="notice" class="tabContent">

                    <div id="contentInfo" class="mb-3">

                        <table class="table table border" style="margin-top:0px;">

                        <form action="updateContent" id="updateContent">
                            <tbody>
                            <tr>
                                <td class="table-light">콘텐츠관리번호</td>
                                <td><input type="text" class="form-control" name="conNum" value="${selectContent.conNum}" readonly></td>
                            </tr>

                            <tr>
                                <td class="table-light">콘텐츠명</td>
                                    <td><input type="text" class="form-control" id="conName" name="conName" value="${selectContent.conName}"></td>
                            </tr>

                            <tr>
                                <td class="table-light">교과목명</td>
                                    <td><input type="text" class="form-control" id="lecName" name="lecName" value="${selectContent.lecName}" readonly></td>
                            </tr>

                            <tr>
                                <td class="table-light">교과목코드</td>
                                <td>
                            <div style="display: flex; align-items: center;">
                                <input type="text" class="form-control" id="lecNum" name="lecNum" value="${selectContent.lecNum}" style="margin-right: 5px;" readonly>
                                <img id="openModalButton" src="img/search.svg" style="width: 16px; height: 16px; cursor: pointer;">
                            </div>

                                </td>
                            </tr>

                            <tr>
                                <td class="table-light">콘텐츠설명</td>
                                <td><input type="text" class="form-control" name="description" value="${selectContent.description}"></td>
                            </tr>

                            <tr>
                                <td class="table-light">Youtube비디오ID</td>
                                <td>
                                <div style="display: flex; align-items: center;">
                                <input type="text"class="form-control" id="videoIdInput" name="videoId" value="${selectContent.videoId}">
                                <input type="button" style="margin-left: 10px;" class="js-preview-link btn btn-primary btn-sm" data-conNum="${conNum}"  value="영상확인">
                                </div>
                                </td>
                            </tr>


                            <tr>
                                <td class="table-light">차시학습시간[초]</td>

                                <td>
                                <div style="display: flex; align-items: center;">
                                    <input type="text" class="form-control" id="conPlayTime" name="conPlayTime" value="${selectContent.conPlayTime}">
                                    <input type="button" style="margin-left: 10px; display: inline-block;" onclick="updateVideoDuration(); return false;" class="btn btn-primary btn-sm" value="갱신">

                                </div>

                                </td>
                            </tr>
                            <tr>
                                <td class="table-light">썸네일 URL</td>
                                <td>
                                    <div style="display: flex; align-items: center;">
                                        <input type="text" class="form-control" id="thumbUrl" name="thumbUrl" value="${selectContent.thumbUrl}">
                                        <input type="button" style="margin-left: 10px;" onclick="fetchThumbnail();" class="btn btn-primary btn-sm" value="갱신">
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <div>
                            <input type="hidden" value="${selectContent.conNum}">
                            <input type="submit" value="저장"  style="float: right; margin-right: 0px;" class="btn btn-primary btn-sm">
                            </form>

                            <form action="deleteContent" id="deleteContentForm">
                            <input type="hidden" name="conNum" id="deleteBtn"  value="${selectContent.conNum}">
                            <input type="submit"  style="float: right; margin-right: 5px;" value="삭제" class="btn btn-primary btn-sm">
                            </form>

                                <input type="button" onclick="addEmptyRowBelow(this)"  style="float: right; margin-right: 5px;" class="btn btn-primary btn-sm" value="추가">

                            </div>
                    </div>

                    <div id="myModal" class="modal">
                        <div class="modal-content">
                            <span class="close">&times;</span>
                            <div>
                                <form id="modalSearchForm" action="modalSearch" method="post">
                                    <input type="text" class="search-input" id="modalSearchInput" name="lecName" placeholder="교과목을 검색하세요...">
                                    <input type="submit" class="search-button" value="검색">
                                    <button class="select-button">선택</button>
                                </form>

                            </div>
                            <!-- 테이블 데이터 -->
                            <table id="dataTable" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>강좌번호</th>
                                        <th>시작날짜</th>
                                        <th>종료날짜</th>
                                        <th>강의이름</th>
                                        <th>강의설명</th>
                                    </tr>
                                </thead>
                                <tbody id="modalSearchResults">
                                    <c:choose>
                                        <c:when test="${empty modalSearch}">
                                            <c:forEach var="lecture" items="${lectureList}" varStatus="loop">
                                                <tr>
                                                    <td>${lecture.lecNum}</td>
                                                    <td>${lecture.lecStartDate}</td>
                                                    <td>${lecture.lecEndDate}</td>
                                                    <td>${lecture.lecName}</td>
                                                    <td>${lecture.lecEx}</td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <c:forEach var="modal" items="${modalSearch}" varStatus="loop">
                                                <tr>
                                                    <td>${modal.lecNum}</td>
                                                    <td>${modal.lecStartDate}</td>
                                                    <td>${modal.lecEndDate}</td>
                                                    <td>${modal.lecName}</td>
                                                    <td>${modal.lecEx}</td>
                                                </tr>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div id="chapterInfo" style="overflow-x: auto; overflow-y: auto; max-height: 700px;">

                        <table class="table table-striped table-bordered table-hover" style="margin-top:0px;">
                            <thead class="table-light">
                            <tr>
                                <th scope="col"><input type="checkbox"></th>
                                <th scope="col" style="text-align: center;">챕터</th>
                                <th scope="col" style="text-align: center;">챕터명</th>
                                <th scope="col" style="text-align: center;">위치(시분초)</th>
                                <th scope="col" style="text-align: center;">시작위치[초]</th>
                            </tr>
                            </thead>
                        <tbody id="addChapter">
                        <c:forEach var="chapter" items="${selectChapter}" varStatus="loop">
                            <tr>
                                <td><input type="checkbox"></td>
                                <td id="chapName" style="text-align: center;"></td>
                                <td id="chapStartTime" style="text-align: center;">${chapter.chapName}</td>
                                <td style="text-align: center;">${chapter.chapStartTime}</td>
                                <td id="someId" style="text-align: center;"></td>
                            </tr>
                        </c:forEach>
                        </tbody>

                        </table>

                        <form action="saveChapter" id="saveChapterForm" method="post">
                        <table class="table table-striped table-bordered table-hover" style="margin-top:100px">
                            <thead class="table-light">
                            <tr>
                                <th scope="col" style="text-align: center;">챕터명</th>
                                <th scope="col" style="text-align: center;">위치(시분초)</th>
                            </tr>
                            </thead>
                         <tbody>
                         <tr>
                         <td>
                         <input type="text" name="chapName" value="${selectOneChapter.chapName}" style="width: 100%; text-align: center; border: none;">
                         </td>

                         <td>
                            <input type="text" name="chapStartTime" value="${selectOneChapter.chapStartTime}" style="width: 100%; text-align: center; border: none;">
                            <input type="hidden" name="lecNum" id="chapterLecNum" value="${selectContent.lecNum}">
                            <input type="hidden" name="conNum" id="ChapterSave" data-conNum="${selectContent.conNum}" value="${selectContent.conNum}">
                            <input type="hidden" name="chapNum" value="${selectOneChapter.chapNum}">
                         </td>

                        </tr>
                        </tbody>
                        </table>

                        <input type="submit" value="저장" class="btn btn-primary btn-sm" style="float: right; margin-right: 0px;">
                        </form>
                        <form id="deleteChapterForm">
                            <input type="hidden" name="chapNum" value="${selectContent.chapNum}">
                            <button type="button" id="ChapterNum" class="btn btn-primary btn-sm" data-conNum="${selectContent.conNum}" onclick="deleteChapter()" style="float: right; margin-right: 5px;">삭제</button>
                        </form>
                            <input type="button" onclick="addEmptyChapter(this)" value="추가" class="btn btn-primary btn-sm" style="float: right; margin-right: 5px;">

                    </div>
                </div>
            </div>

        </div>
    </div>
</main>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="js/sidebar.js"></script>
<script src="js/tabMenu.js"></script>
<script src="js/selectAjax.js"></script>
<script src="js/modal.js"></script>
<script src="js/videoTime.js"></script>
<script src="js/grid.js"></script>
<script src="js/addEmptyChapter.js"></script>
<script src="js/checkBox.js"></script>
<script src="js/chapter.js"></script>
<script src="js/formActive.js"></script>
<script src="js/contentProcess.js"></script>
<script src="js/paging.js"></script>

</body>
</html>