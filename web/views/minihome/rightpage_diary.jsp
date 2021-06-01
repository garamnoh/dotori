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
	<form>
		<div id="diary_input_box">
			<div id="input_minimi_container">
				<img src="<%=request.getContextPath()%>/upload/MINIMI/brown.png" alt="나의미니미">
			</div>
			<div id="diary_input_container">
				<div id="diary_title_left">
					<div id="diary_input_title_box">
						<select class="diary_folder" name="diary_folder">
							<option value="전체공개" seleted>전체공개</option>
							<option value="일촌공개">일촌공개</option>
							<option value="비공개">비공개</option>
						</select>
						<input type="text" class="diary_title_input" name="diary_title_input">
					</div>
					<div id="diary_input_content_box">
						<input type="text" class="diary_content_input" name="diary_content_input">
					</div>
				</div>				
				<div id="diary_input_btn_box">
					<input type="submit" value="확인" id="diary_input_btn">
				</div>						
			</div>
			<input type="hidden" name="loginMemberId" value="<%=loginMember.getMemberId()%>">
			<input type="hidden" name="hostMemberId" value="<%=hostMember.getMemberId()%>">
		</div>
	</form>
	
	<%if(list.isEmpty()) {%>
		<tr>
			<div id="diary_content_box">
				<div id="minimi_container">
					<img src="<%=request.getContextPath()%>/upload/MINIMI/admin_dotori.png" alt="관리자이미지">				
					<div id="diary_user">							
						<p>환영합니다. <%=hostMember.getMemberId()%>회원님 <br> <b>-도토리매니저-</b></p>
					</div>
				</div>
			</div>
		</tr>
	<%} else{ %>
		<%for(Diary d : list) {%>
			<tr>
				<div id="diary_content_box">
					<div id="minimi_container">
						<img src="<%=request.getContextPath()%>/upload/MINIMI/selly.png" alt="미니미">
						<div id="diary_content_list">
							<div id="diary_content_title">
								<div id="diary_writer_container"><%=d.getMemberName()%></div>									
								<div id="diary_date_container"><%=d.getPostDate() %></div>
								<div id="diary_btn_container">
									<p id="diary_up_btn">수정</p>
									<p id="diary_del_btn">삭제</p>
								</div>
							</div>
							<div id="diary_content_content"><%=d.getContent() %></div>							
						</div>
					</div>
				</div>
			</tr>
		<%} 
	}%>	
				
  <div id="pageBar">
  	<%=request.getAttribute("pageBar") %>	
  </div>
  
  <script>
  $("#diary_input_btn").click(e=>{
	  $.ajax({
		  url:"<%=request.getContextPath()%>/diary/diaryWrite",
		  type:"get",
		  data:{
			  "diary_title_input":$(".diary_title_input").val(),
			  "diary_folder":$("select[name='diary_folder']").val(),
			  "diary_content_input":$(".diary_content_input").val(),
			  "loginMemberId":$("input[name='loginMemberId']").val(),
			  "hostMemberId":$("input[name='hostMemberId']").val()
		  },
		  dataType:"html",
		  success:data=>{
			  $("#right-page").html(data);
		  }
	  })
  });
  </script>
</div>
