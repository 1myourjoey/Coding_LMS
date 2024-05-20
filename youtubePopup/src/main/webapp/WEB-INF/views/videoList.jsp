<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>YouTube Video Popup</title>
</head>
<body>
<h1>Video List</h1>
<ul>
    <c:forEach items="${videos}" var="video">
        <li><a href="/insert_chap?conNum=${video.conNum}">${video.conNum}</a></li>
        <li>${video.conName}</li>
    </c:forEach>
</ul>
</body>
</html>
