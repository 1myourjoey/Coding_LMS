    function toggleAllCheckboxes() {
        // 전체 선택 체크박스 상태를 가져옵니다.
        const masterCheckbox = document.querySelector('#masterCheckbox');
        const isChecked = masterCheckbox.checked;

        // 모든 체크박스를 가져와서 상태를 변경합니다.
        const checkboxes = document.querySelectorAll('tbody input[type="checkbox"]');
        checkboxes.forEach(checkbox => {
            checkbox.checked = isChecked;
        });
    }