<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
</head>
<body>
<h2>Insert Chapter Information</h2>
<form action="/saveChapter" method="post">
    <input type="hidden" name="conNum" value="${conNum}">
    <label for="chapName">chapName:</label><br>
    <input type="text" id="chapName" name="chapName"><br>
    <label for="chapStartTime">chapStartTime: (HH:mm:ss)</label><br>
    <input type="text" id="chapStartTime" name="chapStartTime"><br>
    <input type="submit" value="Submit">
</form>
</body>
</html>