<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>게시글 등록</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<style>
		body {
			background-color: #fff;
			padding-top: 80px; /* 네비게이션 바의 높이만큼 여백 추가 */
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
		/* 버튼의 배경색과 글꼴 색상 변경 */
                        .btn-primary, .btn-success, .btn-danger {
                            background-color: #323232;
                            color: #ffffff;
                            border-color: #323232;
                        }
	</style>
</head>
<body>
<div class="container">
	<h2>게시글 등록</h2>
	<form id="frm" name="frm" method="post" action="/board/insertBoard.do" enctype="multipart/form-data">
		<div class="form-group">
			<label for="title">제목</label>
			<input type="text" class="form-control" id="title" name="title">
		</div>
		<div class="form-group">
			<label for="contents">내용</label>
			<textarea class="form-control" id="contents" name="contents" rows="5"></textarea>
		</div>
		<div class="form-group">
			<label for="files">첨부 파일</label>
			<input type="file" class="form-control-file" id="files" name="files" multiple="multiple">
		</div>
		<button type="submit" id="submit" class="btn btn-primary">저장</button>
		<a href="/board/openBoardList.do" class="btn btn-secondary">목록으로</a>
		<a href="/indexadmin" class="btn btn-secondary">홈</a>
		<!-- memberid 값을 전송하기 위한 hidden input 태그 추가 -->
		<input type="hidden" id="loginId" name="loginId" value="${loggedInUser.loginId}">

	</form>
</div>
</body>
</html>
