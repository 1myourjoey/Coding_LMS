$(document).ready(function() {
    // 폼 전송 이벤트를 가로챕니다.
    $('#updateContent').submit(function(e) {
        e.preventDefault(); // 기본 전송 이벤트를 막습니다.

        // 폼 데이터를 가져옵니다.
        var formData = $(this).serialize();

        // AJAX 요청을 보냅니다.
        $.ajax({
            url: 'updateContent', // 서버의 엔드포인트 URL
            method: 'POST', // HTTP 메서드
            data: formData, // 폼 데이터
            success: function(response) {
                // 성공적으로 요청을 보냈을 때의 처리
                console.log('요청 성공');

                // 업데이트된 데이터를 받아서 목록을 업데이트하는 함수를 호출
                updateContentList();

                $('#updateContent')[0].reset();
                alert('데이터가 성공적으로 저장되었습니다.');
            },
            error: function(xhr, status, error) {
                // 요청이 실패했을 때의 처리
                console.error('요청 실패');
                console.error(error);
                // 실패 메시지 또는 오류 처리를 수행할 수 있습니다.
            }
        });
    });


$('#deleteContentForm').submit(function(event) {
    event.preventDefault(); // 기본 폼 제출 방지

    // 사용자에게 확인 메시지 표시
    var confirmDelete = confirm("데이터를 삭제하시겠습니까?");

    if (confirmDelete) {
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

                // 삭제 후 업데이트된 목록을 불러옵니다.
                updateContentList();

                $('#updateContent')[0].reset();
                alert('데이터가 성공적으로 삭제되었습니다.');
            },
            error: function(xhr, status, error) {
                // 요청이 실패했을 때의 처리
                console.error("요청 실패");
                console.error(error);
            }
        });
    } else {
        // 사용자가 삭제를 취소한 경우
        console.log("삭제 요청 취소됨");
    }
});


    // 목록을 업데이트하는 함수
    function updateContentList() {
        $.ajax({
            url: 'content', // 서버의 엔드포인트 URL
            type: 'GET', // HTTP 메서드
            success: function(response) {
                // 응답에서 업데이트된 목록 데이터를 추출
                var updatedContentList = $(response).find('#tableBody').html();

                // 현재 페이지의 목록을 업데이트된 목록으로 교체
                $('#tableBody').html(updatedContentList);
            },
            error: function(xhr, status, error) {
                // AJAX 요청이 실패한 경우의 처리
                console.error('AJAX 요청 실패:', status, error);
            }
        });
    }
});


$(document).ready(function() {
    // 초기 목록을 불러오는 함수
    function loadInitialContent() {
        $.ajax({
            url: 'content', // 기본 목록을 가져오는 엔드포인트 URL
            method: 'GET', // HTTP 메서드
            success: function(response) {
                // 응답에서 <tbody> 내부의 콘텐츠만 추출합니다.
                var newTableBodyContent = $(response).find('tbody').html();

                // 목록을 업데이트합니다.
                $('#tableBody').html(newTableBodyContent);
            },
            error: function(xhr, status, error) {
                // 요청이 실패했을 때의 처리
                console.error("초기 목록 요청 실패");
                console.error(error);
            }
        });
    }

    // 검색 폼 전송 이벤트를 가로챕니다.
    $('#searchForm').submit(function(event) {
        event.preventDefault(); // 기본 폼 제출을 막습니다.

        // 폼 데이터를 가져옵니다.
        var formData = $(this).serialize();

        // 입력 필드의 값을 확인합니다.
        var conName = $('#firstName').val().trim();
        var lecName = $('#lastName').val().trim();

        if (conName === "" && lecName === "") {
            // 검색 값이 비어 있으면 초기 목록을 불러옵니다.
            loadInitialContent();
        } else {
            // 검색 값이 비어 있지 않으면 AJAX 요청을 보냅니다.
            $.ajax({
                url: 'selectSearch', // 서버의 엔드포인트 URL
                method: 'POST', // HTTP 메서드
                data: formData, // 폼 데이터
                success: function(response) {
                    // 성공적으로 요청을 보냈을 때의 처리
                    console.log("검색 요청 성공");

                    $('#firstName').val('');
                    $('#lastName').val('');

                    // 응답에서 <tbody> 내부의 콘텐츠만 추출합니다.
                    var newTableBodyContent = $(response).find('tbody').html();

                    // 검색 결과를 업데이트합니다.
                    $('#tableBody').html(newTableBodyContent);
                },
                error: function(xhr, status, error) {
                    // 요청이 실패했을 때의 처리
                    console.error("검색 요청 실패");
                    console.error(error);
                }
            });
        }
    });

    // 검색 버튼 클릭 시 폼 리셋 및 초기 목록 로드
    $('#resetButton').click(function(event) {
        event.preventDefault(); // 기본 이벤트를 막습니다.

        // 폼을 리셋합니다.
        $('#searchForm')[0].reset();

        // 초기 목록을 불러옵니다.
        loadInitialContent();
    });
});

