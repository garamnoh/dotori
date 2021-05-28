<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/minihome/mini_board.css">

<div id="diary_content">
	<div id="diary_input_container">
		<div id="input_minimi_container">
			<img src="<%=request.getContextPath()%>/images/MINIMI/mickey.jpg" alt="나의미니미">
		</div>
		<input type="text" id="diary_input">
	</div>
	
	<div id="diary_title">
		<div id="minimi_container">
			<img src="<%=request.getContextPath()%>/images/MINIMI/mickey.jpg" alt="미니미">			
			<div id="diary_user"></div>
		</div>
	</div>
</div>
