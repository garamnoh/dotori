<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,com.member.model.vo.Member,com.minihome.model.vo.Minihome,com.shop.model.vo.Music,com.shop.model.vo.Skin"%>
<%
	Member loginMember=(Member)request.getAttribute("loginMember");
	Member hostMember=(Member)request.getAttribute("hostMember");
	Minihome minihome=(Minihome)request.getAttribute("minihome");
	List<Music> musicList=(List<Music>)request.getAttribute("musicList");
	Skin mySkin=(Skin)request.getAttribute("mySkin");
	System.out.println("jsp에서 호스트멤버 테스트 : "+hostMember);
%>   
<!DOCTYPE html>
<html lang="kor">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%=hostMember.getNickname()%>님의 미니홈피</title>
	<link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/images/favicon.ico"/>
	<%if(mySkin!=null) {%>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/minihome/<%=mySkin.getCssFilepath()%>">
	<%}else {%>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/minihome/default.css">
	<%} %>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/minihome/leftpage_home.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/minihome/rightpage_home.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/minihome/leftpage_album.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/minihome/rightpage_album.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/minihome/leftpage_diary.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/minihome/rightpage_diary.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/minihome/leftpage_jukebox.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/minihome/rightpage_jukebox.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/minihome/rightpage_updateAlbum.css">
</head>
<body>
    
<div class="container">
    <div class="cover">
        <div class="sheet">
            <div class="today">TODAY <span id="today"><%=minihome.getToday()%></span> | TOTAL <span id="total"><%=minihome.getTotal()%></span></div>
            <div class="miniTitle"><span id="miniTitle"><%=hostMember.getNickname()%></span>님의 미니홈피</div>
            <div id="left-page"></div>
            <div id="right-page"></div>
        </div>
    </div>
    <nav class="miniMenu">
        <ul>
            <li class="unselected">홈</li>
            <li class="unselected">사진첩</li>
            <li class="unselected">다이어리</li>
            <li class="unselected">쥬크박스</li>
        </ul>
    </nav>
    
    <div id="background-music-control-box">
	    <div id="musicInfo">
	        <%for(int i=0;i<musicList.size();i++) {%>
	            <span style="display:none;">
	                <%=musicList.get(i).getMusicTitle()%><br>
	                by <%=musicList.get(i).getSinger()%>
	            </span>
	            <input type="hidden" value="<%=i%>">
	        <%}%>
	    </div>
	    <div class="audio-controller-box">
	    	<img src="<%=request.getContextPath()%>/images/minihome/mute-icon.png" id="muteMusic" width="20px" onclick="fn_muteBackMusic();">
			<img src="<%=request.getContextPath()%>/images/minihome/play-icon.png" id="playMusic" width="30px" onclick="fn_pauseBackMusic();">
			<img src="<%=request.getContextPath()%>/images/minihome/pause-icon.png" id="pauseMusic" width="30px" onclick="fn_pauseBackMusic();">
			<img src="<%=request.getContextPath()%>/images/minihome/playNext-icon.png" id="playNextMusic" width="30px" onclick="fn_playNext();">
			<img src="<%=request.getContextPath()%>/images/minihome/playPrevious-icon.png" id="playPreviousMusic" width="30px" onclick="fn_playPrevious();">
			<img src="<%=request.getContextPath()%>/images/minihome/replay-icon.png" id="replayMusic" width="20px" onclick="fn_replay();">
		</div>
    </div>

    <div id="weatherBox">
    	<div>
    		<img src="" id="weather_icon" width="50px">
    	</div>
    	<div>
    		<p><span id="weather_main"></span> / <span id="temp"></span></p>
    		<p><span id="temp_max"></span> / <span id="temp_min"></span></p>
    	</div>
    </div>
    
    <div id="backgroundMusic">
    	<%for(int i=0;i<musicList.size();i++) {%>    
    		<audio src="<%=request.getContextPath()%>/audio/<%=musicList.get(i).getFilepath()%>"></audio>
		<%} %>
    </div>
</div>

	<input type="hidden" id="contextPath" value="<%=request.getContextPath()%>">
	<input type="hidden" id="loginMemberId" value="<%=loginMember.getMemberId()%>">
	<input type="hidden" id="hostMemberId" value="<%=hostMember.getMemberId()%>">

	<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/minihome/minihome.js"></script>
	
</body>
</html>