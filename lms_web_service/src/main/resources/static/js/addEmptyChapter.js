function addEmptyChapter(button) {
    // 테이블의 tbody를 찾습니다.
    const tbody = document.getElementById('addChapter');

    // 새로운 행(tr 요소)를 생성합니다.
    const newRow = document.createElement('tr');

    // 첫 번째 셀에 체크박스를 생성합니다.
    const checkboxCell = document.createElement('td');
    const checkbox = document.createElement('input');
    checkbox.type = 'checkbox';

    // 체크박스의 onchange 이벤트 핸들러 설정
    checkbox.onchange = function() {
        handleCheckboxChange(this);
    };

    checkboxCell.appendChild(checkbox); // 셀에 체크박스를 추가합니다.
    newRow.appendChild(checkboxCell); // 행에 첫 번째 셀을 추가합니다.

    // 첫 번째 td에 readonly 속성을 가진 input을 추가합니다.
    const firstInputCell = document.createElement('td');
    const firstInput = document.createElement('input');
    firstInput.type = 'text';
    firstInput.value = ""; // 빈 값으로 설정
    firstInput.style.width = '100%';
    firstInput.style.textAlign = 'center';
    firstInput.style.border = 'none';
    firstInput.readOnly = true;

    firstInputCell.appendChild(firstInput); // 셀에 입력 필드를 추가합니다.
    newRow.appendChild(firstInputCell); // 행에 셀을 추가합니다.

    // 나머지 셀에 빈 값을 추가하는 각 셀(td 요소)를 생성합니다.
    for (let i = 0; i < 3; i++) {
        const newCell = document.createElement('td');
        const input = document.createElement('input');
        input.type = 'text';
        input.value = ""; // 빈 값으로 설정
        input.style.width = '100%';
        input.style.textAlign = 'center';
        input.style.border = 'none';

        newCell.appendChild(input); // 셀에 입력 필드를 추가합니다.
        newRow.appendChild(newCell); // 행에 셀을 추가합니다.
    }

    // tbody에 새로운 행을 추가합니다.
    tbody.appendChild(newRow);
}
