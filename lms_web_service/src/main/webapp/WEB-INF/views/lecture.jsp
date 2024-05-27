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
            <link rel="stylesheet" href="css/lecture.css">
</head>
<body>

    <div id="lectureForm">
        <div class="row g-3 border p-3" style="margin-top: 10px; border-radius: 10px;">
            <form action="lectureSearch" method="post" class="form-inline" id="lectureSearch">
                <div class="col-sm-12">
                    <div class="form-group" style="margin-left: 40px;">
                        <label for="lecName">교과목명</label>
                        <input type="text" class="form-control mb-2 mr-sm-2" id="lec_name" name="lecName" style="max-width: 350px; margin-right:300px">

                        <label for="lecEx">강좌내용</label>
                        <input type="text" class="form-control mb-2 mr-sm-2" id="lecEx" name="lecEx" style="max-width: 350px;">

                        <input type="submit" class="btn btn-primary mb-2" value="검색">
                    </div>
                </div>
            </form>
        </div>



        <div class="row g-3 border p-3" style="margin-top: 50px; width:100%;" id="divHide">
            <h4>강좌정보</h4>
            <div class="col-md-7" style="overflow-x: auto; overflow-y: auto; max-height: 600px; width:100%;" id="lectureListWrapper">

                <table class="table table-striped table-bordered table-hover" style="width:100%"; id="myTable">
                    <thead class="table-light">
                    <tr>
                        <th scope="col" style="text-align: center;">강좌번호</th>
                        <th scope="col" style="text-align: center;">시작날짜</th>
                        <th scope="col" style="text-align: center;">종료날짜</th>
                        <th scope="col" style="text-align: center;">강의이름</th>
                        <th scope="col" style="text-align: center;">강의설명</th>
                    </tr>
                    </thead>

                <tbody id="tdInsert">
                    <c:choose>
                        <c:when test="${empty lectureSearch}">
                            <c:forEach var="lecture" items="${lectureList}" varStatus="loop">
                                <tr>
                                    <td onclick="lectureClick('${lecture.getLecNum()}'); return false;">${lecture.getLecNum()}</td>
                                    <td onclick="lectureClick('${lecture.getLecNum()}'); return false;">${lecture.getLecStartDate()}</td>
                                    <td onclick="lectureClick('${lecture.getLecNum()}'); return false;">${lecture.getLecEndDate()}</td>
                                    <td onclick="lectureClick('${lecture.getLecNum()}'); return false;">${lecture.getLecName()}</td>
                                    <td onclick="lectureClick('${lecture.getLecNum()}'); return false;">${lecture.getLecEx()}</td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="lecture" items="${lectureSearch}" varStatus="loop">
                                <tr>
                                    <td onclick="lectureClick('${lecture.getLecNum()}'); return false;">${lecture.getLecNum()}</td>
                                    <td onclick="lectureClick('${lecture.getLecNum()}'); return false;">${lecture.getLecStartDate()}</td>
                                    <td onclick="lectureClick('${lecture.getLecNum()}'); return false;">${lecture.getLecEndDate()}</td>
                                    <td onclick="lectureClick('${lecture.getLecNum()}'); return false;">${lecture.getLecName()}</td>
                                    <td onclick="lectureClick('${lecture.getLecNum()}'); return false;">${lecture.getLecEx()}</td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </tbody>



                </table>

            </div>
                <div id="lectureNotice" class="tabLecture">

                    <div id="lectureInfo" class="mb-3">
                    <form action="lectureInfo" method="post" id="lectureReset">
                        <table class="table table border">

                            <tbody>
                            <tr>
                                <td class="table-light">온라인강좌번호</td>
                                <td><input type="text" class="form-control" name="lecNum" value="${selectLecture.lecNum}" id="inputLecNum" readonly></td>
                            </tr>

                            <tr>
                                <td class="table-light">온라인강좌명</td>
                                    <td><input type="text" class="form-control" id="inputLecName" name="lecName" value="${selectLecture.lecName}"></td>
                            </tr>

                            <tr>
                                <td class="table-light">강좌시작일시</td>
                                    <td><input type="date" class="form-control" id="lecStartDate" name="lecStartDate" value="${selectLecture.lecStartDate}"></td>
                            </tr>

                            <tr>
                                <td class="table-light">강좌종료일시</td>
                                <td>
                                <input type="date" class="form-control" id="lecEndDate" name="lecEndDate" value="${selectLecture.lecEndDate}" style="margin-right: 5px;">

                                </td>
                            </tr>

                            <tr>
                                <td class="table-light">온라인강좌설명</td>
                                <td><textarea class="form-control" style="height: 150px;" name="lecEx" value="${selectLecture.lecEx}"></textarea></td>
                            </tr>

                            </tbody>

                        </table>
                            <input type="submit" value="저장" class="btn btn-primary" style="float: right; margin-right: 0px;">
                            </form>

                    </div>

                        <div>
                            <form action="deleteLecture" id="deleteLectureForm">
                            <input type="hidden" name="lecNum" id="deleteButton"  value="${selectLecture.lecNum}">
                            <input type="submit" class="btn btn-primary" style="float: right; margin-right: 5px;" value="삭제">
                            </form>

                            <input type="button" onclick="addEmptyRow(this)" class="btn btn-primary" style="float: right; margin-right: 5px;" value="추가">

                            </div>
                    </div>



                </div>
            </div>

        </div>
    </div>

<script src="js/lectureGrid.js"></script>
<script src="js/lectureProcess.js"></script>
<script src="js/lectureClick.js"></script>
</body>
</html>
