<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>자료실</title>
	<!-- 부트스트랩 CDN 추가 -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
	<h2>자료실</h2>
	<form id="frm" method="post">
		<div class="table-responsive">
			<table class="table">
				<colgroup>
					<col width="15%"/>
					<col width="35%"/>
					<col width="15%"/>
					<col width="35%"/>
				</colgroup>
				<tbody>
				<tr>
					<th scope="row">글 번호</th>
					<td>${board1.boardIdx}</td>
					<th scope="row">조회수</th>
					<td>${board1.hitCnt}</td>
				</tr>
				<tr>
					<th scope="row">작성자</th>
					<td>관리자</td>
					<th scope="row">작성일</th>
					<td>${board1.createdDatetime}</td>
				</tr>
				<tr>
                    <th scope="row">제목</th>
                    <td colspan="3"><input type="text" class="form-control" id="title" name="title" value="${board1.title}" readonly /></td>
                </tr>
                <tr>
                    <td colspan="4" class="view_text">
                        <textarea class="form-control" title="내용" id="contents" name="contents" readonly>${board1.contents}</textarea>
                    </td>
                </tr>

				</tbody>
			</table>
		</div>
		<input type="hidden" id="boardIdx" name="boardIdx" value="${board.boardIdx}" />
	</form>
<p>-------------------첨부파일-------------------------</p>
	    <div class="file_list">
	       <c:forEach var="list" items="${board1.fileList}">
	            <a href="<c:url value='/board/downloadBoardFile.do' />?idx=${list.idx}&amp;boardIdx=${list.boardIdx}">${list.originalFileName} (${list.fileSize} kb)</a>
	        </c:forEach>
	    </div>



<div class="file_list">
    <c:forEach var="file" items="${board1.fileList}">
        <div class="file_item">
            <c:choose>
                <c:when test="${fn:endsWith(file.originalFileName, '.jpg') or fn:endsWith(file.originalFileName, '.jpeg') or fn:endsWith(file.originalFileName, '.png') or fn:endsWith(file.originalFileName, '.gif')}">
                    <img src="<c:url value='/board/downloadBoardFile.do' />?idx=${file.idx}&amp;boardIdx=${file.boardIdx}" alt="Image">
                    <br>
                    <a href="<c:url value='/board/downloadBoardFile.do' />?idx=${file.idx}&amp;boardIdx=${file.boardIdx}">다운로드 ${file.originalFileName}</a>

                </c:when>
            </c:choose>
        </div>
    </c:forEach>
</div>




	<a href="<c:url value='/boardlistuser' />" class="btn btn-primary">목록으로</a>
	<a href="<c:url value='/' />" class="btn btn-primary">홈으로</a>
</div>

<!-- jQuery 및 부트스트랩 JS CDN 추가 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		$("#edit").on("click", function(){
			var frm = $("#frm")[0];
			frm.action = "<c:url value='/board/updateBoard.do'/>";
			frm.submit();
		});

		$("#delete").on("click", function(){
			var frm = $("#frm")[0];
			frm.action = "<c:url value='/board/deleteBoard.do'/>";
			frm.submit();
		});
	});


</script>




</body>
</html>