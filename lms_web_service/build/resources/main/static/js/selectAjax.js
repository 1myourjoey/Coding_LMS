// 클릭 이벤트 핸들러
function handleClick(conNum) {

    // 클릭된 요소의 conNum 값을 사용하여 AJAX 요청을 보냅니다.
    $.ajax({
        type: "GET",
        url: "/selectContent?conNum=" + conNum, // 클릭된 요소의 conNum 값을 URL에 포함
        success: function(response) {
            // Ajax 요청이 성공하면 받은 데이터를 사용하여 폼 필드에 값을 설정합니다.
            $('input[name="conNum"]').val(response.conNum);
            $('#conName').val(response.conName);
            $('#lecName').val(response.lecName);
            $('#lecNum').val(response.lecNum);
            $('#chapterLecNum').val(response.lecNum);
            $('#ChapterNum').data('conNum', response.conNum);
            $('#ChapterSave').data('conNum', response.conNum);
            $('input[name="description"]').val(response.description);
            $('input[name="videoId"]').val(response.videoId);
            $('input[name="conPlayTime"]').val(response.conPlayTime);
            $('input[name="id"]').val(response.id);
            $('input[name="thumbUrl"]').val(response.thumbUrl);
            $('.js-preview-link').data('conNum', response.conNum);

        },
        error: function(xhr, status, error) {
            // 오류 처리
            console.error("Error:", error);
        }
    });
}

$(document).ready(function() {
    $('.js-preview-link').click(function(e) {
        e.preventDefault(); // 링크의 기본 동작을 중지

        // 클릭된 버튼이 속한 행의 콘텐츠 번호 가져오기
        var conNum = $(this).data('conNum');

        // AJAX 요청 보내기
        $.ajax({
            type: "GET",
            url: "/selectContent?conNum=" + conNum,
            success: function(response) {
                // AJAX 요청이 성공한 경우
                var videoId = response.videoId;
                var youtubeLink = "https://www.youtube.com/watch?v=" + videoId;
                window.open(youtubeLink, "_blank"); // 새 창에서 유튜브 링크 열기
            },
            error: function(xhr, status, error) {
                // 오류 처리
                console.error("Error:", error);
            }
        });
    });
});


function selectChapter(conNum) {
    $.ajax({
        url: "/selectChapter?conNum=" + conNum, // 클릭된 요소의 conNum 값을 URL에 포함
        method: 'POST', // 또는 POST, PUT 등 원하는 HTTP 메서드를 선택하세요
        success: function(response) {
            // 성공적으로 데이터를 가져왔을 때의 처리
            displayChapterData(response); // 가져온 데이터를 처리하는 함수 호출
        },
        error: function(xhr, status, error) {
            // 요청이 실패했을 때의 처리
            console.error("요청 실패");
            console.error(error);
        }
    });
}

function timeToSeconds(time) {
    // 시간을 ':'를 기준으로 나눕니다.
    var parts = time.split(':');
    // 각 부분을 정수로 변환하여 시, 분, 초로 분리합니다.
    var hours = parseInt(parts[0]);
    var minutes = parseInt(parts[1]);
    var seconds = parseInt(parts[2]);
    // 총 초를 계산합니다.
    var totalSeconds = hours * 3600 + minutes * 60 + seconds;
    return totalSeconds;
}

function displayChapterData(chapters) {
    // 서버로부터 받은 데이터를 처리하여 HTML에 추가하는 로직
    var tbody = $('#addChapter'); // 테이블의 tbody 요소 선택

    // 기존 내용을 비웁니다.
    tbody.empty();

    // 각 챕터에 대해 반복하면서 행을 추가합니다.
    $.each(chapters, function(index, chapter) {
        var startTimeSeconds = timeToSeconds(chapter.chapStartTime);
        var row = '<tr>' +
            '<td><input type="checkbox"></td>' +
            '<td id="someId' + index + '" style="text-align: center;" onclick="selectOneChapter(' + chapter.chapNum + ')">' + (index + 1) + '</td>' +
            '<td id="chapName' + index + '" style="text-align: center;" name="chapName" onclick="selectOneChapter(' + chapter.chapNum + ')">' + chapter.chapName +
                '<input type="hidden" name="lecNum" value="' + chapter.lecNum + '">' +
                '<input type="hidden" name="conNum" value="' + chapter.conNum + '">' +
                '<input type="hidden" name="chapNum" value="' + chapter.chapNum + '">' +
            '</td>' +
            '<td id="chapStartTime' + index + '" style="text-align: center;" name="chapStartTime" onclick="selectOneChapter(' + chapter.chapNum + ')">' + chapter.chapStartTime + '</td>' +
            '<td id="someOtherId' + index + '" style="text-align: center;" onclick="selectOneChapter(' + chapter.chapNum + ')">' + startTimeSeconds + '</td>' +
            '</tr>';
        tbody.append(row); // 새로운 행을 추가합니다.
        $('#saveChapterForm')[0].reset();
    });
}






