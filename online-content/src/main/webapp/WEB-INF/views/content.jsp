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

    .modal {
        display: none; /* 기본적으로 숨겨진 상태 */
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0,0,0,0.4); /* 배경에 어둡게 */
    }

    /* 모달 콘텐츠 스타일 */
    .modal-content {
        background-color: #fefefe;
        margin: 15% auto;
        padding: 20px;
        border: 1px solid #ddd; /* 테두리 추가 */
        max-width: 1000px; /* 최대 너비 제한 */
        width: 80%; /* 화면 폭의 80%로 설정 */
        box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2); /* 그림자 추가 */
        position: relative; /* x 버튼을 위치시킬 때 상대적으로 위치 설정 */
    }


    /* 닫기 버튼 스타일 */
    .close {
        color: #aaa;
        font-size: 28px;
        font-weight: bold;
        position: absolute; /* 상대적으로 위치 설정 */
        top: 10px; /* 위쪽 여백 */
        right: 10px; /* 오른쪽 여백 */
    }

    .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }

    /* 검색 입력 필드 스타일 */
    .search-input {
        width: 75%; /* 너비 조정 */
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ddd; /* 테두리 추가 */
        border-radius: 5px; /* 모서리 둥글게 */
        box-sizing: border-box; /* 패딩과 테두리 포함 */
    }

    /* 검색 버튼 스타일 */
    .search-button, .select-button {
        width: 10%; /* 너비 조정 */
        padding: 10px;
        background-color: #007bff; /* 파란색 배경 */
        color: white;
        border: none;
        border-radius: 5px; /* 모서리 둥글게 */
        cursor: pointer;
    }

    /* 검색 버튼 호버 스타일 */
    .search-button:hover, .select-button:hover {
        background-color: #0056b3; /* 파란색 더 진한 배경 */
    }

    /* 테이블 스타일 */
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }

    th {
        background-color: #f2f2f2; /* 테이블 헤더 배경색 */
    }

    </style>
    <script src="https://apis.google.com/js/api.js"></script>
        <script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
        <link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
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
        <div class="row g-3 border p-3" style="margin-top: 10px; border-radius: 10px;">
            <div class="col-sm-6">
                <form action="selectSearch" method="post">
                    <div class="form-group" style="margin-left: 40px;">
                        <label for="firstName">콘텐츠명</label>

                        <input type="text" class="form-control" id="firstName" name="conName" placeholder="" value="" style="max-width: 350px;">
                    </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label for="lastName">교과목명</label>

                    <input type="text" class="form-control" id="lastName" name="lecName" placeholder="" value="" style="max-width: 350px;">
                    <input type="submit"class="btn btn-primary" value="검색"></input>
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

                <c:choose>
                    <c:when test="${empty selectSearch}">
                    <tbody id="tableBody">
                        <c:forEach var="contents" items="${contentList}" varStatus="loop">
                                <tr>
                                    <td><input type="checkbox" onclick="handleClick('${contents.getConNum()}')"></td>
                                    <td onclick="handleClick('${contents.getConNum()}'); return false;">${contents.getLecName()}</td>
                                    <td onclick="handleClick('${contents.getConNum()}'); return false;">${contents.getConName()}</td>
                                    <td onclick="handleClick('${contents.getConNum()}'); return false;">${contents.getVideoId()}</td>
                                    <td onclick="handleClick('${contents.getConNum()}'); return false;">${contents.durationTime}</td>
                                </tr>
                        </c:forEach>
                    </tbody>
                    </c:when>


                    <c:otherwise>
                        <c:forEach var="search" items="${selectSearch}" varStatus="loop">
                            <tbody id="tableBody">
                                <tr>
                                    <td><input type="checkbox" onclick="handleClick('${contents.getConNum()}')"></td>
                                    <td onclick="handleClick('${search.getConNum()}'); return false;">${search.getLecName()}</td>
                                    <td onclick="handleClick('${search.getConNum()}'); return false;">${search.getConName()}</td>
                                    <td onclick="handleClick('${search.getConNum()}'); return false;">${search.getVideoId()}</td>
                                    <td onclick="handleClick('${search.getConNum()}'); return false;">${search.durationTime}</td>
                                </tr>
                            </tbody>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>


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

                        <form action="updateContent">
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

                            <div id="myModal" class="modal">
                                <div class="modal-content">
                                    <span class="close">&times;</span>
                                    <div>
                                    <input type="text" class="search-input" placeholder="교과목을 검색하세요...">
                                    <button class="search-button">검색</button>
                                    <button class="select-button">선택</button>
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
                                        <tbody>
                                        <c:forEach var="lecture" items="${lectureList}" varStatus="loop">
                                            <tr>
                                                <td>${lecture.getLecNum()}</td>
                                                <td>${lecture.getLecStartDate()}</td>
                                                <td>${lecture.getLecEndDate()}</td>
                                                <td>${lecture.getLecName()}</td>
                                                <td>${lecture.getLecEx()}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
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

                            <form action="deleteContent">
                            <input type="hidden" name="conNum" id="deleteBtn"  value="${selectContent.conNum}">
                            <input type="submit" class="btn btn-primary" style="float: right; margin-right: 5px;" value="삭제">
                            </form>


                            <form action="insertContent" method="post">
                                <input type="hidden" class="form-control" name="conNum">
                                <input type="hidden" class="form-control" name="conName">
                                <input type="hidden" class="form-control" name="lecName">
                                <input type="hidden" class="form-control" name="lecNum">
                                <input type="hidden" class="form-control" name="description">
                                <input type="hidden" class="form-control" name="videoId">
                                <input type="hidden" class="form-control" name="conPlayTime">
                                <input type="submit" class="btn btn-primary" style="float: right; margin-right: 5px;" value="신규">
                                <input type="button" onclick="addEmptyRowBelow(this)" class="btn btn-primary" style="float: right; margin-right: 5px;" value="추가">

                            </form>
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
<script src="js/search.js"></script>
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
            },
            error: function(xhr, status, error) {
                // 에러가 발생했을 때의 처리
                console.error(error);
            }
        });
    });

    // 페이지 로드 시 저장된 숨김 상태를 확인하고 적용합니다.
    if (isContainerHidden === 'true') {
        $('.container-fluid').hide();
    } else {
        $('.container-fluid').show();
    }
});









</script>


</body>
</html>