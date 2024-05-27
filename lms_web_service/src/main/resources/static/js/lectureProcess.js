$(document).ready(function() {
    $('form[action="lectureInfo"]').submit(function(event) {
        // 폼의 기본 동작을 막습니다.
        event.preventDefault();

        // 폼 데이터를 직렬화합니다.
        var formData = $(this).serialize();

        // 현재 폼을 변수에 저장합니다.
        var $form = $(this);

        // AJAX 요청을 보냅니다.
        $.ajax({
            url: 'lectureInfo', // 강좌 정보를 추가하는 서버의 엔드포인트
            type: 'POST', // POST 요청
            data: formData, // 폼 데이터 전송
            success: function(response) {
                // 성공적으로 응답을 받았을 때 실행되는 콜백 함수
                // 새로운 강좌 정보를 가져와서 목록에 추가합니다.
                appendNewLecture(response);

                // 폼의 입력 필드를 비웁니다.
                alert('데이터가 성공적으로 저장되었습니다.');
                $form[0].reset();
            },
            error: function(xhr, status, error) {
                // 요청이 실패한 경우 실행되는 콜백 함수
                console.error('AJAX request failed:', status, error);
            }
        });
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
});

        $(document).ready(function() {
            // 검색 폼 제출 이벤트 리스너
            $('#lectureSearch').submit(function(e) {
                e.preventDefault(); // 폼 기본 동작 방지

            var formData = $('#lectureSearch').serialize();

                // AJAX 요청
                $.ajax({
                    url: '/lectureSearch', // 검색을 처리할 서버의 엔드포인트
                    method: 'POST', // POST 요청
                    data: formData,
                    success: function(response) {
                        // 성공적으로 검색 결과를 받았을 때 실행되는 콜백 함수
                        // 검색 결과를 테이블에 표시
                        displaySearchResults(response);
                        $('#lec_name').val('');
                        $('#lecEx').val('');
                        $('#lectureReset')[0].reset();

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
                var $tbody = $('#tdInsert');

                // tbody 내용 비우기
                $tbody.empty();

                // 결과를 순회하면서 테이블에 추가
                $.each(results, function(index, result) {
                    var row = '<tr>' +
                    '<td onclick="lectureClick(\'' + result.lecNum + '\'); return false;">' + result.lecNum + '</td>' +
                    '<td onclick="lectureClick(\'' + result.lecNum + '\'); return false;">' + result.lecStartDate + '</td>' +
                    '<td onclick="lectureClick(\'' + result.lecNum + '\'); return false;">' + result.lecEndDate + '</td>' +
                    '<td onclick="lectureClick(\'' + result.lecNum + '\'); return false;">' + result.lecName + '</td>' +
                    '<td onclick="lectureClick(\'' + result.lecNum + '\'); return false;">' + result.lecEx + '</td>' +
                        '</tr>';
                    $tbody.append(row);
                });
            }
        });

        $(document).ready(function() {
            // 삭제 폼 제출 이벤트 리스너
            $('#deleteLectureForm').submit(function(event) {
                event.preventDefault(); // 폼 기본 동작 방지

                // 확인 메시지를 표시
                var confirmation = confirm('데이터를 삭제하시겠습니까?');

                if (confirmation) {
                    // 폼 데이터를 가져옵니다.
                    var formData = $(this).serialize();

                    // AJAX 요청을 보냅니다.
                    $.ajax({
                        url: $(this).attr('action'),
                        method: 'POST',
                        data: formData,
                        success: function(response) {
                            // 성공적으로 요청을 보냈을 때의 처리
                            console.log("삭제 요청 성공");
                            alert('데이터가 성공적으로 삭제되었습니다.');

                            // 삭제 후 업데이트된 목록을 불러옵니다.
                            appendNewLecture();
                            $('#lectureSearch')[0].reset();
                        },
                        error: function(xhr, status, error) {
                            // 요청이 실패했을 때의 처리
                            console.error("요청 실패");
                            console.error(error);
                        }
                    });
                } else {
                    // 삭제 취소 시 아무 동작도 하지 않음
                    console.log("삭제 요청 취소됨");
                }
            });
        });
