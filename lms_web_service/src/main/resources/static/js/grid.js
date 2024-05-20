let sampleGrid; // 전역 변수로 선언합니다.

const initGrid = (data) => {
    // 그리드 객체
    const Grid = tui.Grid;

    /**
     * Grid 테마 커스텀
     * Grid.applyTheme('striped', {...}) :
     * @param {String} default : 프리셋 (기본)
     * @param {String} striped : 프리셋 (줄무늬)
     * @param {String} clean : 프리셋 (클린)
     *      - preset theme name. Available values are 'default', 'striped' and 'clean'.
     *      - https://nhn.github.io/tui.grid/latest/Grid#applyTheme
     */
    Grid.applyTheme('default', {
        cell: {
            normal: {
                border: 'black'
            },
            evenRow: {
                background: '#fee'
            }
        }
    });

    /**
     * 그리드 설정
     * @variable {Dom} el : 그리드 element(DOM)
     * @variable {boolean} scrollX : X 스크롤 사용여부
     * @variable {boolean} scrollY : Y 스크롤 사용여부
     * @variable {boolean} draggable : 드레그 사용 여부
     * @variable {Number} bodyHeight : 그리드 바디 높이
     * @variable {*} contextMenu : 마우스 우클릭 옵션
     * @variable {Array} columns :
     *      - @variable {String} header : 컬럼명(헤더)
     *      - @variable {String} name : 컬럼 name (input data와 이름이 일치해야함)
     *      - @variable {String} align : 정렬
     *      - @variable {Number} width : 너비
     *      - @variable {String} whiteSpace : 줄바꿈 설정
     *      - @variable {Function} formatter : 출력 포멧
     * 기타 옵션은 공식 document를 참조하자.
     */
sampleGrid = new Grid({
    el: document.getElementById('gridDiv'),
    scrollX: true,
    scrollY: true,
    draggable: false,
    bodyHeight: 200,
    contextMenu: null,


    data: {
        fields: ['교과목', '콘텐츠명', 'Youtube연동번호', '학습시간'],
        rows: [] // 빈 배열로 초기화하거나 초기 데이터를 넣어줍니다.
    },
    columns: [
        {
            header: '교과목',
            name: '교과목',
            align: "center",
            width: 150,
            whiteSpace: 'normal',
            formatter: function (e) {
                return e.value
            },
        },
        {
            header: '콘텐츠명',
            name: '콘텐츠명',
            align: "center",
            width: 150,
            whiteSpace: 'normal',
            formatter: function (e) {
                return e.value
            },
        },
        {
            header: 'Youtube연동번호',
            name: 'Youtube연동번호',
            align: "center",
            width: 200,
            whiteSpace: 'normal',
            formatter: function (e) {
                return e.value
            },
        },
        {
            header: '학습시간',
            name: '학습시간',
            align: "center",
            width: 150,
            whiteSpace: 'normal',
            formatter: function (e) {
                return e.value
            },
        },
    ]
});

    return sampleGrid;
}

function addEmptyRowBelow(button) {
    // 테이블의 tbody를 찾습니다.
    const tbody = document.getElementById('tableBody');

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

    // 나머지 셀에 빈 값을 추가하는 각 셀(td 요소)를 생성합니다.
    for (let i = 0; i < 4; i++) {
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




