<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>sidebar_home</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/reset.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/sideMain.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700;900&family=Roboto:wght@400;500;700;900&display=swap">
</head>
<body>
    <div class="profile">
        <img src="<%=request.getContextPath()%>/images/profile.png" alt="">
    </div>
    <div class="info">
        <hr>
        <div id="userName">UserName</div>
        <div id="userEmail">User@dotori.com</div>
        <hr>
        <div id="today">Today : 133</div>
        <div id="total">Total : 323423</div>
        <hr>
        <div id="board">New Feed : 10</div>
        <div id="request">일촌 신청­ : 5</div>
    </div>
</body>
</html>