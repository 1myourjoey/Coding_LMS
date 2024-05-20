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
    <style>
        .navbar-custom {
            height: 85px; /* 네비게이션 바의 높이를 70px로 설정 */
            padding-top: 10px; /* 상단 패딩 추가 */
            padding-bottom: 10px; /* 하단 패딩 추가 */
        }

        .navbar-nav .nav-link {
            padding-top: 10px; /* 링크 상단 패딩 추가 */
            padding-bottom: 10px; /* 링크 하단 패딩 추가 */
        }
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        .b-example-divider {
            width: 100%;
            height: 3rem;
            background-color: rgba(0, 0, 0, .1);
            border: solid rgba(0, 0, 0, .15);
            border-width: 1px 0;
            box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
        }

        .b-example-vr {
            flex-shrink: 0;
            width: 1.5rem;
            height: 100vh;
        }

        .bi {
            vertical-align: -.125em;
            fill: currentColor;
        }

        .nav-scroller {
            position: relative;
            z-index: 2;
            height: 2.75rem;
            overflow-y: hidden;
        }

        .nav-scroller .nav {
            display: flex;
            flex-wrap: nowrap;
            padding-bottom: 1rem;
            margin-top: -1px;
            overflow-x: auto;
            text-align: center;
            white-space: nowrap;
            -webkit-overflow-scrolling: touch;
        }

        .btn-bd-primary {
            --bd-violet-bg: #712cf9;
            --bd-violet-rgb: 112.520718, 44.062154, 249.437846;

            --bs-btn-font-weight: 600;
            --bs-btn-color: var(--bs-white);
            --bs-btn-bg: var(--bd-violet-bg);
            --bs-btn-border-color: var(--bd-violet-bg);
            --bs-btn-hover-color: var(--bs-white);
            --bs-btn-hover-bg: #6528e0;
            --bs-btn-hover-border-color: #6528e0;
            --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
            --bs-btn-active-color: var(--bs-btn-hover-color);
            --bs-btn-active-bg: #5a23c8;
            --bs-btn-active-border-color: #5a23c8;
        }
        .bd-mode-toggle {
            z-index: 1500;
        }

        .container {
            width: 2500px;
            height: 100%;
        }
        .form-group {
            display: flex;
            align-items: center;
        }
        .form-group label {
            flex: 0 0 auto; /* 레이블 크기 조절 */
            margin-right: 50px; /* 레이블과 입력 사이 간격 조절 */
        }
        .form-group input{
            margin-right: 20px;
        }

        .table-light {
            width: 30%;
            font-weight: bold; /* 첫 번째 셀의 너비 비중 설정 */
        }
        .table-light + td {
            width: 70%; /* 두 번째 셀의 너비 비중 설정 */
        }
        #tabMenu {
            margin-top: -25px; /* 원하는 만큼 위로 이동 */
        }

        #chapterInfo {
            display: none; /* 챕터정보 테이블을 숨김 */
        }

        .input-full-width {
            width: 100%;
        }
        a {
            text-decoration: none; /* 링크에 밑줄 제거 */
            color: inherit; /* 기본 링크 색상으로 설정 */
            cursor: pointer; /* 마우스 커서를 포인터로 변경 */
           }



    </style>
    <script src="https://apis.google.com/js/api.js"></script>
        <script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
        <link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
    <link rel="stylesheet" href="css/modal.css">
</head>
<body>

<header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
    <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
      <img src="img/online.png" style="width: 120px; height: 100px; margin-right: 10px;">
        <span class="fs-4">Coding Education</span>
    </a>

    <ul class="nav nav-pills">
      <img src="img/person-circle.svg" style="width: 60px; height: 38px; margin: 10px 20px 0px 0px;">

    </ul>
</header>

<main class="d-flex flex-nowrap">
    <div id="sidebar" class="flex-column flex-shrink-0 p-3 bg-body-tertiary" style="width: 280px;">
        <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
            <svg class="bi pe-none me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg>
            <span class="fs-4">Sidebar</span>
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

        <button id="btn-hide" class="btn btn-primary" style="margin-top: 500px;">메뉴숨기기</button>
</div>
<div>

    <button id="btn-show" class="btn btn-primary" style="margin-top: 780px; border-radius: 50%;">
        <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8"/>
          </svg>
    </button>
</div>
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
                    <input type="button" class="btn btn-primary" value="초기화" id="resetButton">
                </div>
            </div>
              </form>
        </div>

        <div class="row g-3 border p-3" style="margin-top: 50px;">
            <h4>온라인콘텐츠</h4>
            <div class="col-md-7" style="overflow-x: auto; overflow-y: auto; max-height: 600px;">

                <table class="table table-striped table-bordered table-hover" id="myTable">
                    <thead class="table-light">
                    <tr>
                        <th scope="col"><input type="checkbox" id="masterCheckbox" onchange="toggleAllCheckboxes()"></th>
                        <th scope="col" style="text-align: center;">교과목</th>
                        <th scope="col" style="text-align: center;">콘텐츠명</th>
                        <th scope="col" style="text-align: center;">Youtube연동번호</th>
                        <th scope="col" style="text-align: center;">학습시간</th>
                    </tr>
                    </thead>

<tbody id="tableBody">
    <c:choose>
        <c:when test="${empty selectSearch}">
            <c:forEach var="contents" items="${contentList}" varStatus="loop">
                <tr>
                    <td><input type="checkbox" onclick="handleClick('${contents.conNum}')"></td>
                    <td onclick="handleClick('${contents.conNum}'); return false;">${contents.lecName}</td>
                    <td onclick="handleClick('${contents.conNum}'); return false;">${contents.conName}</td>
                    <td onclick="handleClick('${contents.conNum}'); return false;">${contents.videoId}</td>
                    <td onclick="handleClick('${contents.conNum}'); return false;">${contents.durationTime}</td>
                </tr>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <c:forEach var="search" items="${selectSearch}" varStatus="loop">
                <tr>
                    <td><input type="checkbox" onclick="handleClick('${search.conNum}')"></td>
                    <td onclick="handleClick('${search.conNum}'); return false;">${search.lecName}</td>
                    <td onclick="handleClick('${search.conNum}'); return false;">${search.conName}</td>
                    <td onclick="handleClick('${search.conNum}'); return false;">${search.videoId}</td>
                    <td onclick="handleClick('${search.conNum}'); return false;">${search.durationTime}</td>
                </tr>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</tbody>



                </table>

            </div>

            <div class="col-md-5" id="tabMenu">

                <ul class="nav nav-tabs">

                    <li class="nav-item">
                        <a class="nav-link active" id="tab1" data-toggle="tab" href="#notice">컨텐츠정보</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="tab2" data-toggle="tab" href="#dataRoom">챕터정보</a>
                    </li>
                </ul>

                <div id="notice" class="tabContent">

                    <div id="contentInfo" class="mb-3">

                        <table class="table table border">

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
                                <input type="button" style="margin-left: 10px;" class="js-preview-link" data-conNum="${conNum}" value="영상확인">
                                </div>
                                </td>
                            </tr>


                            <tr>
                                <td class="table-light">차시학습시간[초]</td>

                                <td>
                                <div style="display: flex; align-items: center;">
                                    <input type="text" class="form-control" id="conPlayTime" name="conPlayTime" value="${selectContent.conPlayTime}">
                                    <input type="button" style="margin-left: 10px; display: inline-block;" onclick="updateVideoDuration(); return false;" value="갱신">

                                </div>

                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <div>
                            <input type="hidden" value="${selectContent.conNum}">
                            <input type="submit" value="저장" class="btn btn-primary" style="float: right; margin-right: 0px;">
                            </form>

                            <form action="deleteContent" id="deleteContentForm">
                            <input type="hidden" name="conNum" id="deleteBtn"  value="${selectContent.conNum}">
                            <input type="submit" class="btn btn-primary" style="float: right; margin-right: 5px;" value="삭제">
                            </form>



                                <input type="button" onclick="addEmptyRowBelow(this)" class="btn btn-primary" style="float: right; margin-right: 5px;" value="추가">

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
                            <table id="dataTable">
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


                    <div id="chapterInfo" style="overflow-x: auto; overflow-y: auto; max-height: 200px;">
                        <table class="table table-striped table-bordered table-hover">
                            <thead class="table-light">
                            <tr>
                                <th scope="col" style="text-align: center;">챕터</th>
                                <th scope="col" style="text-align: center;">챕터명</th>
                                <th scope="col" style="text-align: center;">위치(시분초)</th>
                                <th scope="col" style="text-align: center;">시작위치[초]</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td style="text-align: center;">1</td>
                                <td style="text-align: center;">B-0423</td>
                                <td style="text-align: center;">00:00:00</td>
                                <td style="text-align: center;">20</td>

                            </tr>
                            <tr>
                                <td style="text-align: center;">2</td>
                                <td style="text-align: center;">변수의 개념</td>
                                <td style="text-align: center;">00:00:00</td>
                                <td style="text-align: center;">60</td>
                            </tr>
                            <tr>
                                <td style="text-align: center;">3</td>
                                <td style="text-align: center;">Java</td>
                                <td style="text-align: center;">00:00:00</td>
                                <td style="text-align: center;">150</td>
                            </tr>
                            <tr>
                                <td style="text-align: center;">4</td>
                                <td style="text-align: center;">서식1</td>
                                <td style="text-align: center;">00:00:00</td>
                                <td style="text-align: center;">200</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>

        </div>
    </div>
    <div id="lectureForm"></div>
</main>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="js/sidebar.js"></script>
<script src="js/tabMenu.js"></script>
<script src="js/selectAjax.js"></script>
<script src="js/modal.js"></script>
<script src="js/videoTime.js"></script>
<script src="js/grid.js"></script>

<script src="js/checkBox.js"></script>

<script>
$(document).ready(function() {
    // 로컬 스토리지에서 숨김 상태를 가져옵니다.
    var isContainerHidden = localStorage.getItem('isContainerHidden');

    // 컨텐츠정보 링크 클릭 시
    $('#contentLink').click(function(e) {
        e.preventDefault(); // 기본 이벤트(링크 이동) 방지

        // 강좌 정보 폼을 숨깁니다.
        $('#lectureForm').hide();

        // .container-fluid를 나타내기만 합니다.
        $('.container-fluid').show();

        // 숨김 상태를 로컬 스토리지에 저장합니다.
        localStorage.setItem('isContainerHidden', false);

        // 강좌 정보 폼의 submit 이벤트 제거
        $('#lectureForm').off('submit');
    });

    // 강좌정보 링크 클릭 시
    $('#lectureLink').click(function(e) {
        e.preventDefault(); // 기본 이벤트(링크 이동) 방지

        // AJAX를 통해 강좌 정보 폼을 가져옵니다.
        $.ajax({
            url: '/lecture', // 컨트롤러의 URL
            method: 'GET',
            success: function(response) {
                // 성공적으로 폼을 가져왔을 때, 가져온 HTML을 삽입합니다.
                $('#lectureForm').html(response);

                // 숨김 상태를 로컬 스토리지에 저장합니다.
                localStorage.setItem('isContainerHidden', true);

                // 컨텐츠 정보를 숨기고 강좌 정보 폼을 표시합니다.
                $('.container-fluid').hide();
                $('#lectureForm').show();

                // 강좌 정보 폼의 submit 이벤트 추가
                $('#lectureForm').submit(function(e) {
                    // 필요한 작업 수행
                });
            },
            error: function(xhr, status, error) {
                // 에러가 발생했을 때의 처리
                console.error(error);
            }
        });
    });

    // 페이지 로드 시 저장된 숨김 상태를 확인하고 적용합니다.
    if (isContainerHidden === 'true') {
        // 강좌 정보 폼을 숨깁니다.
        $('#lectureForm').hide();
    } else {
        // 컨텐츠 정보를 숨기고 강좌 정보 폼을 표시합니다.
        $('.container-fluid').hide();
        $('#lectureForm').show();
    }
});


$(document).ready(function() {
    // 폼 전송 이벤트를 가로챕니다.
    $('#updateContent').submit(function(e) {
        e.preventDefault(); // 기본 전송 이벤트를 막습니다.

        // 폼 데이터를 가져옵니다.
        var formData = $(this).serialize();

        // AJAX 요청을 보냅니다.
        $.ajax({
            url: 'updateContent', // 서버의 엔드포인트 URL
            method: 'POST', // HTTP 메서드
            data: formData, // 폼 데이터
            success: function(response) {
                // 성공적으로 요청을 보냈을 때의 처리
                console.log('요청 성공');

                // 업데이트된 데이터를 받아서 목록을 업데이트하는 함수를 호출
                updateContentList();
            },
            error: function(xhr, status, error) {
                // 요청이 실패했을 때의 처리
                console.error('요청 실패');
                console.error(error);
                // 실패 메시지 또는 오류 처리를 수행할 수 있습니다.
            }
        });
    });


    $('#deleteContentForm').submit(function(event) {
        event.preventDefault(); // 기본 폼 제출 방지

        // 폼 데이터를 가져옵니다.
        var formData = $(this).serialize();

        // AJAX 요청을 보냅니다.
        $.ajax({
            url: $(this).attr('action'),
            method: 'POST',
            data: formData,
            success: function(response) {
                // 성공적으로 요청을 보냈을 때의 처리
                console.log("삭제 요청 성공");

                // 삭제 후 업데이트된 목록을 불러옵니다.
                updateContentList();
            },
            error: function(xhr, status, error) {
                // 요청이 실패했을 때의 처리
                console.error("요청 실패");
                console.error(error);
            }
        });
    });

    // 목록을 업데이트하는 함수
    function updateContentList() {
        $.ajax({
            url: 'content', // 서버의 엔드포인트 URL
            type: 'GET', // HTTP 메서드
            success: function(response) {
                // 응답에서 업데이트된 목록 데이터를 추출
                var updatedContentList = $(response).find('#tableBody').html();

                // 현재 페이지의 목록을 업데이트된 목록으로 교체
                $('#tableBody').html(updatedContentList);
            },
            error: function(xhr, status, error) {
                // AJAX 요청이 실패한 경우의 처리
                console.error('AJAX 요청 실패:', status, error);
            }
        });
    }
});


$(document).ready(function() {
    // 초기 목록을 불러오는 함수
    function loadInitialContent() {
        $.ajax({
            url: 'content', // 기본 목록을 가져오는 엔드포인트 URL
            method: 'GET', // HTTP 메서드
            success: function(response) {
                // 응답에서 <tbody> 내부의 콘텐츠만 추출합니다.
                var newTableBodyContent = $(response).find('tbody').html();

                // 목록을 업데이트합니다.
                $('#tableBody').html(newTableBodyContent);
            },
            error: function(xhr, status, error) {
                // 요청이 실패했을 때의 처리
                console.error("초기 목록 요청 실패");
                console.error(error);
            }
        });
    }


    // 검색 폼 전송 이벤트를 가로챕니다.
    $('#searchForm').submit(function(event) {
        event.preventDefault(); // 기본 폼 제출을 막습니다.

        // 폼 데이터를 가져옵니다.
        var formData = $(this).serialize();

        // 입력 필드의 값을 확인합니다.
        var conName = $('#firstName').val().trim();
        var lecName = $('#lastName').val().trim();

        if (conName === "" && lecName === "") {
            // 검색 값이 비어 있으면 초기 목록을 불러옵니다.
            loadInitialContent();
        } else {
            // 검색 값이 비어 있지 않으면 AJAX 요청을 보냅니다.
            $.ajax({
                url: 'selectSearch', // 서버의 엔드포인트 URL
                method: 'POST', // HTTP 메서드
                data: formData, // 폼 데이터
                success: function(response) {
                    // 성공적으로 요청을 보냈을 때의 처리
                    console.log("검색 요청 성공");

                    // 응답에서 <tbody> 내부의 콘텐츠만 추출합니다.
                    var newTableBodyContent = $(response).find('tbody').html();

                    // 검색 결과를 업데이트합니다.
                    $('#tableBody').html(newTableBodyContent);
                },
                error: function(xhr, status, error) {
                    // 요청이 실패했을 때의 처리
                    console.error("검색 요청 실패");
                    console.error(error);
                }
            });
        }
    });

    // 검색 버튼 클릭 시 폼 리셋 및 초기 목록 로드
    $('#resetButton').click(function(event) {
        event.preventDefault(); // 기본 이벤트를 막습니다.

        // 폼을 리셋합니다.
        $('#searchForm')[0].reset();

        // 초기 목록을 불러옵니다.
        loadInitialContent();
    });
});









</script>


</body>
</html>