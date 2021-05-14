<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String leftFrameSrc="";
	String rightFrameSrc="";
	String pageType=(String)request.getAttribute("pageType");
	if(pageType==null){
		leftFrameSrc=request.getContextPath()+"/views/sidebarMain.jsp";
		rightFrameSrc=request.getContextPath()+"/views/contentMain.jsp";
	}else{
		switch(pageType){
			case "home":leftFrameSrc=request.getContextPath()+"/views/sidebarMain.jsp";rightFrameSrc=request.getContextPath()+"/views/contentMain.jsp";break;
			case "friends":leftFrameSrc=request.getContextPath()+"/views/sidebarShop.jsp";rightFrameSrc=request.getContextPath()+"/views/contentShop.jsp";break;
			case "shop":leftFrameSrc=request.getContextPath()+"/views/sidebarFriends.jsp";rightFrameSrc=request.getContextPath()+"/views/contentFriends.jsp";break;
			case "minihome":leftFrameSrc="";rightFrameSrc=request.getContextPath()+"/views/minihome/minihome.jsp";break;
		}
	}
%>
<!DOCTYPE html>
<html lang="kor">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DOTORI</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/reset.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
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
                <iframe src="<%=leftFrameSrc%>" frameborder="0"></iframe>
            </aside>
            <section>
                <div class="content">
                    <iframe id="section" src="<%=rightFrameSrc%>" frameborder="0"></iframe>
                </div>
            </section>
        </div>
    </div>
    <script type="text/javascript" src='<%=request.getContextPath()%>/js/jquery-3.6.0.min.js'></script>
    <script type="text/javascript" src='<%=request.getContextPath()%>/js/main.jsp'></script>
</body>
</html>