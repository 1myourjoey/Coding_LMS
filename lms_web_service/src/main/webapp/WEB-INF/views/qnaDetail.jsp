<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Q&A</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/styles.css">

     <style>

            body, html {
                height: 100%;
                margin: 0;
                padding-bottom: 250px;
            }

            .container {
                z-index: 2;
                width: 1300px;
                margin: 0 auto;
            }



            .logos img {
                max-width:  20%;
                height: auto;
                margin-bottom: 10px;
                filter: grayscale(100%);
            }

            .personalinfo,
            .address {
                list-style: none;
                padding: 0;
                margin: 0;
            }

            .personalinfo li,
            .address li {
                margin-bottom: 5px;
            }

            .footer-btm-wrap {
                margin-top: 100px;
            }

            .dropdown {
                position: relative;
                display: inline-block;
            }

            .dropdown-content {
                display: none;
                position: absolute;
                min-width: 160px;
                z-index: 1;
                flex-direction: column;
            }

            .dropdown:hover .dropdown-content {
                display: flex;
            }

            .dropdown-content a {
                color: #000000;
                text-decoration: none;
                margin: 10px;
            }

            .navbar-nav {
                position: absolute;
                left: 30%;
                transform: translateX(-50%);
                font-family: 'Roboto', sans-serif;
                font-size: 18px;
                color: #333;
                letter-spacing: 1px;
            }

            .nav-link {
                margin-right: 80px;
            }

            .btn-primary {
                width: 200px;
            }

            table {
                border-collapse: collapse;
                border-spacing: 0;
            }

            section.notice {
                padding: 80px 0;
            }

            .page-title {
                margin-bottom: 60px;
            }

            .page-title h3 {
                font-size: 28px;
                color: #333333;
                font-weight: 400;
                text-align: center;
            }

            #board-search .search-window {
                padding: 15px 0;
                background-color: #f9f7f9;
            }

            #board-search .search-window .search-wrap {
                position: relative;
                width: 80%;
                max-width: 564px;
            }

            #board-search .search-window .search-wrap input {
                height: 40px;
                width: 100%;
                font-size: 14px;
                padding: 7px 14px;
                border: 1px solid #ccc;
            }

            #board-search .search-window .search-wrap input:focus {
                border-color: #333;
                outline: 0;
                border-width: 1px;
            }

            #board-search .search-window .search-wrap .btn {
                position: absolute;
                right: 0;
                top: 0;
                bottom: 0;
                width: 108px;
                padding: 0;
                font-size: 16px;
            }

            .board-table {
                font-size: 13px;
                width: 100%;
                border-top: 1px solid #ccc;
                border-bottom: 1px solid #ccc;
            }

            .board-table a {
                color: #333;
                display: inline-block;
                line-height: 1.4;
                word-break: break-all;
                vertical-align: middle;
            }

            .board-table a:hover {
                text-decoration: underline;
            }

            .board-table th {
                text-align: center;
            }

            .board-table .th-num {
                width: 100px;
                text-align: center;
            }

            .board-table .th-date {
                width: 200px;
            }

            .board-table th, .board-table td {
                padding: 14px 0;
            }

            .board-table tbody td {
                border-top: 1px solid #e7e7e7;
                text-align: center;
            }

            .board-table tbody th {
                padding-left: 28px;
                padding-right: 14px;
                border-top: 1px solid #e7e7e7;
                text-align: left;
            }

            .board-table tbody th p{
                display: none;
            }
            body, ul, li {
                          padding:0;
                          margin:0;
                          list-style:none;
                        }

                        a {
                          color:inherit;
                          text-decoration:none;
                        }

                        /* customize */
                        /* font */
                        @font-face {
                          font-family: 'LotteMartDream';
                          font-style: normal;
                          font-weight: 400;
                          src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff') format('woff');
                        }
                        @font-face {
                          font-family: 'LotteMartDream';
                          font-style: normal;
                          font-weight: 700;
                          src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamBold.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamBold.woff') format('woff');
                        }
                        @font-face {
                          font-family: 'LotteMartDream';
                          font-style: normal;
                          font-weight: 300;
                          src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamLight.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamLight.woff') format('woff');
                        }
                        html {
                         font-family: 'LotteMartDream', sans-serif;
                        }

                        /* setting */
                        :root {
                          --site-width:1200px;
                        }

                        .con-min-width {
                          min-width:var(--site-width);
                          padding:0 330px;
                          justify-content: flex-end; /* 수정 */
                        }

                        .con {
                          width:var(--site-width);
                        }

                        /* menu-bar */
                        .menu-bar {
                          margin-top:0px;
                        }

                        .menu-bar__box {
                          display: flex; /* 수정 */
                          justify-content: center; /* 가운데 정렬 */
                          border-bottom: 1px solid black; /* 검은 줄 추가 */
                        }

                        .menu-bar__box > li {
                          margin: 0 10px; /* 간격 조절 */
                        }

                        .menu-bar__box > li > a {
                          padding:10px 50px;
                          display:block;
                          font-weight:700;
                          font-size:1.2rem;
                        }

                        .menu-bar__box > li:hover > a {
                          color:gray;
                          text-decoration:underline;
                        }


                        .logout-link {
                          position: absolute;
                          top: 50px;
                          right: 20px;
                          font-weight: bold;
                          margin-right: 100px;
                        }
                        footer {
                                                       position: absolute;
                                                       bottom: 0;
                                                       width: 100%;
                                                       height: 30px; /* 적절한 높이로 조정하세요 */
                                                       margin: -150px;
                                                   }

            .logo-img {
                                          width: 100px; /* 로고 이미지의 너비 */
                                          height: auto; /* 자동으로 높이 설정 */
                                          margin-left: 130px; /* 로고 이미지를 오른쪽으로부터 130px만큼 떨어지도록 설정하여 좀 더 왼쪽으로 이동시킵니다. */
                                          margin-top: 40px; /* 로고 이미지를 아래로 40px 이동시킵니다. */

                                        }


        </style>

</head>
<body>

               <img src="/img/lms.png" class="logo-img" alt="로고 이미지">

<a href="/logout" class="logout-link">로그아웃</a> <!-- 로그아웃 링크 추가 -->
    <nav class="menu-bar con-min-width">
        <div class="con text-align-center">

          <ul class="menu-bar__box">

            <li>
                <c:choose>
                    <c:when test="${sessionScope.loggedInUser != null && sessionScope.loggedInUser.adminYn eq 'Y'}">
                        <a href="/indexadmin">HOME</a>
                    </c:when>
                    <c:otherwise>
                        <a href="/">HOME</a>
                    </c:otherwise>
                </c:choose>
            </li>
            <li><a href="/sugangReg">수강신청</a></li>
            <li><a href="/sugangList">수강목록</a></li>
            <li><a href="/boardlistuser">자료실</a></li>
            <li><a href="/post">공지사항</a></li>
            <li><a href="/qna/openQnaList.do">Q&A</a></li>
          </ul>
        </div>
      </nav>
<div class="container">

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
                    <input type="hidden" name="qNum" value="${qna.qNum}"/>
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
                            <input type="text" class="form-control" id="qnaTitle" name="qnaTitle" value="${qna.qnaTitle}"
                                <c:if test="${sessionScope.loggedInUser != null && (sessionScope.loggedInUser.userNo != qna.userNo && sessionScope.loggedInUser.adminYn != 'Y')}">
                                    readonly
                                </c:if> />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" class="view_text">
                            <textarea class="form-control" title="내용" id="qnaContents" name="qnaContents"
                                <c:if test="${sessionScope.loggedInUser != null && (sessionScope.loggedInUser.userNo != qna.userNo && sessionScope.loggedInUser.adminYn != 'Y')}">
                                    readonly
                                </c:if>>${qna.qnaContents}</textarea>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                          <c:if test="${qna.userNo eq sessionScope.userNo || sessionScope.loggedInUser.adminYn eq 'Y'}">
                              <button type="submit" form="frm-${qna.qNum}" class="btn" style="background-color: #323232; color: white;">수정하기</button>
                              <a href="/qna/deleteQna.do?qNum=${qna.qNum}" class="btn " style="background-color: #323232; color: white;">삭제하기</a>
                          </c:if>
                        </td>
                    </tr>
                </form>


            <c:forEach var="comment" items="${comlist}">
                <!-- 댓글 출력 -->
                <tr>
                    <td colspan="4" class="bg-light">
                        <strong>${comment.userNo}</strong> (${comment.commentContents}): ${comment.commentCreated}:
                        <a href="javascript:void(0)" onclick="toggleReplyForm(${comment.commentNum})">답글달기</a>

                        <!-- 세션 사용자와 댓글 작성자가 같은 경우에만 수정하기, 삭제하기 버튼 보이기 -->
                        <c:if test="${sessionScope.loggedInUser != null && (sessionScope.loggedInUser.adminYn eq 'Y' || sessionScope.userNo eq comment.userNo)}">
                            <button onclick="showEditForm(${comment.commentNum})"
                                style="background:none;border:none;color:blue;text-decoration:underline;cursor:pointer;">
                                수정하기
                            </button>
                            <a href="/deleteReply?commentNum=${comment.commentNum}&qNum=${qna.qNum}">삭제하기</a>
                        </c:if>
                    </td>
                </tr>
                <!-- 대댓글 다는 폼-->
                    <tr id="replyForm_${comment.commentNum}" style="display: none;">
                         <td colspan="4" class="bg-light">
                      <form id="replyForm_${comment.commentNum}_form" action="/submitReply" method="post">
                 <input type="hidden" name="qNum" value="${qna.qNum}" />
              <input type="hidden" name="pCommentNum" value="${comment.commentNum}">

              <textarea name="commentContents" rows="3" cols="50"></textarea><br>
              <input type="submit" value="답글 달기">
          </form>
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




                <!-- 대댓글 출력 -->
                <c:forEach var="reply" items="${replyMap[comment.commentNum]}">
                    <tr>
                        <td colspan="4" class="bg-light">
                            <div style="margin-left: 20px;">
                                <strong>${reply.userNo}</strong> (${reply.commentContents}): ${reply.commentCreated}
                                <a href="javascript:void(0)" onclick="toggleReplyForm(${comment.commentNum})">답글달기</a>


                                  <c:if test="${sessionScope.loggedInUser != null && (sessionScope.loggedInUser.adminYn eq 'Y' || sessionScope.userNo eq reply.userNo)}">
                               <button onclick="showReplyEditForm(${reply.commentNum})"
                                 style="background:none;border:none;color:blue;text-decoration:underline;cursor:pointer;">
                                 수정하기
                               </button>
                                <a href="/deleteReply?commentNum=${reply.commentNum}&qNum=${qna.qNum}">삭제하기</a>
                                   </c:if>
                            </div>
                        </td>
                    </tr>

                     <!-- 대댓글에 대댓글 폼
                    <tr id="replyForm_${comment.commentNum}" style="display: none;">
                                            <td colspan="4" class="bg-light">
                                                <form id="replyForm_${comment.commentNum}_form" action="/submitReply" method="post">
                                                <input type="hidden" name="qNum" value="${qna.qNum}" />
                                                   <input type="hidden" name="pCommentNum" value="${comment.commentNum}">

                                                    <textarea name="commentContents" rows="3" cols="50"></textarea><br>
                                                    <input type="submit" value="답글 달기">
                                                </form>
                                            </td>
                                        </tr>-->



                    <!-- 대댓글 수정 폼 -->
                    <tr id="replyEditForm_${reply.commentNum}" style="display: none;">
                                <td colspan="4" class="bg-light">
                                    <form id="replyEditForm_${reply.commentNum}_form" action="/updateReply" method="post">
                                        <input type="hidden" name="commentNum" value="${reply.commentNum}">
                                        <input type="hidden" name="qNum" value="${qna.qNum}">
                                        <textarea name="commentContents" rows="5" cols="50">${reply.commentContents}</textarea><br>
                                        <input type="submit" value="수정 완료">
                                    </form>
                                </td>
                            </tr>


                </c:forEach>

            </c:forEach>



            <!-- 답글 입력 폼 -->
           <c:if test="${sessionScope.loggedInUser != null}">
                               <form method="post" action="/qna/addReply.do">
                                  <input type="hidden" name="qNum" value="${qna.qNum}" />
                                   <tr>
                                       <td colspan="4">
                                           <textarea class="form-control" id="commentContents" name="commentContents" placeholder="답글을 입력하세요"></textarea>
                                           <button type="submit" class="btn" style="background-color: #323232; color: white;">답글 달기</button>
                                            <a href="/qna/openQnaList.do" class="btn" style="background-color: #323232; color: white;">목록으로</a>
                                       </td>
                                   </tr>
                               </form>
                           </c:if>
                       </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<footer id="footer">
    <div class="foot-quick">
    </div>
    <div class="inner">
        <div class="f-cnt">
            <div class="f-info">
                <p class="info-addr">(04104) 서울 마포구 신촌로 176 중앙빌딩 중앙정보처리학원</p>
                <ul class="info-cs">

                    <li><strong class="strong">사업자 등록번호 : 220-95-00629</strong><span class="span"></span>
                    <li><strong class="strong">대표전화 : 02-704-1711</strong><span class="span">(평일 09시~18시)</span></li>
                    <li><strong class="strong"> FAX : 02-393-9218</strong><span class="span"></span>
                    </li>
                </ul>
            </div>

            <div class="f-link">
                <div class="link-go">
                    <a href="#" class="btn btn-txt sm ico-arr">찾아오시는 길</a>
                    <a href="#" class="btn btn-txt sm ico-arr">이용안내</a>
                    <a href="#" class="btn btn-txt sm ico-arr">직원검색</a>
                </div>
            </div>
        </div>

        <div class="f-btm">
            <div class="f-btm-text">
                <div class="f-menu">
                    <a href="#" class="point">개인정보처리방침</a>
                    <a href="#">저작권 정책</a>
                    <a href="#">웹 접근성 품질인증 마크 획득</a>
                </div>
                <p class="f-copy">© Ministry of Education. All rights reserved.</p>
            </div>
            <div class="f-btm-ban">
            </div>
        </div>
    </div>
</footer>
<!-- jQuery 및 부트스트랩 JS CDN 추가 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    function toggleReplyForm(commentNum) {
            var replyForm = document.getElementById('replyForm_' + commentNum);
            if (replyForm) {
                replyForm.style.display = replyForm.style.display === 'none' ? 'table-row' : 'none';
            } else {
                console.error('Element with ID replyForm_' + commentNum + ' not found.');
            }
        }

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

    function showEditForm(commentNum) {
        var editForm = document.getElementById('editForm_' + commentNum);
        if (editForm.style.display === "none") {
            editForm.style.display = "table-row";
        } else {
            editForm.style.display = "none";
        }
    }

    <!-- 대댓글 -->
function showReplyEditForm(commentNum) {
    var editForm = document.getElementById('replyEditForm_' + commentNum);
    if (editForm.style.display === "none") {
        editForm.style.display = "table-row";
    } else {
        editForm.style.display = "none";
    }
}

function submitReplyEdit(commentNum) {
    var commentContents = document.querySelector('#replyEditForm_' + commentNum + '_form textarea[name="commentContents"]').value;
    var qNum = document.querySelector('#replyEditForm_' + commentNum + '_form input[name="qNum"]').value;

    // AJAX를 사용하여 수정된 내용을 서버로 전송
    var xhr = new XMLHttpRequest();
    xhr.open('POST', '/updateReply', true); // 수정 폼의 action 값은 유지되어야 함
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhr.onload = function () {
        if (xhr.status === 200) {
            // 서버에서 응답을 받으면 페이지를 새로고침하여 변경된 내용을 표시
            location.reload();
        }
    };
    xhr.send('commentNum=' + encodeURIComponent(commentNum) + '&qNum=' + encodeURIComponent(qNum) + '&commentContents=' + encodeURIComponent(commentContents));
}

</script>
</body>
</html>
