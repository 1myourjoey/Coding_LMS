<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/css/contents_List.css">
    <title>YouTube Video Popup</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<h1>YouTube Video Popup Example</h1>
<table id="videoList" class="table">
    <!-- 동영상 목록을 표시할 테이블 -->
    <thead>
    <tr>
        <th>conNum</th>
        <th>ThumbNail</th>
        <th>conName</th>
        <th>conDesc</th>
        <th>chapter</th>
        <th>progress</th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <!-- varStatus : 현재 항목의 정보(index를 위해 사용)-->
    <c:forEach items="${contents}" var="content" varStatus="loop">
        <tr class="videoItem" data-videoId="${content.videoId}">
            <td>${content.conNum}</td>
            <td><img src="${content.thumbUrl}" alt="thumbnail" class="thumbnail"></td>
            <td>${content.conName}</td>
            <td>${content.description}</td>
            <td>
                <ul class="chapter-list">
                    <!-- 챕터 정보를 표시할 리스트 -->
                    <c:forEach items="${chapters}" var="chapter">
                        <!-- chapter테이블의 conNum과  -->
                        <c:if test="${chapter.conNum eq content.conNum}">
                            <li class="chapter-item">${chapter.chapName} (${chapter.chapStartTime})</li>
                        </c:if>
                    </c:forEach>
                </ul>
            </td>
            <td id="progress_${loop.index}">0%</td>
            <!-- 학습하기 버튼 -->
            <td><button onclick="openPopup(${loop.index})">학습하기</button></td>
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
            chapters: [
                <c:forEach items="${chapters}" var="chapter" varStatus="chapLoop">
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
    function openPopup(index) {
        //팝업창 안에서 사용할 객체들 선언.
        currentVideoId = window.contents[index].videoId
        var conName = window.contents[index].conName;
        var chapters = window.contents[index].chapters;
        // YouTube 동영상을 표시할 URL 생성
        var url = 'https://www.youtube.com/embed/' + currentVideoId + '?autoplay=1&mute=1';
        var popupWidth = 1500;
        var popupHeight = 850;
        //팝업창 열기
        popup = window.open('','Popup', 'width=' + popupWidth + ', height=' + popupHeight);
        popup.name = index;
        //팝업창 가운데 정렬
        popup.moveTo((window.screen.width - popupWidth) / 2, (window.screen.height - popupHeight) / 2);
        updateProgress(index);

        //팝업창 안에서의 HTML/CSS
        popup.document.write('<div id="video-container" style="width: 100%; height: 650px; display: flex;">');
        var chapterHtml = '<div id="chapter-container" style="flex: 0.7; overflow-y:auto; background-color: #fffbfb; border-right: 1px solid #B8B8B8; margin-right: 2px; height: 750px;">';
        chapterHtml += '<div style="    height: 50px; font-size: 15px; margin-left: 10px; font-weight: bolder; font-family: monospace; align-content: center;">챕터 목록</div>';
        chapterHtml += '<div id="chapterList" style="margin-right: 20px">';
        for (var i = 0; i < chapters.length; i++) {
            chapterHtml += '<div class="chapterItem" style="border: 1px solid #ddd; background-color: #ffffff; height: 70px; padding: 8px; margin-bottom: 10px; border-radius: 10px; cursor: pointer;" onclick="opener.seekToChapter(\'' + chapters[i].chapStartTime + '\')">' + chapters[i].chapName + ' (' + chapters[i].chapStartTime + ')</div>';
        }
        chapterHtml += '</div></div>';
        popup.document.write(chapterHtml);

        popup.document.write('<div id="player-container" style="flex: 2; padding-right: 10px;">');
        popup.document.write('<div id="conName" style="height: 50px; font-size: 15px; margin-left: 10px; font-weight: bolder; font-family: monospace; align-content: center;"></div>')
        popup.document.write('<iframe id="player" width="100%" height="100%" src="' + url + '" frameborder="0" allowfullscreen></iframe>');
        popup.document.getElementById('conName').innerText = conName;
        var controlsHtml = '<div style="display: flex; justify-content: left; background-color: #c1baba; height: 20px; padding: 15px;">';
        var prevButtonHtml = '<button style="cursor: pointer; border: none; background-color: #c1baba; font-weight: bold; font-family: monospace;" onclick="opener.moveVideo(-1)" class="arrow-button"><img src="/img/skip-start-fill.png" style="height: 25px; width: 25px; vertical-align: middle;" class="arrow-image">이전 강의</button>';
        var nextButtonHtml = '<button style="cursor: pointer; border: none; background-color: #c1baba; font-weight: bold; font-family: monospace; margin-left: 10px;" onclick="opener.moveVideo(1)" class="arrow-button">다음 강의<img src="/img/skip-end-fill.png" style="height: 25px; width: 25px; vertical-align: middle;" class="arrow-image"></button>';
        controlsHtml += prevButtonHtml + nextButtonHtml;
        controlsHtml += '</div>';
        popup.document.write(controlsHtml);
        popup.document.write('</div>');
        popup.document.write('</div>');

        // 팝업이 닫힐 때 시청한 시간 저장
        popup.onbeforeunload = function () {
            saveProgress(index);
        };

    }

    // 시간을 초 단위로 변환
    function convertToSeconds(time) {
        var parts = time.split(':');
        return (+parts[0]) * 60 * 60 + (+parts[1]) * 60 + (+parts[2]);
    }

    //챕터의 시간대로 영상의 url을 변경하여 이동
    window.seekToChapter = function(chapStartTime) {
        //chapStartTime을 초 단위로 변환
        var chapStartTimeInSeconds = convertToSeconds(chapStartTime);

        // 새로운 URL 생성 (챕터의 시작 시간을 지정하여 재생)
        var newUrl = 'https://www.youtube.com/embed/' + currentVideoId + '?start=' + chapStartTimeInSeconds + '&autoplay=1&mute=1';

        // YouTube 동영상 업데이트
        popup.document.getElementsByTagName('iframe')[0].src = newUrl;
    }

    //현재 index로 이전,다음의 인덱스를 계산 후 영상의 url 정보를 가져와서 강의 이동
    window.moveVideo = function(direction) {
        // 현재 팝업 창의 동영상 인덱스
        var currentIndex = parseInt(popup.name);
        // 새로운 인덱스 계산
        var newIndex = currentIndex + direction;

        // 인덱스 범위 검사
        if (newIndex >= 0 && newIndex < window.videos.length) {
            // 이전/다음 동영상의 정보 가져오기
            var newVideo = window.videos[newIndex];
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
    function saveProgress(index) {
        var currentTime = popup.document.getElementsByTagName('iframe')[0].contentWindow.document.getElementsByTagName('video')[0].currentTime;
        // AJAX 요청을 사용하여 서버에 현재 시청한 시간을 저장
        $.ajax({
            url: '/saveVideoProgress', // 저장하는 API endpoint
            type: 'POST',
            data: {
                videoId: contents[index].videoId,
                currentTime: currentTime
            },
            success: function(data) {
                console.log('Progress saved successfully.');
            }
        });
    }
    function updateProgress(index) {
        document.getElementById('progress_' + index).innerText = '0%';
    }
</script>
</body>
</html>