document.addEventListener('DOMContentLoaded', function() {
    document.querySelectorAll('.page-link.pgn').forEach(function(link) {
        link.addEventListener('click', function(event) {
            event.preventDefault();
            let pageNo = this.getAttribute('data-page');
            updateTable(pageNo);
        });
    });

    function updateTable(pageNo) {
        // 페이지 이동 요청을 서버에 전송
        fetch('/content?page=' + pageNo, {
            headers: {
                'X-Requested-With': 'XMLHttpRequest'
            }
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok ' + response.statusText);
            }
            return response.text();
        })
        .then(data => {
            // 새로운 페이지 HTML에서 tbody 부분만 추출
            let tableBodyHtml = (new DOMParser().parseFromString(data, 'text/html')).querySelector('#tableBody').innerHTML;
            // 현재 페이지의 tbody를 업데이트
            document.querySelector('#tableBody').innerHTML = tableBodyHtml;
            // 페이지 이동 후 스크롤 맨 위로 이동
            window.scrollTo(0, 0);
        })
        .catch(error => console.error('Error:', error));
    }
});
