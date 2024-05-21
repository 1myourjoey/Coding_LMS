    // 탭을 클릭했을 때 해당하는 테이블 보이도록 처리
    $(document).ready(function(){
        $("#tab1").click(function(){
            $("#contentInfo").show();
            $("#chapterInfo").hide();
        });
        $("#tab2").click(function(){
            $("#contentInfo").hide();
            $("#chapterInfo").show();
        });
    });