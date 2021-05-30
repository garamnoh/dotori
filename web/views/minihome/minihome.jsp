<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,com.member.model.vo.Member,com.minihome.model.vo.Minihome,com.shop.model.vo.Music"%>
<%
	Member loginMember=(Member)request.getAttribute("loginMember");
	Member hostMember=(Member)request.getAttribute("hostMember");
	Minihome minihome=(Minihome)request.getAttribute("minihome");
	List<Music> musicList=(List<Music>)request.getAttribute("musicList");
%>   
<!DOCTYPE html>
<html lang="kor">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%=hostMember.getNickname()%>님의 미니홈피</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/minihome/minihome.css">
	<link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/images/favicon.ico"/>
</head>
<body>
    
<div class="container">
    <div class="cover">
        <div class="sheet">
            <div class="today">TODAY <span id="today">121</span> | TOTAL <span id="total">123904</span></div>
            <div class="miniTitle"><%=loginMember.getNickname()%>님의 미니홈피</div>
            <div id="left-page"></div>
            <div id="right-page"></div>
        </div>
    </div>
    <nav class="miniMenu">
        <ul>
            <li>홈</li>
            <li>사진첩</li>
            <li>다이어리</li>
            <li>쥬크박스</li>
        </ul>
    </nav>
    <div id="musicInfo" style="position:absolute;top:50px;left:1000px;background-color:white;font-weight:bolder;font-size:12px">
        <%for(int i=0;i<musicList.size();i++) {%>
            <span style="display:none;"> 제목 : <%=musicList.get(i).getMusicTitle()%><br>가수 : <%=musicList.get(i).getSinger()%><br></span>
        <%}%>
    </div>
    <button onclick="fn_muteBackMusic();" style="position:absolute;top:100px;left:1000px;">음소거/해제</button>
    <button onclick="fn_pauseBackMusic();" style="position:absolute;top:150px;left:1000px;">일시정지/해제</button>
    <button onclick="fn_replay();" style="position:absolute;top:200px;left:1000px;">현재 곡 다시재생</button>
    <button onclick="fn_playNext();" style="position:absolute;top:250px;left:1000px;">다음 곡 재생</button>
    <button onclick="fn_playPrevious();" style="position:absolute;top:300px;left:1000px;">이전 곡 재생</button>
    
    <div id="backgroundMusic">
    	<%for(int i=0;i<musicList.size();i++) {%>    
    		<audio src="<%=request.getContextPath()%>/audio/<%=musicList.get(i).getFilepath()%>"></audio>
		<%} %>
    </div>
</div>

	<script src='<%=request.getContextPath()%>/js/jquery-3.6.0.min.js'></script>
	<script src="<%=request.getContextPath()%>/js/minihome/minihome.jsp"></script>
</body>
</html>