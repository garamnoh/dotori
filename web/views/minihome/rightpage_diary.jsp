<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/minihome/mini_diary.css">
<%@ page import="com.minihome.diary.model.vo.Diary, java.util.List" %>
<%
	List<Diary> list=(List<Diary>)request.getAttribute("list");	
%>
<div id="diary_content">
	<form action="">
		<div id="diary_input_container">
			<div id="input_minimi_container">
				<img src="<%=request.getContextPath()%>/upload/MINIMI/mickey.jpg" alt="나의미니미">
			</div>
			<input type="text" id="diary_input">
			<button>확인</button>
		</div>
	</form>
	
	<%if(list.isEmpty()) {%>
		<tr>
			<div id="diary_title">
				<div id="minimi_container">
					<img src="<%=request.getContextPath()%>/upload/MINIMI/admin_dotori.png" alt="관리자이미지">				
						<p>환영	합니다. 도토리 회원님</p>
				</div>
			</div>
		</tr>
	<%} else{ %>
		<%for(Diary d : list) {%>
			<tr>
				<div id="diary_title">
					<div id="minimi_container">
						<img src="<%=request.getContextPath()%>/upload/MINIMI/mickey.jpg" alt="미니미">
							<div id="diary_user">
									<%=d.getWriter() %><br> 
										<!-- 해당 아이디의 이름 출력해주기 -->
									<%=d.getContent() %><br>
									<%=d.getPostDate() %>
							</div>
					</div>
				</div>
			</tr>
		<%} 
	}%>
	
				
	<div id="pageBar">
  	<%=request.getAttribute("pageBar") %>	
  </div>
</div>
