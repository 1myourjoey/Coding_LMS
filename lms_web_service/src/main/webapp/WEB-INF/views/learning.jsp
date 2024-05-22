<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Learning Page</title>
    <!-- YouTube Player API 스크립트 추가 -->
    <script src="https://www.youtube.com/iframe_api"></script>
    <!-- 스타일 시트 추가 -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
        <div id="video-container" style="width: 100%; height: 650px; display: flex;">
            <div id="chapter-container" style="flex: 0.7; overflow-y:auto; background-color: #fffbfb; border-right: 1px solid #B8B8B8; margin-right: 2px; height: 750px;">
                <div style="height: 50px; font-size: 15px; margin-left: 10px; font-weight: bolder; font-family: monospace; align-content: center;">챕터 목록</div>
                <div id="chapterList" style="margin-right: 20px">
                    <c:forEach items="${contentChapters[content.conNum]}" var="chapter">
                        <li class="chapter-item">${chapter.chapName} (${chapter.chapStartTime})</li>
                    </c:forEach>
                </div>
            </div>
            <div id="player-container" style="flex: 2; padding-right: 10px;">
                <div id="conName" style="height: 50px; font-size: 15px; margin-left: 10px; font-weight: bolder; font-family: monospace; align-content: center;"></div>
                <div id="player"></div>
                <div style="display: flex; justify-content: left; background-color: #c1baba; height: 20px; padding: 15px;">
                    <button style="cursor: pointer; border: none; background-color: #c1baba; font-weight: bold; font-family: monospace;" onclick="moveVideo(-1)" class="arrow-button"><img src="/img/skip-start-fill.png" style="height: 25px; width: 25px; vertical-align: middle;" class="arrow-image">이전 강의</button>
                    <button style="cursor: pointer; border: none; background-color: #c1baba; font-weight: bold; font-family: monospace; margin-left: 10px;" onclick="moveVideo(1)" class="arrow-button">다음 강의<img src="/img/skip-end-fill.png" style="height: 25px; width: 25px; vertical-align: middle;" class="arrow-image"></button>
                </div>
            </div>
        </div>
        <script>
            // 페이지 URL에서 index 값을 추출합니다.
            const urlParams = new URLSearchParams(window.location.search);
            const index = parseInt(urlParams.get('index'));

            // YouTube 동영상 ID 추출
            const videoId = '${contents[index].videoId}'; // 페이지에서 전달된 contents 배열 사용

            // 1. YouTube API 로드 및 플레이어 생성
            let player;
            function onYouTubeIframeAPIReady() {
                player = new YT.Player('player', {
                    height: '360',
                    width: '640',
                    videoId: videoId,
                    events: {
                        'onReady': onPlayerReady,
                        'onStateChange': onPlayerStateChange
                    }
                });
            }

            // 2. 플레이어가 준비되었을 때 실행되는 함수
            function onPlayerReady(event) {
                event.target.playVideo();
            }

            // 3. 플레이어의 상태가 변경될 때 실행되는 함수
            var done = false;
            function onPlayerStateChange(event) {
                if (event.data == YT.PlayerState.PLAYING && !done) {
                    // PLAYING 상태일 때 추가 동작을 정의할 수 있습니다.
                    done = true;
                }
            }

            // 4. 이전 또는 다음 강의로 이동하는 함수
            function moveVideo(direction) {
                // 실제로 이전 또는 다음 강의의 videoId를 가져오는 로직을 추가해야 합니다.
                // videoId를 업데이트하고, 해당 동영상을 재생합니다.
                player.loadVideoById(videoId); // videoId를 업데이트하고 해당 동영상을 재생합니다.
            }
        </script>
    </div>
</div>
</body>
</html>
