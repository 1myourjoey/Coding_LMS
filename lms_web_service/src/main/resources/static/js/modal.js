$(document).ready(function() {
    // 이미지를 클릭하여 모달 열기
    $('#openModalButton').click(function() {
        appendNewLecture();
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
            $('#lecNum').val(firstValue);
            $('#lecName').val(fourthValue);
            // 모달 닫기
            $('#myModal').css('display', 'none');
        } else {
            alert("선택된 행이 없습니다.");
        }
    });

    $('#dataTable').on('click', 'tr', function() {
        // 모든 행에서 선택 클래스 제거
        $('#dataTable tr').removeClass('selected');

        // 클릭한 행에 선택 클래스 추가
        $(this).addClass('selected');
    });

});

$(document).ready(function() {
    // 모달 내 검색 폼 제출 이벤트 리스너
    $('#modalSearchForm').submit(function(e) {
        e.preventDefault(); // 폼 기본 동작 방지

        // 입력된 검색어 가져오기
        var searchKeyword = $('#modalSearchInput').val();

        // AJAX 요청
        $.ajax({
            url: '/modalSearch', // 검색을 처리할 서버의 엔드포인트
            method: 'POST', // POST 요청
            data: { lecName: searchKeyword }, // 검색어를 서버에 전달
            success: function(response) {
                // 성공적으로 검색 결과를 받았을 때 실행되는 콜백 함수
                // 검색 결과를 테이블에 표시
                displaySearchResults(response);
                $('#modalSearchInput').val('');

            },
            error: function(xhr, status, error) {
                // 요청이 실패한 경우 실행되는 콜백 함수
                console.error('AJAX request failed:', status, error);
            }
        });
    });

    // 검색 결과를 테이블에 표시하는 함수
    function displaySearchResults(results) {
        // 결과를 표시할 tbody 요소 선택
        var $tbody = $('#modalSearchResults');

        // tbody 내용 비우기
        $tbody.empty();

        // 결과를 순회하면서 테이블에 추가
        $.each(results, function(index, result) {
            // 각 결과를 테이블에 추가하는 코드
            var row = '<tr>' +
                '<td>' + result.lecNum + '</td>' +
                '<td>' + result.lecStartDate + '</td>' +
                '<td>' + result.lecEndDate + '</td>' +
                '<td>' + result.lecName + '</td>' +
                '<td>' + result.lecEx + '</td>' +
                '</tr>';
            $tbody.append(row);
        });
    }
});
    function appendNewLecture() {
        $.ajax({
            url: 'lecture',
            type: 'GET',
            success: function(response) {
                // 응답에서 헤더와 사이드바를 제외한 부분을 추출하여 사용
                var lectureInfo = $(response).find('#tdInsert').html();
                $('#tdInsert').html(lectureInfo);
                $('#modalSearchResults').html(lectureInfo);
            },
            error: function(xhr, status, error) {
                console.error('AJAX request failed:', status, error);
            }
        });
    }