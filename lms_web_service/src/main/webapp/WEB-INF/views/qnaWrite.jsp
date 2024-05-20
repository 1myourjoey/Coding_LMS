<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Q&A 등록</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<style>
		body {
			background-color: #f8f9fa;
			padding-top: 50px; /* 네비게이션 바의 높이만큼 여백 추가 */
		}

		.container {
			background-color: #fff;
			border-radius: 5px;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
			padding: 20px;
		}

		h2 {
			margin-bottom: 20px;
		}
	</style>
</head>
<body>
<div class="container">
	<a href="index">
                            <h1>LMS</h1>
                        </a>
	<form id="frm" name="frm" method="post" action="/qna/insertQna.do" enctype="multipart/form-data">
		<div class="form-group">
			<label for="qnaTitle">제목</label>
			<input type="text" class="form-control" id="qnaTitle" name="qnaTitle" placeholder="제목을 입력하세요">
		</div>
		<div class="form-group">
			<label for="qnaContents">내용</label>
			<textarea class="form-control" id="qnaContents" name="qnaContents" rows="5" placeholder="내용을 입력하세요"></textarea>
		</div>
		<button type="submit" id="submit" class="btn btn-secondary">등록</button>
		        <a href="/qna/openQnaList.do" class="btn btn-secondary">목록으로</a>
<%--		<input type="hidden" id="userNo" name="userNo" value="${loggedInUser.userNo}">--%>

	</form>
</div>
</body>
</html>
