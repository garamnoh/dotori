<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dotori.model.vo.Member"%>
<%
	Member loginMember=(Member)session.getAttribute("member");
%>
<!DOCTYPE html>
<html lang="kor">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/minihome.css">
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
        <!-- autoplay disabled -->
        <audio src="<%=request.getContextPath()%>/audio/Please Tell Me Why_프리스타일.mp3" autoplay muted></audio>
    </div>
    <script src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/minihome.jsp"></script>
</body>
</html>