<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/styles.css">

</head>
<body>
<header>
    <div class="inner">
        <h1><a href="/indexadmin">Coding</a></h1>

        <ul id="gnb">
            <li><a href="/content">교육과정</a></li>
            <li><a href="/sugangReg">수강신청</a></li>
            <li> <a href="/board/openBoardList.do">자료실</a></li>
            <li><a href="/post">공지사항</a></li>
            <li><a href="/qna/openQnaList.do">질문사항</a></li>
            <li><a href="/memberlistadmin">계정 리스트</a></li>
        </ul>

        <ul class="util">
            <c:choose>
                <c:when test="${sessionScope.loggedInUser != null}">
                    <li><p>${sessionScope.loggedInUser.loginId}님</p></li>
                    <li><a href="${pageContext.request.contextPath}/logout" class="button">로그아웃</a></li>
                    <li><a href="${pageContext.request.contextPath}/memberList">회원정보수정</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="${pageContext.request.contextPath}/join" class="button">회원가입</a></li>
                    <li><a href="${pageContext.request.contextPath}/login" class="button">로그인</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</header>

<div class="container">

    <figure>
        <img src="img/computer.png" alt="Innovation Image">
        <div class="inner">
            <h1>관리자 페이지!</h1>
            <p>거제대학교 HiVE센터는 미래의 행복발전소입니다.<br></p>
        </div>
        <div class="main-menu-list-wrapper">
            <div class="main-menu-list-area">
                <h3 style="margin-bottom: 5px;">수강신청</h3>
                <p>재직자, 자영업자, 소상공인, 취약계층 등을 대상으로 교육생을 모집합니다.</p>
            </div>


            <div class="main-menu-list-area">
                <h3 style="margin-bottom: 5px;">수강신청방법</h3>
                <p>재직자, 자영업자, 소상공인, 취약계층 등을 대상으로 교육생을 모집합니다.</p>
            </div>

            <div class="main-menu-list-area">
                <h3 style="margin-bottom: 5px;">센터소개</h3>
                <p>재직자, 자영업자, 소상공인, 취약계층 등을 대상으로 교육생을 모집합니다.</p>
            </div>
        </div>
    </figure>



    <div id="contents">
        <div id="tabMenu">
            <input type="radio" id="tab1" name="tabs" checked>
            <label for="tab1">공지사항</label>

            <input type="radio" id="tab2" name="tabs">
            <label for="tab2">자료실</label>

            <a href="" style="margin-left: 300px;">더보기</a>
            <div id="notice" class="tabContent">
                <h2>공지사항 내용입니다.</h2>
                <ul>
                    <li>중간시험 공지</li>
                    <li>성적 공지</li>
                    <li>입학식 안내</li>
                    <li>수강신청 안내</li>
                    <li>합격결과</li>
                </ul>
            </div>
            <div id="gallery" class="tabContent">
                <h2>갤러리 내용입니다.</h2>
                <ul>
                    <li>PDF파일 다운</li>
                    <li>한글 다운</li>
                    <li>PPT 다운</li>
                    <li>EXCEL 다운</li>
                    <li>WORD 다운</li>
                </ul>
            </div>
        </div>
        <div id="links">
            <ul>
                <li>
                    <a href="#">
                        <span id="quick-icon1"></span>
                        <p>평화기행</p>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span id="quick-icon2"></span>
                        <p>힐링 워크샵</p>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span id="quick-icon3"></span>
                        <p>문의하기</p>
                    </a>
                </li>
            </ul>
        </div>
    </div>

</div>

<footer id="footer">
    <div class="foot-quick">
    </div>
    <div class="inner">
        <div class="f-cnt">
            <div class="f-info">
                <p class="info-addr">(26464) 강원특별자치도 원주시 건강로 32(반곡동) 국민건강보험공단</p>
                <ul class="info-cs">
                    <li><strong class="strong">대표전화 1577-1000</strong><span class="span">(유료, 평일 09시~18시)</span></li>
                    <li><strong class="strong">해외이용 82-33-811-2001</strong><span class="span">(유료, 평일 09시~18시)</span>
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
                <span class="ban-txt">이 누리집은 보건복지부 산하기관 누리집입니다.</span>
            </div>
        </div>
    </div>
</footer>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const openModalButtons = document.querySelectorAll('.open-modal'); // 모달 열기 버튼들

        // 각각의 모달 열기 버튼에 대해 이벤트 처리
        openModalButtons.forEach(function(button) {
            button.addEventListener('click', function() {
                const modalId = button.getAttribute('data-target'); // 모달의 ID
                const modal = document.getElementById(modalId); // 모달 요소

                // 모달 열기
                modal.style.display = 'block';

                // 모달 닫기 버튼 이벤트
                const closeModalButtons = modal.querySelectorAll('.close-modal');
                closeModalButtons.forEach(function(closeButton) {
                    closeButton.addEventListener('click', function() {
                        modal.style.display = 'none'; // 모달 닫기
                    });
                });
            });
        });
    });

</script>



</body>
</html>
