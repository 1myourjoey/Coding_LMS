$(document).ready(function() {
    // 이미지를 클릭하여 모달 열기
    $('#openModalButton').click(function() {
        $('#myModal').css('display', 'block');
    });

    $('.close').click(function(event) {
        event.preventDefault(); // 기본 클릭 이벤트를 막습니다.
        $('#myModal').css('display', 'none');
    });

    // 선택 버튼 클릭 시 이벤트 처리
    $('.select-button').click(function(event) {
        event.preventDefault(); // 기본 클릭 이벤트를 막습니다.

        // 선택된 테이블 데이터 가져오기
        var selectedRow = $('#dataTable .selected');

        if (selectedRow.length > 0) {
            var firstValue = selectedRow.find('td:eq(0)').text(); // 0번째 열의 값
            var fourthValue = selectedRow.find('td:eq(3)').text(); // 3번째 열의 값

            // 선택된 강좌번호 값을 결과 표시 영역의 input 태그의 value에 설정
            $('[name="lecNum"]').val(firstValue);
            $('[name="lecName"]').val(fourthValue);
            $('#lecName').val(fourthValue);

            // 모달 닫기
            $('#myModal').css('display', 'none');
        } else {
            alert("선택된 행이 없습니다.");
        }
    });

    // 테이블 클릭 시 선택 표시
    $('#dataTable tr').click(function() {
        // 모든 행에서 선택 클래스 제거
        $('#dataTable tr').removeClass('selected');

        // 클릭한 행에 선택 클래스 추가
        $(this).addClass('selected');
    });
});
