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
<style>
    .progress-bar-container {
        position: relative;
        width: 150px;
        height: 20px;
        background-color: #f3f3f3;
        border-radius: 5px;
        overflow: hidden;
    }

    .progress-bar {
        height: 100%;
        background-color: #4caf50;
        text-align: center;
        line-height: 20px;
        color: white;
        white-space: nowrap;
        overflow: hidden;
    }

    .progress-text {
        width: 150px;
        height: 100%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 15px;
        color: black;
    }



</style>
</head>
<body class="bg-white text-black">
<div class="h-screen flex text-sm bg-white text-black">
    <%@ include file="/WEB-INF/views/layout/Left_Side_bar.jsp"%>
    <div class="flex-grow h-full flex flex-col">
        <%@include file="/WEB-INF/views/layout/header.jsp"%>
        <div class="">
            <div class="flex items-center space-x-3 sm:mt-7 mt-4">
                <a  class="px-3 border-b-2 border-blue-500 text-blue-500 dark:text-black dark:border-white pb-1.5"></a>
            </div>
        </div>
        <div> <br> </div>

        <table>
            <thead>
            <tr class="text-black-400">
                <th colspan="7" class="font-normal px-3 pt-0 pb-3 border-b border-gray-200 dark:border-gray-800" style="align-content: center">차시 목록</th>
            </tr>
            </thead>
            <tbody class="text-black-600 dark:text-black-100">
            <!-- varStatus : 현재 항목의 정보(index를 위해 사용)-->
            <c:forEach items="${contents}" var="content" varStatus="loop">
                <tr class="videoItem" data-videoId="${content.videoId}">
                    <td class="sm:p-3 py-2 px-1 border-b border-gray-200 dark:border-gray-800"><img src="${content.thumbUrl}" alt="thumbnail" class="thumbnail"></td>
                    <td class="sm:p-3 py-2 px-1 border-b border-gray-200 dark:border-gray-800">${content.conName}</td>
                    <td class="sm:p-3 py-2 px-1 border-b border-gray-200 dark:border-gray-800">${content.description}</td>
                    <td class="sm:p-3 py-2 px-1 border-b border-gray-200 dark:border-gray-800">
                        <ul class="chapter-list">
                            <!-- 챕터 정보를 표시할 리스트 -->
                            <c:forEach items="${contentChapters[content.conNum]}" var="chapter">
                                <li class="chapter-item">${chapter.chapName}</li>
                                <li>(${chapter.chapStartTime})</li>
                            </c:forEach>
                        </ul>
                    </td>
                    <td class="sm:p-3 py-2 px-1 border-b border-gray-200 dark:border-gray-800">
                        <div class="progress-bar-container">
                            <div class="progress-bar" style="width: ${content.progress}%;"></div>
                        </div>
                        <div class="progress-text">${content.progress}%</div>
                    </td>
                    <!-- 학습하기 버튼 -->
                    <td class="sm:p-3 py-2 px-1 border-b border-gray-200 dark:border-gray-800 align-center" style="width: 200px;">
                        <form action="/learning" method="GET">
                            <input type="hidden" name="index" value="${loop.index}">
                            <input type="hidden" name="videoId" value="${content.videoId}">
                            <input type="hidden" name="conNum" value="${content.conNum}">
                            <input type="hidden" name="lecName" value="${content.lecName}">
                            <input type="hidden" name="userNo" value="${userNo}">
                            <!-- 챕터 목록은 JSON 형식의 문자열로 전달합니다. -->
                            <input type="hidden" name="chapters" value='<c:out value="${contentChapters[content.conNum]}" />'>
                            <button type="submit" class="btn btn-primary">학습하기</button>
                        </form>
                    </td>
                    <td class="sm:p-3 py-2 px-1 border-b border-gray-200 dark:border-gray-800 align-center" style="width: 200px;">
                        <button class="btn btn-primary" onclick="openPopup(${loop.index},${userNo})">학습하기(팝업)</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <script>
            var totalVideoTime = parseFloat('${maxS}');
            var userLearningTime = parseFloat('${learningTime}');

            // 진행률 계산
            var progress = (userLearningTime / totalVideoTime) * 100;

            // 진행률을 표시할 요소를 선택하고 표시합니다.
            var progressBar = $('#progress-bar');
            progressBar.css('width', progress + '%');

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
            // 팝업 창 열기 함수
            function openPopup(index, userNo) {
                //팝업창 안에서 사용할 객체들 선언.
                currentVideoId = window.contents[index].videoId
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

                function detectVideoTime() {
                    // YouTube 동영상의 iframe 요소 가져오기
                    var iframe = popup.document.getElementById('player');

                    // iframe이 로드되었고 YouTube 플레이어가 준비되었는지 확인
                    if (iframe && iframe.contentWindow && iframe.contentWindow.document.getElementById('player')) {
                        // YouTube 동영상의 현재 시간 가져오기
                        var currentTime = iframe.contentWindow.document.getElementById('player').getCurrentTime();

                        // 콘솔에 현재 재생 시간 출력
                        console.log('현재 재생 시간: ' + currentTime);
                    }

                    // 1초마다 재생 시간 감지 함수 호출
                    setTimeout(detectVideoTime, 1000);
                }
                // 재생 시간 감지 함수 호출
                detectVideoTime();

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
        </script>
</body>
</html>