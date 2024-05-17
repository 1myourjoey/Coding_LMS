<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
</head>
<body>
<h1>Save YouTube Video</h1>
<form id="videoForm" action="/saveVideo" method="post">
    <label for="conNum">conNum:</label><br>
    <input type="text" id="conNum" name="conNum"><br>
    <label for="videoId">Video ID:</label><br>
    <input type="text" id="videoId" name="videoId"><br>
    <label for="conName">conName:</label><br>
    <input type="text" id="conName" name="conName"><br>
    <label for="conDesc">Description:</label><br>
    <textarea id="conDesc" name="conDesc"></textarea><br>
    <label for="conPlayTime">conPlayTime:</label><br>
    <input type="text" id="conPlayTime" name="conPlayTime"><br>
    <label for="lecName">lecName:</label><br>
    <input type="text" id="lecName" name="lecName"><br>
    <label for="thumbUrl">Thumbnail URL:</label><br>
    <input type="text" id="thumbUrl" name="thumbUrl"><br>
    <button type="submit">Save</button>
</form>
</body>
</html>