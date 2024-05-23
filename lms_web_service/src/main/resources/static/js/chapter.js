$(document).ready(function() {
    // 폼 제출 이벤트 리스너
    $('#saveChapterForm').submit(function(event) {
    var conNum = $('#ChapterSave').data('conNum');
        event.preventDefault(); // 기본 동작 방지

        // 폼 데이터를 가져옵니다.
        var formData = $(this).serialize();

        // AJAX 요청을 보냅니다.
        $.ajax({
            url: 'saveChapter', // action 속성에 지정된 URL로 요청을 보냅니다.
            method: 'POST', // method 속성에 지정된 HTTP 메서드를 사용합니다.
            data: formData, // 폼 데이터를 전송합니다.
            success: function(response) {
                // 요청이 성공적으로 처리되었을 때의 처리
                console.log("저장 요청 성공");

                $('#saveChapterForm')[0].reset();
                $('input[name="chapName"]').val('');
                $('input[name="chapStartTime"]').val('');
                $('input[name="chapNum"]').val('');

                alert('데이터가 성공적으로 저장되었습니다.');
                selectChapter(conNum);
                // 여기에 성공 메시지 표시 등의 추가 작업을 할 수 있습니다.
            },
            error: function(xhr, status, error) {

                // 요청이 실패했을 때의 처리
                console.error("저장 요청 실패");
                console.error(error);

                $('#saveChapterForm')[0].reset();

                $('input[name="chapName"]').val('');
                $('input[name="chapStartTime"]').val('');
                $('input[name="chapNum"]').val('');
                alert('데이터 저장에 실패하였습니다.');
                // 여기에 실패 메시지 표시 등의 추가 작업을 할 수 있습니다.
            }
        });
    });
});

function selectOneChapter(chapNum) {
    // chapNum을 서버로 전송하여 데이터를 가져옴
    $.ajax({
        url: 'selectOneChapter', // 서버의 URL
        type: 'POST', // HTTP 요청 방식
        data: { chapNum: chapNum }, // 전송할 데이터
        success: function(response) {
            // 성공 시 처리할 내용
            console.log(response); // 서버에서 받은 응답을 콘솔에 출력

            // chapName과 chapStartTime 입력 필드에 값 설정
            $('input[name="chapName"]').val(response.chapName);
            $('input[name="chapStartTime"]').val(response.chapStartTime);
            $('input[name="chapNum"]').val(response.chapNum);
        },
        error: function(xhr, status, error) {
            // 에러 발생 시 처리할 내용
            console.error(error); // 에러 메시지를 콘솔에 출력
        }
    });
}

function deleteChapter() {

    var conNum = $('#ChapterNum').data('conNum');
    if (confirm("정말로 이 챕터를 삭제하시겠습니까?")) {
        var formData = $('#deleteChapterForm').serialize(); // 폼 데이터를 수집합니다.

        $.ajax({
            url: 'deleteChapter', // 서버의 URL
            type: 'POST', // HTTP 요청 방식
            data: formData, // 수집한 폼 데이터를 전송합니다.
            success: function(response) {

                console.log(response); // 서버에서 받은 응답을 콘솔에 출력
                alert('챕터가 성공적으로 삭제되었습니다.');
                $('#saveChapterForm')[0].reset();
                selectChapter(conNum);

                // 삭제 후 필요한 작업 수행
            },
            error: function(xhr, status, error) {
                // 에러 발생 시 처리할 내용
                console.error(error); // 에러 메시지를 콘솔에 출력
                alert('챕터 삭제에 실패했습니다.');
                $('#saveChapterForm')[0].reset();
            }
        });
    }
}
