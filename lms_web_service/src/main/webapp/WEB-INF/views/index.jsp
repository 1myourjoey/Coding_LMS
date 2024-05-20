<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>lms</title>

</head>
<body>
    <h2>사용자 페이지</h2>
    <a href="/join">회원 가입</a><br><br>
    <a href="/memberlist">개인정보 수정</a><br><br>
    <a href="/boardlistuser">자료실</a><br><br>
    <a href="/login">로그인</a><br><br>
    <a href="/logout">로그아웃</a><br><br>
        <div id="sessionInfo"></div>


       <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
    // 서버로부터 세션 정보를 가져와 화면에 출력하는 함수
    function getSessionInfo() {
        // AJAX 요청을 통해 서버로부터 세션 정보를 가져옴
        $.ajax({
            type: "GET",
            url: "/getsessioninfo", // 세션 정보를 반환하는 엔드포인트의 URL
            success: function(response) {
                // 세션 정보를 가져와서 화면에 출력
                $("#sessionInfo").html(response);
            },
            error: function() {
                // 오류 발생 시 처리
                $("#sessionInfo").html("세션 정보를 가져오지 못했습니다.");
            }
        });
    }

    // 페이지 로드 시 세션 정보를 가져와서 출력
    $(document).ready(function() {
        getSessionInfo();
    });
</script>

<script>
        // 서버로부터 세션 정보를 가져와서 로그인 상태에 따라 버튼을 업데이트하는 함수
        function updateSessionInfo() {
            $.ajax({
                type: "GET",
                url: "/getsessioninfo", // 세션 정보를 가져오는 엔드포인트 URL
                success: function(response) {
                    // 세션 정보를 가져와서 파싱
                    var sessionData = JSON.parse(response);
                    // 세션 정보에 따라 버튼 표시 여부 결정
                    if (sessionData.loggedIn) {
                        $("#loginBtn").hide();
                        $("#logoutBtn").show();
                    } else {
                        $("#loginBtn").show();
                        $("#logoutBtn").hide();
                    }
                },
                error: function() {
                    // 오류 발생 시 처리
                    $("#sessionInfo").html("세션 정보를 가져오지 못했습니다.");
                }
            });
        }

        // 페이지 로드 시 세션 정보를 가져와서 버튼 상태를 업데이트
        $(document).ready(function() {
            updateSessionInfo();
        });

        // 로그인 버튼 클릭 시 로그인 페이지로 이동
        $("#loginBtn").click(function() {
            window.location.href = "/login";
        });
    </script>

</body>


</html>
