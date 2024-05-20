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
    var apiKey = "AIzaSyCGhQyWj6a975itCkAKU_vkojXiZHV2vto";
    var apiUrl = "https://www.googleapis.com/youtube/v3/videos?id=" + videoId + "&key=" + apiKey + "&part=snippet";

    fetch(apiUrl)
        .then(response => response.json())
        .then(data => {
            if (data.items && data.items.length > 0) {
                const video = data.items[0];
                if (video.snippet && video.snippet.thumbnails && video.snippet.thumbnails.high) {
                    const thumbnailUrl = video.snippet.thumbnails.high.url;
                    document.getElementById('thumbUrl').value = thumbnailUrl;
                } else {
                    alert('썸네일 정보를 찾을 수 없습니다.');
                }
            } else {
                alert('유효하지 않은 비디오 ID이거나 비디오를 찾을 수 없습니다.');
            }
        })
        .catch(error => {
            console.error('비디오 데이터를 가져오는 중 오류 발생:', error);
            alert('썸네일을 가져오는 중 오류가 발생했습니다.');
        });
}

function updateThumbnailUrl() {
    fetchThumbnail();
}