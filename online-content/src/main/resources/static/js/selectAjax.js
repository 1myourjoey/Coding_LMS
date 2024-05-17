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
            $('input[name="description"]').val(response.description);
            $('input[name="videoId"]').val(response.videoId);
            $('input[name="conPlayTime"]').val(response.conPlayTime);
            $('input[name="id"]').val(response.id);
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