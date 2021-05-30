<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/minihome/mini_diary.css">
<%@ page import="com.minihome.diary.model.vo.Diary, java.util.List, com.member.model.vo.Member" %>
<%
	List<Diary> list=(List<Diary>)request.getAttribute("list");	
	Member loginMember=(Member)request.getAttribute("loginMember");	
	Member hostMember=(Member)request.getAttribute("hostMember");
%>
<div id="diary_content">
	<form action="<%=request.getContextPath()%>/diary/diaryWrite?hostMemberId="+>
		<div id="diary_input_box">
			<div id="input_minimi_container">
				<img src="<%=request.getContextPath()%>/upload/MINIMI/mickey.jpg" alt="나의미니미">
			</div>
			<div id="diary_input_container">
				<input type="text" class="diary_title_input">
				<input type="text" class="diary_content_input">
				<input type="submit" value="확인">		
			</div>
			<input type="hidden" id="loginMemberId" value="<%=loginMember.getMemberId()%>">
			<input type="hidden" id="hostMemberId" value="<%=hostMember.getMemberId()%>">
		</div>
	</form>
	
	<%if(list.isEmpty()) {%>
		<tr>
			<div id="diary_content_box">
				<div id="minimi_container">
					<img src="<%=request.getContextPath()%>/upload/MINIMI/admin_dotori.png" alt="관리자이미지">				
						<div id="diary_user">							
							<p>환영	합니다. <%=hostMember.getMemberId()%>회원님 <br> <b>-도토리매니저-</b></p>
						</div>
				</div>
			</div>
		</tr>
	<%} else{ %>
		<%for(Diary d : list) {%>
			<tr>
				<div id="diary_content_box">
					<div id="minimi_container">
						<img src="<%=request.getContextPath()%>/upload/MINIMI/mickey.jpg" alt="미니미">
							<div id="diary_content_list">
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
