<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>lecture</title>
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
    </style>
</head>
<body>


    <div id="lectureForm">
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

        <div class="row g-3 border p-3" style="margin-top: 50px;" id="divHide">
            <h4>강좌정보</h4>
            <div class="col-md-7" style="overflow-x: auto; overflow-y: auto; max-height: 600px;" id="lectureListWrapper">

                <table class="table table-striped table-bordered table-hover" id="myTable">
                    <thead class="table-light">
                    <tr>
                        <th scope="col" style="text-align: center;">강좌번호</th>
                        <th scope="col" style="text-align: center;">시작날짜</th>
                        <th scope="col" style="text-align: center;">종료날짜</th>
                        <th scope="col" style="text-align: center;">강의이름</th>
                        <th scope="col" style="text-align: center;">강의설명</th>
                    </tr>
                    </thead>

                <c:choose>
                    <c:when test="${empty selectSearch}">
                    <tbody id="tdInsert">
                        <c:forEach var="lecture" items="${lectureList}" varStatus="loop">
                                <tr>
                                    <td onclick="lectureClick('${lecture.getLecNum()}'); return false;">${lecture.getLecNum()}</td>
                                    <td onclick="lectureClick('${lecture.getLecNum()}'); return false;">${lecture.getLecStartDate()}</td>
                                    <td onclick="lectureClick('${lecture.getLecNum()}'); return false;">${lecture.getLecEndDate()}</td>
                                    <td onclick="lectureClick('${lecture.getLecNum()}'); return false;">${lecture.getLecName()}</td>
                                    <td onclick="lectureClick('${lecture.getLecNum()}'); return false;">${lecture.getLecEx()}</td>
                                </tr>
                        </c:forEach>
                    </tbody>
                    </c:when>


                    <c:otherwise>
                        <c:forEach var="lecture" items="${lectureList}" varStatus="loop">
                            <tbody id="tdInsert">
                                <tr>
                                    <td onclick="lectureClick('${lecture.getLecNum()}'); return false;">${lecture.getLecNum()}</td>
                                    <td onclick="lectureClick('${lecture.getLecNum()}'); return false;">${lecture.getLecStartDate()}</td>
                                    <td onclick="lectureClick('${lecture.getLecNum()}'); return false;">${lecture.getLecEndDate()}</td>
                                    <td onclick="lectureClick('${lecture.getLecNum()}'); return false;">${lecture.getLecName()}</td>
                                    <td onclick="lectureClick('${lecture.getLecNum()}'); return false;">${lecture.getLecEx()}</td>
                                </tr>
                            </tbody>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>


                </table>

            </div>
                <div id="notice" class="tabContent">

                    <div id="contentInfo" class="mb-3">
                    <form action="lectureInfo" method="post">
                        <table class="table table border">

                            <tbody>
                            <tr>
                                <td class="table-light">온라인강좌번호</td>
                                <td><input type="text" class="form-control" name="lecNum" value="${selectLecture.lecNum}" readonly></td>
                            </tr>

                            <tr>
                                <td class="table-light">온라인강좌명</td>
                                    <td><input type="text" class="form-control" id="lecName" name="lecName" value="${selectLecture.lecName}"></td>
                            </tr>

                            <tr>
                                <td class="table-light">강좌시작일시</td>
                                    <td><input type="text" class="form-control" id="lecStartDate" name="lecStartDate" value="${selectLecture.lecStartDate}"></td>
                            </tr>

                            <tr>
                                <td class="table-light">강좌종료일시</td>
                                <td>
                                <input type="text" class="form-control" id="lecEndDate" name="lecEndDate" value="${selectLecture.lecEndDate}" style="margin-right: 5px;">

                                </td>
                            </tr>

                            <tr>
                                <td class="table-light">온라인강좌설명</td>
                                <td><textarea class="form-control" name="lecEx" value="${selectLecture.lecEx}"></textarea></td>
                            </tr>

                            </tbody>

                        </table>
                            <input type="submit" value="Insert" class="btn btn-primary" style="float: right; margin-right: 0px;">
                            </form>

                    </div>

                        <div>

                            <form action="deleteContent">
                            <input type="hidden" name="conNum" id="deleteBtn"  value="">
                            <input type="submit" class="btn btn-primary" style="float: right; margin-right: 5px;" value="삭제">
                            </form>
                            <input type="button" onclick="addEmptyRowBelow(this)" class="btn btn-primary" style="float: right; margin-right: 5px;" value="추가">

                            </div>
                    </div>



                </div>
            </div>

        </div>
    </div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>

<script src="js/lectureGrid.js"></script>
<script>

function lectureClick(lecNum) {
    // 클릭된 요소의 lecNum 값을 사용하여 AJAX 요청을 보냅니다.
    $.ajax({
        type: "GET",
        url: "/selectLecture?lecNum=" + lecNum, // 클릭된 요소의 lecNum 값을 URL에 포함
        success: function(response) {
            // 응답 데이터를 사용하여 해당 폼 요소의 값을 설정합니다.
            $('input[name="lecNum"]').val(response.lecNum);
            $('input[name="lecName"]').val(response.lecName);
            $('input[name="lecStartDate"]').val(response.lecStartDate);
            $('input[name="lecEndDate"]').val(response.lecEndDate);
            $('textarea[name="lecEx"]').val(response.lecEx);
        },
        error: function(xhr, status, error) {
            // 오류 처리
            console.error("Error:", error);
        }
    });
}

</script>
<script>
$(document).ready(function() {
    $('form').submit(function(event) {
        // 폼의 기본 동작을 막습니다.
        event.preventDefault();

        // 폼 데이터를 직렬화합니다.
        var formData = $(this).serialize();

        // 현재 폼을 변수에 저장합니다.
        var $form = $(this);

        // AJAX 요청을 보냅니다.
        $.ajax({
            url: 'lectureInfo', // 강좌 정보를 추가하는 서버의 엔드포인트
            type: 'POST', // POST 요청
            data: formData, // 폼 데이터 전송
            success: function(response) {
                // 성공적으로 응답을 받았을 때 실행되는 콜백 함수
                // 새로운 강좌 정보를 가져와서 목록에 추가합니다.
                appendNewLecture(response);

                // 폼의 입력 필드를 비웁니다.
                $form[0].reset();
            },
            error: function(xhr, status, error) {
                // 요청이 실패한 경우 실행되는 콜백 함수
                console.error('AJAX request failed:', status, error);
            }
        });
    });

    function appendNewLecture() {
        $.ajax({
            url: 'lectureDetail',
            type: 'GET',
            success: function(response) {
                // 응답에서 헤더와 사이드바를 제외한 부분을 추출하여 사용
                var lectureInfo = $(response).find('#tdInsert').html();
                $('#tdInsert').html(lectureInfo);
            },
            error: function(xhr, status, error) {
                console.error('AJAX request failed:', status, error);
            }
        });
    }
});

</script>






</body>
</html>
