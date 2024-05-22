<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>YouTube Video Popup</title>
    <link href="https://assets.codepen.io/344846/style.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body class="bg-white text-black">
<div class="h-screen flex overflow-hidden text-sm bg-white text-black">
    <%@ include file="/WEB-INF/views/layout/Left_Side_bar.jsp"%>
    <div class="flex-grow overflow-hidden h-full flex flex-col">
        <%@include file="/WEB-INF/views/layout/header.jsp"%>
        <div class="">
            <div class="flex items-center space-x-3 sm:mt-7 mt-4">
                <a  class="px-3 border-b-2 border-blue-500 text-blue-500 dark:text-black dark:border-white pb-1.5"></a>
            </div>
        </div>
        <div> <br> </div>
        <table class="text-left">
            <thead>
            <tr class="text-black-400">
                <th colspan="8" class="font-normal px-3 pt-0 pb-3 border-b border-gray-200 dark:border-gray-800" style="align-content: center">차시 목록</th>
            </tr>
            </thead>
            <tbody class="text-black-600 dark:text-black-100">
            <!-- varStatus : 현재 항목의 정보(index를 위해 사용)-->
            <c:forEach items="${contents}" var="content" varStatus="loop">
                <tr class="videoItem" data-videoId="${content.videoId}">
                    <td class="sm:p-3 py-2 px-1 border-b border-gray-200 dark:border-gray-800"><img src="${content.thumbUrl}" alt="thumbnail" class="thumbnail"></td>
                    <td class="sm:p-3 py-2 px-1 border-b border-gray-200 dark:border-gray-800">${content.conNum}</td>
                    <td class="sm:p-3 py-2 px-1 border-b border-gray-200 dark:border-gray-800">${content.conName}</td>
                    <td class="sm:p-3 py-2 px-1 border-b border-gray-200 dark:border-gray-800">${content.description}</td>
                    <td class="sm:p-3 py-2 px-1 border-b border-gray-200 dark:border-gray-800">
                        <ul class="chapter-list">
                            <!-- 챕터 정보를 표시할 리스트 -->
                            <c:forEach items="${contentChapters[content.conNum]}" var="chapter">
                                <li class="chapter-item">${chapter.chapName} (${chapter.chapStartTime})</li>
                            </c:forEach>
                        </ul>
                    </td>
                  <  <td id="progress_${loop.index}" class="sm:p-3 py-2 px-1 border-b border-gray-200 dark:border-gray-800">
                    <c:choose>
                        <c:when test="${not empty progressData[content.conNum]}">
                            ${progressData[content.conNum]}%
                        </c:when>
                        <c:otherwise>
                            0%
                        </c:otherwise>
                    </c:choose>
                </td>
                    <!-- 학습하기 버튼 -->
                    <td class="sm:p-3 py-2 px-1 border-b border-gray-200 dark:border-gray-800 align-center" style="width: 200px;">
                    <button class="btn btn-primary" onclick="window.location.href='/learning?index=${loop.index}'">학습하기</button>
                    </td>
                    <td class="sm:p-3 py-2 px-1 border-b border-gray-200 dark:border-gray-800 align-center" style="width: 200px;">
                        <button class="btn btn-primary" onclick="openPopup(${loop.index},${userNo})">학습하기(팝업)</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <script>
            //비디오 목록과 챕터 목록을 script에서 사용하기 위한 배열 선언.
            window.contents = [
                <c:forEach items="${contents}" var="content" varStatus="loop">
                {
                    videoId: '${content.videoId}',
                    conName:'${content.conName}',
                    conNum:'${content.conNum}',
                    conPlayTime:'${content.conPlayTime}',
                    chapters: [
                        <c:forEach items="${contentChapters[content.conNum]}" var="chapter" varStatus="chapLoop">
                        <c:if test="${chapter.conNum eq content.conNum}">
                        { chapName: '${chapter.chapName}', chapStartTime: '${chapter.chapStartTime}' }<c:if test="${!chapLoop.last}">, </c:if>
                        </c:if>
                        </c:forEach>
                    ]
                }<c:if test="${!loop.last}">, </c:if>
                </c:forEach>
            ];
            var currentVideoId;
            var player;
            // 팝업 창 열기 함수
            function openPopup(index, userNo) {
                //팝업창 안에서 사용할 객체들 선언.
                console.log(userNo);
                currentVideoId = window.contents[index].videoId
                var conNum = window.contents[index].conNum;
                var lecNum = window.contents[index].lecNum;
                var conName = window.contents[index].conName;
                var chapters = window.contents[index].chapters;
                // YouTube 동영상을 표시할 URL 생성
                var url = 'https://www.youtube.com/embed/' + currentVideoId + '?enablejsapi=1&autoplay=1&mute=1';
                var popupWidth = 1500;
                var popupHeight = 850;
                //팝업창 열기
                popup = window.open('', 'Popup', 'width=' + popupWidth + ', height=' + popupHeight);
                popup.name = index;
                //팝업창 가운데 정렬
                popup.moveTo((window.screen.width - popupWidth) / 2, (window.screen.height - popupHeight) / 2);

                //팝업창 안에서의 HTML/CSS
                popup.document.write('<div id="video-container" style="width: 100%; height: 650px; display: flex;">');
                var chapterHtml = '<div id="chapter-container" style="flex: 0.7; overflow-y:auto; background-color: #fffbfb; border-right: 1px solid #B8B8B8; margin-right: 2px; height: 750px;">';
                chapterHtml += '<div style="height: 50px; font-size: 15px; margin-left: 10px; font-weight: bolder; font-family: monospace; align-content: center;">챕터 목록</div>';
                chapterHtml += '<div id="chapterList" style="margin-right: 20px">';
                for (var i = 0; i < chapters.length; i++) {
                    chapterHtml += '<div class="chapterItem" style="border: 1px solid #ddd; background-color: #ffffff; height: 70px; padding: 8px; margin-bottom: 10px; border-radius: 10px; cursor: pointer;" onclick="opener.seekToChapter(\'' + chapters[i].chapStartTime + '\')">' + chapters[i].chapName + ' (' + chapters[i].chapStartTime + ')</div>';
                }
                chapterHtml += '</div></div>';
                popup.document.write(chapterHtml);

                popup.document.write('<div id="player-container" style="flex: 2; padding-right: 10px;">');
                popup.document.write('<div id="conName" style="height: 50px; font-size: 15px; margin-left: 10px; font-weight: bolder; font-family: monospace; align-content: center;"></div>')
                var videoHtml = '<iframe id="player" width="100%" height="100%" src="' + url + '" frameborder="0" allowfullscreen></iframe>';
                popup.document.getElementById('conName').innerText = conName;
                popup.document.write(videoHtml);
                var controlsHtml = '<div style="display: flex; justify-content: left; background-color: #c1baba; height: 20px; padding: 15px;">';
                var prevButtonHtml = '<button style="cursor: pointer; border: none; background-color: #c1baba; font-weight: bold; font-family: monospace;" onclick="opener.moveVideo(-1)" class="arrow-button"><img src="/img/skip-start-fill.png" style="height: 25px; width: 25px; vertical-align: middle;" class="arrow-image">이전 강의</button>';
                var nextButtonHtml = '<button style="cursor: pointer; border: none; background-color: #c1baba; font-weight: bold; font-family: monospace; margin-left: 10px;" onclick="opener.moveVideo(1)" class="arrow-button">다음 강의<img src="/img/skip-end-fill.png" style="height: 25px; width: 25px; vertical-align: middle;" class="arrow-image"></button>';
                controlsHtml += prevButtonHtml + nextButtonHtml;
                controlsHtml += '</div>';
                popup.document.write(controlsHtml);
                popup.document.write('</div>');
                popup.document.write('</div>');
            }

            // 시간을 초 단위로 변환
            function convertToSeconds(time) {
                var parts = time.split(':');
                return (+parts[0]) * 60 * 60 + (+parts[1]) * 60 + (+parts[2]);
            }

            //챕터의 시간대로 영상의 url을 변경하여 이동
            window.seekToChapter = function (chapStartTime) {
                //chapStartTime을 초 단위로 변환
                var chapStartTimeInSeconds = convertToSeconds(chapStartTime);

                // 새로운 URL 생성 (챕터의 시작 시간을 지정하여 재생)
                var newUrl = 'https://www.youtube.com/embed/' + currentVideoId + '?start=' + chapStartTimeInSeconds + '&autoplay=1&mute=1';

                // YouTube 동영상 업데이트
                popup.document.getElementsByTagName('iframe')[0].src = newUrl;
            }

            //현재 index로 이전,다음의 인덱스를 계산 후 영상의 url 정보를 가져와서 강의 이동
            window.moveVideo = function (direction) {
                // 현재 팝업 창의 동영상 인덱스
                var currentIndex = parseInt(popup.name);
                // 새로운 인덱스 계산
                var newIndex = currentIndex + direction;

                // 인덱스 범위 검사
                if (newIndex >= 0 && newIndex < window.contents.length) {
                    // 이전/다음 동영상의 정보 가져오기
                    var newVideo = window.contents[newIndex];
                    currentVideoId = newVideo.videoId; // 동영상 ID 업데이트
                    var chapters = newVideo.chapters;  // 챕터 목록 업데이트

                    // 강의 이동 시 새로운 YouTube 동영상을 표시할 URL 생성
                    var newUrl = 'https://www.youtube.com/embed/' + currentVideoId + '?autoplay=1&mute=1';

                    // YouTube 동영상 업데이트
                    popup.document.getElementsByTagName('iframe')[0].src = newUrl;

                    // 팝업 창의 인덱스 업데이트
                    popup.name = newIndex;

                    // 챕터 목록 업데이트
                    var chapterList = popup.document.getElementById('chapterList');
                    chapterList.innerHTML = '';
                    for (var i = 0; i < chapters.length; i++) {
                        chapterList.innerHTML += '<div class="chapterItem" style="border: 1px solid #ddd; background-color: #ffffff; height: 70px; padding: 8px; margin-bottom: 10px; border-radius: 10px; cursor: pointer;" onclick="opener.seekToChapter(\'' + chapters[i].chapStartTime + '\')">' + chapters[i].chapName + ' (' + chapters[i].chapStartTime + ')</div>';
                    }
                }
            }
            // 팝업 창이 닫힐 때 실행되는 함수
            window.onunload = function() {
                // 현재 동영상의 시간을 가져와서 저장
                var iframe = popup.document.getElementsByTagName('iframe')[0];
                var currentTime = getYouTubeVideoCurrentTime(iframe);
                saveLastWatchedTime(userNo, conNum, lecNum, currentTime);
            }

            // YouTube 동영상의 현재 재생 시간을 추정하는 함수
            function getYouTubeVideoCurrentTime(iframe) {
                // YouTube 동영상의 URL에서 "t" 매개변수로 현재 시간을 추출하여 재생 시간을 추정
                var urlParams = new URLSearchParams(iframe.src.split('?')[1]);
                var currentTime = urlParams.get('t');
                if (currentTime) {
                    currentTime = parseInt(currentTime);
                } else {
                    currentTime = 0; // 시간이 지정되지 않았을 때는 0으로 설정
                }
                return currentTime;
            }
        </script>
</body>
</html>