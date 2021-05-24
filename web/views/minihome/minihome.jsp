<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dotori.model.vo.Member"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/minihome/minihome.css">
    
<div class="container">
    <div class="cover">
        <div class="sheet">
            <div class="today">TODAY <span id="today">121</span> | TOTAL <span id="total">123904</span></div>
            <div class="miniTitle">님의 미니홈피</div>
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

<script src="<%=request.getContextPath()%>/js/minihome/minihome.jsp"></script>