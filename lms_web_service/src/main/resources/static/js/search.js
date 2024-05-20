// 폼 제출 이벤트 리스너 추가
document.getElementById("searchForm").addEventListener("submit", function(event) {
    event.preventDefault(); // 기본 제출 행동 막기
    var form = this;
    var formData = new FormData(form); // 폼 데이터 가져오기

    // lecName 필드 값 가져오기
    var lecNameValue = document.getElementById("lastName").value;

    // AJAX 요청 생성
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "/selectSearch"); // 서버의 실제 경로로 변경해야 함
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

    // 요청 완료 후의 동작 설정
    xhr.onload = function() {
        if (xhr.status === 200) {
            // 응답 처리
            console.log(xhr.responseText);
        } else {
            // 오류 처리
            console.error("오류 발생:", xhr.statusText);
        }
    };

    // 요청 전송
    xhr.send(new URLSearchParams(formData)); // FormData를 쿼리 문자열로 변환하여 전송
});