function lectureClick(lecNum) {
    // 클릭된 요소의 lecNum 값을 사용하여 AJAX 요청을 보냅니다.
    $.ajax({
        type: "GET",
        url: "/selectLecture?lecNum=" + lecNum, // 클릭된 요소의 lecNum 값을 URL에 포함
        success: function(response) {
            // 응답 데이터를 사용하여 해당 폼 요소의 값을 설정합니다.
            $('#inputLecNum').val(response.lecNum);
            $('#inputLecName').val(response.lecName);
            $('input[name="lecStartDate"]').val(response.lecStartDate);
            $('input[name="lecEndDate"]').val(response.lecEndDate);
            $('#deleteButton').val(response.lecNum);
            $('textarea[name="lecEx"]').val(response.lecEx);
        },
        error: function(xhr, status, error) {
            // 오류 처리
            console.error("Error:", error);
        }
    });
}
