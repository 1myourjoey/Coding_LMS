    document.addEventListener('DOMContentLoaded', function() {
    var btnHide = document.querySelector('#btn-hide');
    var btnShow = document.querySelector('#btn-show');

    // 초기에는 사이드바를 보여주고 메뉴숨기기 버튼만 활성화합니다.
    var sidebar = document.querySelector('#sidebar');
    sidebar.style.display = 'block';
    btnHide.style.display = 'block';
    btnShow.style.display = 'none';

    // 메뉴숨기기 버튼을 누르면 사이드바를 감추고 메뉴열기 버튼을 활성화합니다.
    btnHide.addEventListener('click', function() {
        sidebar.style.display = 'none';
        btnHide.style.display = 'none';
        btnShow.style.display = 'block';
    });

    // 메뉴열기 버튼을 누르면 사이드바를 보여주고 메뉴숨기기 버튼을 활성화합니다.
    btnShow.addEventListener('click', function() {
        sidebar.style.display = 'block';
        btnShow.style.display = 'none';
        btnHide.style.display = 'block';
    });
});