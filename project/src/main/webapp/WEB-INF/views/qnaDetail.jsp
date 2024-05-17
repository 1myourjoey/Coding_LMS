<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <div class="table-responsive">
        <table class="table">
            <colgroup>
                <col width="15%"/>
                <col width="35%"/>
                <col width="15%"/>
                <col width="35%"/>
            </colgroup>
            <tbody>
            <c:forEach items="${qnalist1}" var="qna">
                <form id="frm-${qna.qNum}" method="post" action="/qna/updateQna.do">
                    <input type="hidden" name="qNum" value="${qna.qNum}" />
                    <tr>
                        <th scope="row">글 번호</th>
                        <td>${qna.qNum}</td>
                        <th scope="row">조회수</th>
                        <td>${qna.hitCnt}</td>
                    </tr>
                    <tr>
                        <th scope="row">작성자</th>
                        <td>${qna.userNo}</td>
                        <th scope="row">작성일</th>
                        <td>${qna.qnaCreated}</td>
                    </tr>
                    <tr>
                        <th scope="row">제목</th>
                        <td colspan="3">
                            <input type="text" class="form-control" id="qnaTitle" name="qnaTitle" value="${qna.qnaTitle}"<c:if test="${sessionScope.loggedInUser != null && sessionScope.loggedInUser.adminYn eq 'N'}"> readonly</c:if> />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" class="view_text">
                            <textarea class="form-control" title="내용" id="qnaContents" name="qnaContents"<c:if test="${sessionScope.loggedInUser != null && sessionScope.loggedInUser.adminYn eq 'N'}"> readonly</c:if>>${qna.qnaContents}</textarea>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <c:if test="${sessionScope.loggedInUser != null && sessionScope.loggedInUser.adminYn eq 'Y'}">
                                <button type="submit" form="frm-${qna.qNum}" class="btn btn-primary">수정하기</button>
                                <a href="/qna/deleteQna.do?qNum=${qna.qNum}" class="btn btn-primary">삭제하기</a>
                            </c:if>
                        </td>
                    </tr>
                </form>
<c:forEach items="${comlist}" var="comment">
    <!-- 댓글 출력 -->
    <tr>
        <td colspan="4" class="bg-light">
            <strong>${comment.userNo}</strong> (${comment.commentContents}): ${comment.commentCreated}:
            <a href="javascript:void(0)" onclick="toggleReplyForm(${comment.commentNum})">답글달기</a>
             <button onclick="showEditForm(${comment.commentNum})">수정하기</button>
            <a href="/deleteReply?commentNum=${comment.commentNum}&qNum=${qna.qNum}">삭제하기</a>
        </td>
    </tr>

    <!-- 댓글 수정 폼 -->
    <tr id="editForm_${comment.commentNum}" style="display: none;">
         <td colspan="4" class="bg-light">
             <form id="editForm_${comment.commentNum}_form" action="/updateReply" method="post">
                 <input type="hidden" name="commentNum" id="commentNum" value="${comment.commentNum}">
                 <input type="hidden" name="qNum" id="qNum" value="${qna.qNum}">

                 <textarea name="commentContents" id="commentContents" rows="5" cols="50">${comment.commentContents}</textarea><br>
                 <input type="submit" value="수정 완료">
             </form>
         </td>
     </tr>





    <!-- 대댓글 폼-->
    <tr id="replyForm_${comment.commentNum}" style="display: none;">
           <td colspan="4" class="bg-light">
               <form id="replyForm_${comment.commentNum}_form" onsubmit="submitReply(${comment.commentNum}); return false;">
                   <input type="hidden" name="parentCommentId" value="${comment.commentNum}">
                   <textarea name="replyContent" rows="3" cols="50"></textarea><br>
                   <input type="submit" value="답글 작성">
               </form>
           </td>
       </tr>


    <!-- 대댓글 목록 출력
    <c:forEach items="${comment.repliesList}" var="reply">
        <tr>
            <td colspan="4" class="bg-light">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>${reply.userNo}</strong> (${reply.commentContents}): ${reply.commentCreated}:
            </td>
        </tr>
    </c:forEach>
</c:forEach>-->








 <!-- 답글 입력 폼 -->
                <c:if test="${sessionScope.loggedInUser != null}">
                    <form method="post" action="/qna/addReply.do">
                       <input type="hidden" name="qNum" value="${qna.qNum}" />
                        <tr>
                            <td colspan="4">
                                <textarea class="form-control" id="commentContents" name="commentContents" placeholder="답글을 입력하세요"></textarea>
                                <button type="submit" class="btn btn-primary mt-2">답글 달기</button>
                                 <a href="/qna/openQnaList.do" class="btn btn-primary">목록으로</a>

                            </td>
                        </tr>
                    </form>
                </c:if>
            </c:forEach>
            </tbody>
        </table>
    </div>

</div>
<!-- jQuery 및 부트스트랩 JS CDN 추가 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    function toggleReplyForm(commentId) {
        var replyForm = document.getElementById('replyForm_' + commentId);
        if (replyForm.style.display === 'none') {
            replyForm.style.display = 'block';
        } else {
            replyForm.style.display = 'none';
        }
    }
</script>

<script>
    function submitReply(commentId) {
        var replyContent = document.querySelector('#replyForm_' + commentId + '_form textarea[name="replyContent"]').value;
        var parentCommentId = document.querySelector('#replyForm_' + commentId + '_form input[name="parentCommentId"]').value;

        // AJAX를 사용하여 서버로 데이터 전송
        var xhr = new XMLHttpRequest();
        xhr.open('POST', '/submitReply', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onload = function () {
            if (xhr.status === 200) {
                // 서버에서 응답을 받으면 페이지를 새로고침하여 변경된 내용을 표시
                location.reload();
            }
        };
        xhr.send('parentCommentId=' + encodeURIComponent(parentCommentId) + '&replyContent=' + encodeURIComponent(replyContent));
    }
</script>

<!--댓글 수정 js
<script>
function submitEdit(commentNum) {
    var form = document.getElementById('editForm_' + commentNum + '_form');
    var formData = new FormData(form);

    var xhr = new XMLHttpRequest();
    xhr.open('POST', '/updateReply', true);
    xhr.onload = function () {
        if (xhr.status === 200) {
            // 서버에서 성공적인 응답을 받았을 때의 처리
            window.location.reload();
        } else {
            // 서버에서 오류 응답을 받았을 때의 처리
            console.error('서버 오류:', xhr.statusText);
            alert('서버 오류가 발생했습니다. 다시 시도해주세요.');
        }
    };
    xhr.onerror = function () {
        // 네트워크 오류가 발생했을 때의 처리
        console.error('네트워크 오류');
        alert('네트워크 오류가 발생했습니다. 다시 시도해주세요.');
    };
    xhr.send(formData);
}

</script>-->



<script>
function toggleReplyForms(commentNum) {
    var form = document.getElementById('editForm_' + commentNum);
    if(form.style.display === 'none') {
        form.style.display = 'block';
    } else {
        form.style.display = 'none';
    }
}

</script>

<script>
function showEditForm(commentNum) {
    var editForm = document.getElementById('editForm_' + commentNum);
    if (editForm.style.display === "none") {
        editForm.style.display = "table-row";
    } else {
        editForm.style.display = "none";
    }

}
</script>



</body>
</html>
