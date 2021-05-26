<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dotori.model.vo.Member"%>
<!DOCTYPE html>
<html lang="kor">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DOTORI</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/reset.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/main/main.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700;900&family=Roboto:wght@400;500;700;900&display=swap">
    <link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/images/favicon.ico"/>
</head>
<body>
    <header>
        <div class="menuBox">
            <div class="logo">
                <img src="<%=request.getContextPath()%>/images/logo_main.png" alt="">
            </div>
            <div class="menu">
                <span class="title box">Home</span>
                <span class="title box">Friends</span>
                <span class="title box">Shop</span>
                <img class="title" id="miniHome" src="<%=request.getContextPath()%>/images/logo_minihome.png" alt="">
            </div>
        </div>
    </header>
        
    <div class="contents">
        <div class="contentsSub">
            <aside>
                <div id="sideMenuBox"></div>
            </aside>
            <section class="content">
                <div id="contentBox" style="border:1px solid green"></div>
            </section>
        </div>
    </div>
    
    <footer>
    
    </footer>
    
    <script type="text/javascript" src='<%=request.getContextPath()%>/js/jquery-3.6.0.min.js'></script>
    <script type="text/javascript" src='<%=request.getContextPath()%>/js/main/main.jsp'></script>
</body>
</html>