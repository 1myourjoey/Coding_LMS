<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.sky.lms_web_service.dto.User" %>
<!DOCTYPE html>
<html lang="ko">
<header class="header header-shadow" id="header">
    <nav class="navbar navbar-expand-lg navbar-light bg-light container">
        <a href="/main.do" class="navbar-brand"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/sugangReg">수강신청</a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="/sugangList">내 수강목록</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">공지사항</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">자료실</a>
                </li>

            </ul>
            <div class="nav-right">
                <div class="wrap-time wrap-time-pc">
                    <span><img src="/images/icon-time.png" alt="시간"></span>
                    <span class="time _timer">59:37</span>
                    <span class="extend">시간연장</span>
                    <%
                        User loggedInUser = (User) session.getAttribute("loggedInUser");
                        if (loggedInUser != null) {
                    %>
                    <span class="nav-link">환영합니다, <%= loggedInUser.getUserName() %>님! (번호: <%= loggedInUser.getUserNo() %>)</span>
                    <%
                        }
                    %>
                </div>
                <div class="logout">
                    <a href="/logout">
                        <img src="/images/icon-logout.png" alt="로그아웃">
                        <p>로그아웃</p>
                    </a>
                </div>
            </div>
        </div>
    </nav>
</header>