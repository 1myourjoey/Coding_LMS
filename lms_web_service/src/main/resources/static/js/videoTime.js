document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('videoIdInput').addEventListener('change', fetchThumbnail);
});

function updateVideoDuration() {
    var videoId = document.getElementById("videoIdInput").value; // 비디오 ID 가져오기
    var apiKey = "AIzaSyCGhQyWj6a975itCkAKU_vkojXiZHV2vto";
    var apiUrl = "https://www.googleapis.com/youtube/v3/videos?id=" + videoId + "&key=" + apiKey + "&part=contentDetails";

    fetch(apiUrl)
        .then(response => response.json())
        .then(data => {
            var duration = data.items[0].contentDetails.duration;
            var formattedDuration = formatDuration(duration);
            document.getElementById("conPlayTime").value = formattedDuration;
        })
        .catch(error => {
            console.error('Error:', error);
            document.getElementById("conPlayTime").value = "Error fetching video duration";
        });
}

function formatDuration(duration) {
  var matches = duration.match(/[0-9]+[HMS]/g);

  var totalSeconds = 0;

  matches.forEach(function (part) {
      var unit = part.charAt(part.length - 1);
      var value = parseInt(part.slice(0, -1));

      if (unit === 'H') {
          totalSeconds += value * 3600; // 시간을 초로 변환
      } else if (unit === 'M') {
          totalSeconds += value * 60; // 분을 초로 변환
      } else if (unit === 'S') {
          totalSeconds += value; // 그대로 초로 사용
      }
  });

  return totalSeconds;
}

function fetchThumbnail() {
    const videoId = document.getElementById('videoIdInput').value;
    var apiUrl = "http://img.youtube.com/vi/" + videoId + "/default.jpg";
    // 이미지 URL로 직접 요청
    document.getElementById('thumbUrl').value = apiUrl;
}