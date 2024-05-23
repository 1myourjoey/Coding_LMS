$(document).ready(function() {
    // 로컬 스토리지에서 숨김 상태를 가져옵니다.
    var isContainerHidden = localStorage.getItem('isContainerHidden');

    // 컨텐츠정보 링크 클릭 시
    $('#contentLink').click(function(e) {
        e.preventDefault(); // 기본 이벤트(링크 이동) 방지

        // 강좌 정보 폼을 숨깁니다.
        $('#lectureForm').hide();

        // .container-fluid를 나타내기만 합니다.
        $('.container-fluid').show();

        // 숨김 상태를 로컬 스토리지에 저장합니다.
        localStorage.setItem('isContainerHidden', false);

        // 강좌 정보 폼의 submit 이벤트 제거
        $('#lectureForm').off('submit');
    });

    // 강좌정보 링크 클릭 시
    $('#lectureLink').click(function(e) {
        e.preventDefault(); // 기본 이벤트(링크 이동) 방지

        // AJAX를 통해 강좌 정보 폼을 가져옵니다.
        $.ajax({
            url: '/lecture', // 컨트롤러의 URL
            method: 'GET',
            success: function(response) {
                // 성공적으로 폼을 가져왔을 때, 가져온 HTML을 삽입합니다.
                $('#lectureForm').html(response);

                // 숨김 상태를 로컬 스토리지에 저장합니다.
                localStorage.setItem('isContainerHidden', true);

                // 컨텐츠 정보를 숨기고 강좌 정보 폼을 표시합니다.
                $('.container-fluid').hide();
                $('#lectureForm').show();


                // 강좌 정보 폼의 submit 이벤트 추가
                $('#lectureForm').submit(function(e) {
                    // 필요한 작업 수행
                });
            },
            error: function(xhr, status, error) {
                // 에러가 발생했을 때의 처리
                console.error(error);
            }
        });
    });

    // 페이지 로드 시 저장된 숨김 상태를 확인하고 적용합니다.
    if (isContainerHidden === 'true') {
        // 강좌 정보 폼을 숨깁니다.
        $('#lectureForm').hide();
    } else {
        // 컨텐츠 정보를 숨기고 강좌 정보 폼을 표시합니다.
        $('.container-fluid').hide();
        $('#lectureForm').show();
    }
});