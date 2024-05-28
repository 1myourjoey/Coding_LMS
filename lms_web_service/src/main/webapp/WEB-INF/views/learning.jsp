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
                    <c:forEach items="${chapters}" var="chapter" varStatus="loop">
                        <div class="chapterItem" data-start-time="${chapter.chapStartTime}">${loop.index + 1} ${chapter.chapName} (${chapter.chapStartTime})</div>
                    </c:forEach>
                </div>
            </div>
            <div id="player-container">
                <div id="conName">${contents.conName}</div>
                <div id="player"></div>
                <div id="player-control">
                    <div style="display: flex; align-items: center; margin-right: 10px;">
                        <button class="preButton">
                            <img src="/img/skip-start-fill.png" class="arrow-image">
                            이전 강의</button>
                    </div>
                    <div style="display: flex; align-items: center;">
                        <button class="nextButton">다음 강의
                            <img src="/img/skip-end-fill.png" class="arrow-image">
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <script>
                var tag = document.createElement('script');
                tag.src = "https://www.youtube.com/iframe_api";
                var firstScriptTag = document.getElementsByTagName('script')[0];
                firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

                var player;
                var previousLearningTime;
                // YouTube API 준비 완료 시 실행되는 함수
                function onYouTubeIframeAPIReady() {
                    player = new YT.Player('player', {
                        height: '600',
                        width: '1000',
                        videoId: "${contents.videoId}",
                        playerVars: {
                            'modestbranding': 1,
                            'rel': 0,
                            'loop': 0,
                            'autoplay': 0,
                        },
                        events: {
                            'onReady': onPlayerReady,
                        }
                    });
                }

                function onPlayerReady(event) {
                    event.target.playVideo();
                    // 플레이어가 준비된 후에 이전 학습 시간을 가져와서 플레이어를 초기화합니다.
                    getPreviousLearningTime();
                }

                function getPreviousLearningTime() {
                    var conNum = "${contents.conNum}";
                    var userNo = "${userNo}";

                    // AJAX 요청을 통해 이전 학습 시간을 가져옴
                    $.ajax({
                        type: "GET",
                        url: "/get-previous-learning-time",
                        data: {
                            conNum: conNum,
                            userNo: userNo
                        },
                        dataType: 'json', // JSON 형식으로 데이터를 받음
                        success: function(response) {
                            previousLearningTime = parseInt(response.learningTime);
                            if (!isNaN(previousLearningTime)) {
                                player.seekTo(previousLearningTime);
                            }
                        },
                        error: function(xhr, status, error) {
                            console.error("Error occurred while getting previous learning time:", error);
                        }
                    });
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
                        return (+parts[0]) * 3600 + (+parts[1]) * 60 + (+parts[2]);
                    }

                    });


                $(window).on("beforeunload", function() {
                var currentTime = Math.floor(player.getCurrentTime());
                var conNum = "${contents.conNum}";
                var lecNum = "${contents.lecNum}";
                var userNo = "${userNo}";
                var maxS = "${contents.conPlayTime}";
                // AJAX 요청을 비동기적으로 변경
                $.ajax({
                type: "POST",
                url: "/save-progress",
                data: {
                learningTime: currentTime,
                conNum: conNum,
                lecNum: lecNum,
                userNo: userNo,
                maxS: maxS
            },
                async: true, // 비동기적 요청으로 변경
                success: function(response) {
                console.log("Progress saved successfully");
            },
                error: function(xhr, status, error) {
                console.error("Error occurred while saving progress:", error);
            }
            });
            });
        </script>
    </div>
</div>
</body>
</html>
