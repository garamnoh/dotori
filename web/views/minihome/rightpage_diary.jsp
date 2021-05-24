<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/minihome/mini_board.css">


<!-- <p>right-page-diary</p> -->
<!-- <div id="right_diary"> -->
<div id="diary_title">
    <div id="diary_title_date"></div>
</div>
<div id="diary_content">
    <div id="diary_date"></div>
    <div id="diary_inner"></div>
    <div id="diary_reply">
        댓글<input type="text" id="diary_input">
        <button>확인</button>
    </div>
</div>