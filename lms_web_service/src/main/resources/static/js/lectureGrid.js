function addEmptyRow(button) {
    // 테이블의 tbody를 찾습니다.
    const tbody = document.getElementById('tdInsert');

    // 새로운 행(tr 요소)를 생성합니다.
    const newRow = document.createElement('tr');

    // 나머지 셀에 빈 값을 추가하는 각 셀(td 요소)를 생성합니다.
    for (let i = 0; i < 5; i++) {
        const newCell = document.createElement('td');
        const link = document.createElement('a');
        link.href = "#";
        link.textContent = ""; // 빈 값으로 설정

        // 클릭 이벤트 핸들러 설정
        newCell.onclick = function() {
            handleClick('');
            return false;
        };

        newCell.appendChild(link); // 행에 링크를 추가합니다.
        newRow.appendChild(newCell); // 행에 셀을 추가합니다.
    }

    // tbody에 새로운 행을 추가합니다.
    tbody.appendChild(newRow);
}
