<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dotori.model.vo.Member"%>
<%
	Member loginMember=(Member)session.getAttribute("member");

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
			case "minihome":leftFrameSrc="";rightFrameSrc=request.getContextPath()+"/minihomeFrame.do";break;
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
        	<%if(!leftFrameSrc.equals("")) {%>
            <aside>
                <iframe src="<%=leftFrameSrc%>" frameborder="0"></iframe>
            </aside>
            <%}%>
            <section>
                <div class="content">
                    <iframe id="section" src="<%=rightFrameSrc%>" frameborder="0"></iframe>
                </div>
            </section>
        </div>
    </div>
    
    <!-- 임시로 만들어놨습니다. 고쳐주세요 -->
    <div id="loginMemberInfo">
    	<ul>회원정보(임시로 만들어놨습니다. 고쳐주세요)
    		<li>닉네임 : <%=loginMember.getNickname()%></li>
    		<li>도토리 : <%=loginMember.getDotori()%></li>
    		<li>아이디 : <%=loginMember.getMemberId()%></li>
    		<li>이름 : <%=loginMember.getMemberName()%></li>
    		<li>태어난 날 : <%=loginMember.getBirthDate()%></li>
    		<li>성별 : <%=loginMember.getGender()%></li>
    		<li>전화번호 : <%=loginMember.getPhone()%></li>
    		<li>주소 : <%=loginMember.getAddress()%></li>
    	</ul>
    <div>
    <style>
    	#loginMemberInfo{
    		border:5px solid pink;
    		position:absolute;
    		top:300px;
    		left:30px;
    	}
    </style>
    
    <script type="text/javascript" src='<%=request.getContextPath()%>/js/jquery-3.6.0.min.js'></script>
    <script type="text/javascript" src='<%=request.getContextPath()%>/js/main.jsp'></script>
</body>
</html>