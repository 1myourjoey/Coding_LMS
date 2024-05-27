<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.sky.lms_web_service.dto.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <style>
        .flex.h-full.text-black-600.dark.text-black-400 a {
            color: black;
        }

    </style>
</head>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/stylecard.css">
<div class="h-16 lg:flex w-full border-b border-gray-800 dark:border-gray-800 hidden px-10">
    <div class="flex h-full text-black-600 dark:text-black-400">
       <li>
           <c:choose>
               <c:when test="${sessionScope.loggedInUser != null && sessionScope.loggedInUser.adminYn eq 'Y'}">
                   <a href="/indexadmin" class="cursor-pointer h-full border-b-2 border-transparent inline-flex items-center mr-8"><strong>Home</strong></a>
               </c:when>
               <c:otherwise>
                   <a href="/" class="cursor-pointer h-full border-b-2 border-transparent inline-flex items-center mr-8"><strong>Home</strong></a>
               </c:otherwise>
           </c:choose>
       </li>

        <a href="/sugangReg" class="cursor-pointer h-full border-b-2 border-transparent inline-flex items-center mr-8">수강신청</a>
        <a href="/sugangList" class="cursor-pointer h-full border-b-2 border-transparent inline-flex items-center mr-8">수강목록</a>
        <a href="/board/openBoardList.do" class="cursor-pointer h-full border-b-2 border-transparent inline-flex items-center mr-8">자료실</a>
        <a href="/post" class="cursor-pointer h-full border-b-2 border-transparent inline-flex items-center mr-8">공지사항</a>
        <a href="/qna/openQnaList.do" class="cursor-pointer h-full border-b-2 border-transparent inline-flex items-center mr-8">Q&A</a>
    </div>
    <div class="ml-auto flex items-center space-x-7">
        <a href="/logout">
            <button class="h-8 px-3 rounded-md shadow">Logout</button>
        </a>
        <button class="flex items-center">
          <span class="relative flex-shrink-0">
            <img class="w-7 h-7 rounded-full" src="https://images.unsplash.com/photo-1521587765099-8835e7201186?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ" alt="profile" />
            <span class="absolute right-0 -mb-0.5 bottom-0 w-2 h-2 rounded-full bg-green-500 border border-white dark:border-gray-900"></span>
          </span>
            <%
                User loggedInUser = (User) session.getAttribute("loggedInUser");
                if (loggedInUser != null) {
            %>
            <span class="nav-link">환영합니다, <%= loggedInUser.getUserName() %>님!</span>
            <%
                }
            %>
            <svg viewBox="0 0 24 24" class="w-4 ml-1 flex-shrink-0" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round">
                <polyline points="6 9 12 15 18 9"></polyline>
            </svg>
        </button>
    </div>
</div>