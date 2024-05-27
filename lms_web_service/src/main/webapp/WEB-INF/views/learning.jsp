<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Learning Page</title>
    <link href="https://assets.codepen.io/344846/style.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="css/learning.css">
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
        <div id="video-container">
            <div id="chapter-container">
                <div id="chapter-title">챕터 목록</div>
                <div id="chapterList">
                    <c:forEach items="${chapters}" var="chapter">
                        <div class="chapterItem" data-start-time="${chapter.chapStartTime}">${chapter.serealNum} ${chapter.chapName} (${chapter.chapStartTime})</div>
                    </c:forEach>
                </div>
            </div>
            <div id="player-container">
                <div id="conName">${contents.conName}</div>
                <div id="player"></div>
                <div id="player-control" style="">
                    <div style="display: flex; align-items: center; margin-right: 10px;">
                        <button class="preButton" onclick="moveContent(-1)">
                            <img src="/img/skip-start-fill.png" class="arrow-image">
                            이전 강의</button>
                    </div>
                    <div style="display: flex; align-items: center;">
                        <button class="nextButton" onclick="moveContent(1)">다음 강의
                            <img src="/img/skip-end-fill.png" class="arrow-image">
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <script>
            
            // 2. This code loads the IFrame Player API code asynchronously.
            var tag = document.createElement('script');

            tag.src = "https://www.youtube.com/iframe_api";
            var firstScriptTag = document.getElementsByTagName('script')[0];
            firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

            // 해당 강의의 videoId를 가져와서 YouTube 플레이어에 설정합니다.
            let player;
            function onYouTubeIframeAPIReady() {
                player = new YT.Player('player', {
                    height: '600',
                    width: '1000',
                    videoId: "${contents.videoId}",
                    playerVars: {
                        'autoplay': 1,
                        'mute':1,
                        'modestbranding': 1, // YouTube 로고 숨기기
                        'rel': 0, //관련 영상 숨기기
                        'loop': 0, //동영상은 1번만 재생
                    },
                    events: {
                        'onReady': onPlayerReady,
                        'onStateChange': onPlayerStateChange
                    }
                });
            }
            function onPlayerReady(event) {
                event.target.playVideo();
            }

            function onPlayerStateChange(event) {
                if (event.data === YT.PlayerState.PLAYING) {
                    // 재생 중 상태에서 추가 동작을 정의
                }
            }

            $(document).ready(function () {
                $('.chapterItem').click(function () {
                    var startTimeString = $(this).data('start-time'); // 챕터 시작 시간을 문자열로 가져옴
                    var startTimeInSeconds = convertTimeToSeconds(startTimeString); // 초로 변환
                    player.seekTo(startTimeInSeconds); // 플레이어에서 해당 시간으로 이동
                });

                // 시간을 초로 변환하는 함수
                function convertTimeToSeconds(timeString) {
                    var parts = timeString.split(':');
                    return (+parts[0]) * 3600 + (+parts[1])
                        * 60 + (+parts[2]);
                }
            });

            function moveContent(direction) {
                // 현재 인덱스 가져오기
                var currentIndex = parseInt('${index}');
                // 전체 콘텐츠의 길이 가져오기
                var contentsLength = parseInt('${contentsLength}');
                // 새로운 인덱스 계산
                var newIndex = currentIndex + direction;
                // 새로운 인덱스가 유효한지 확인
                if (newIndex >= 0 && newIndex < contentsLength) {
                    // 이동할 페이지 URL 생성
                    var newContent = JSON.parse('${contents}'); // JSON 문자열을 파싱하여 JavaScript 객체로 변환
                    var url = "/learning?index=" + newIndex + "&videoId=" + newContent[newIndex].videoId + "&conNum=" + newContent[newIndex].conNum + "&lecName=" + newContent[newIndex].lecName + "&userNo=${userNo}";
                    // 새로운 URL로 이동
                    window.location.href = url;
                }
            }
        </script>
    </div>
</div>
</body>
</html>
