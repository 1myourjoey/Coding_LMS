<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시글 상세 화면</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/styles.css">

               <img src="/img/lms.png" class="logo-img" alt="로고 이미지">

        <style>
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
        .logo-img {
          width: 100px; /* 로고 이미지의 너비 */
          height: auto; /* 자동으로 높이 설정 */
          margin-left: 130px; /* 로고 이미지를 오른쪽으로부터 130px만큼 떨어지도록 설정하여 좀 더 왼쪽으로 이동시킵니다. */
          margin-top: 40px; /* 로고 이미지를 아래로 40px 이동시킵니다. */
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
                                       height: 100px; /* 적절한 높이로 조정하세요 */
                                   }
                                   textarea.form-control {
                                           width: 100%; /* 원하는 너비를 지정하세요 */
                                           height: 200px; /* 원하는 높이를 지정하세요 */
                                           resize: none; /* 사용자가 크기를 조정할 수 없도록 설정합니다 */
                                       }

        </style>
</head>
<body>
<a href="/logout" class="logout-link">로그아웃</a> <!-- 로그아웃 링크 추가 -->
    <nav class="menu-bar con-min-width">
        <div class="con text-align-center">

          <ul class="menu-bar__box">

            <li>
                <c:choose>
                    <c:when test="${sessionScope.loggedInUser != null && sessionScope.loggedInUser.adminYn eq 'Y'}">
                        <a href="indexadmin">HOME</a>
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
<div class="container mt-5">
    <h2>공지사항</h2>
    <table class="table table-bordered">
        <tbody>
            <c:forEach items="${post}" var="post">
                <form action="/updatePost" method="post">
                    <!-- hidden input을 사용하여 수정할 게시물의 번호를 전달 -->
                    <input type="hidden" name="postNum" value="${post.postNum}">
                    <tr>
                        <th scope="row">제목</th>
                        <td><input type="text" id="postTitle" name="postTitle" class="form-control" value="${post.postTitle}" ${sessionScope.loggedInUser != null && sessionScope.loggedInUser.adminYn eq 'Y' ? '' : 'readonly'}></td>
                        <th>작성일</th>
                        <td><input type="text" id="postCreated" name="postCreated" class="form-control" value="${post.postCreated}" readonly></td>
                    </tr>
                    <tr>
                        <th scope="row">내용</th>
                        <td colspan="3" class="view_text">
                            <!-- 수정할 내용을 입력하는 textarea -->
                            <textarea title="내용" id="postContents" name="postContents" class="form-control" ${sessionScope.loggedInUser != null && sessionScope.loggedInUser.adminYn eq 'Y' ? '' : 'readonly'}>${post.postContents}</textarea>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="4">
                            <c:if test="${sessionScope.loggedInUser != null}">
                                <c:choose>
                                    <c:when test="${sessionScope.loggedInUser.adminYn eq 'N'}">
                                        <a href="/post" id="list" class="btn btn-dark">목록으로</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="/post" id="list" class="btn btn-dark">목록으로</a>
                                        <button type="submit" class="btn btn-primary">수정하기</button>
                                        <a href="/deletePost?postNum=${post.postNum}" id="delete" class="btn btn-dark">삭제하기</a>
                                    </c:otherwise>
                                </c:choose>
                            </c:if>
                        </td>
                    </tr>
                </form>
            </c:forEach>
        </tbody>
    </table>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
