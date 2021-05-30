<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/minihome/mini_board.css">
<%@ page import="com.minihome.diary.model.vo.Diary, java.util.List" %>
<%
	List<Diary> list=(List<Diary>)request.getAttribute("list");	
%>
<div id="diary_content">
	<div id="diary_input_container">
		<div id="input_minimi_container">
			<img src="<%=request.getContextPath()%>/upload/MINIMI/mickey.jpg" alt="나의미니미">
		</div>
		<input type="text" id="diary_input">
		<button>확인</button>
	</div>
	
	<div id="diary_title">
		<div id="minimi_container">
			<img src="<%=request.getContextPath()%>/upload/MINIMI/mickey.jpg" alt="미니미">			
				<%for(Diary d : list) {%>
					<div id="diary_user">
							<%=d.getWriter() %><br>
							<%=d.getContent() %>
					</div>
				<%} %>
		</div>
	</div>
	<div id="pageBar">
    	<%=request.getAttribute("pageBar") %>	
    </div>
</div>
