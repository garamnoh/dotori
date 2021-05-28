<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,com.member.model.vo.Member,com.minihome.model.vo.Minihome"%>
<%
	Member loginMember=(Member)session.getAttribute("loginMember");
	Member hostMember=(Member)request.getAttribute("hostMember");
	Minihome minihome=(Minihome)request.getAttribute("minihome");
	/* List<MinimiItem> minimiItemList=(List<MinimiItem>)request.getAttribute("minimiItemList");
	List<SkinItem> skinItemList=(List<SkinItem>)request.getAttribute("skinItemList");
	List<Music> musicList=(List<Music>)request.getAttribute("musicList");
	List<Photo> photoList=(List<Photo>)request.getAttribute("photoList");
	List<Board> boardList=(List<Board>)request.getAttribute("boardList");
	List<BoardComment> boardCommentList=(List<BoardComment>)request.getAttribute("boardCommentList");
	List<Diary> diaryList=(List<Diary>)request.getAttribute("diaryList"); */
%>   
<!DOCTYPE html>
<html lang="kor">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%=loginMember.getNickname()%>님의 미니홈피</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/minihome/minihome.css">
	<link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/images/favicon.ico"/>
</head>
<body>
    
<div class="container">
    <div class="cover">
        <div class="sheet">
            <div class="today">TODAY <span id="today">121</span> | TOTAL <span id="total">123904</span></div>
            <div class="miniTitle"><%=loginMember.getNickname()%>님의 미니홈피</div>
            <div class="left-page"><iframe src="<%=request.getContextPath()%>/views/minihome/leftpage_home.jsp" class="left-page-frame"></iframe></div>
            <div class="right-page"><iframe src="<%=request.getContextPath()%>/views/minihome/rightpage_home.jsp" class="right-page-frame"></iframe></div>
        </div>
    </div>
    <nav class="miniMenu">
        <ul>
            <li>홈</li>
            <li>다이어리</li>
            <li>쥬크박스</li>
            <li>사진첩</li>
            <li>방명록</li>
        </ul>
    </nav>
    
    <button onclick="fn_stopBackMusic();">배경음악 멈추기</button>
    
    <audio src="<%=request.getContextPath()%>/audio/Please Tell Me Why_프리스타일.mp3" id="backMusic" autoplay></audio>
</div>

	<script src='<%=request.getContextPath()%>/js/jquery-3.6.0.min.js'></script>
	<script src="<%=request.getContextPath()%>/js/minihome/minihome.js"></script>
</body>
</html>