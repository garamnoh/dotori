<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/minihome/mini_diary.css">
<%@ page import="com.minihome.diary.model.vo.Diary, java.util.List, com.member.model.vo.Member" %>
<%
	List<Diary> list=(List<Diary>)request.getAttribute("list");	
	Member loginMember=(Member)request.getAttribute("loginMember");	
	Member hostMember=(Member)request.getAttribute("hostMember");
	String pageBar=(String)request.getAttribute("pageBar");
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
					</div>
					<div id="diary_input_content_box">						
						<textarea class="diary_content_input" placeholder="다이어리를 작성해주세요."></textarea>
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
				</div>	
				<div id="diary_content_list">			
					<div id="diary_content_title">
						<div id="diary_writer_container">admin@gmail.com</div>				
					</div>
				<div id="diary_content_content" style="font-size: 13px;">
					환영합니다. 활발한 활동 응원합니다*^^*
				</div>
				</div>
			</div>
		</tr>
	<%} else{ %>
		<%for(Diary d : list) {%>			
			<div id="diary_content_box">
				<div id="minimi_container">
					<img src="<%=request.getContextPath()%>/upload/MINIMI/selly.png" alt="미니미">
					<div id="diary_content_list">
						<div id="diary_content_title">
							<div id="diary_writer_container"><%=d.getMemberName()%></div>									
							<div id="diary_date_container"><%=d.getPostDate() %></div>
							<div id="diary_btn_container">
								<%if(loginMember.getMemberId().equals(hostMember.getMemberId())
										|| loginMember.getMemberId().equals("admin@gmail.com")
										|| loginMember.getMemberId().equals(d.getWriter())) {%>
									<div class="diary_up_btn">수정</div>
									<div class="diary_del_btn">삭제</div>
								<%} %>
							</div>
						</div>							
						<div id="diary_content_content">
							<%=d.getContent() %>
						</div>	
						<div id="diary_content_update" style="display:none">
							<select class="diary_folder_up" name="diary_folder_up">
								<option value="전체공개" <%=d.getFolderNo()==1?"seleted":""%>>전체공개</option>
								<option value="일촌공개" <%=d.getFolderNo()==2?"seleted":""%>>일촌공개</option>
								<option value="비공개" <%=d.getFolderNo()==3?"seleted":""%>>비공개</option>
							</select>
							<textarea class="diary_content_up_input" placeholder="다이어리를 작성해주세요."><%=d.getContent() %></textarea>
							<input type="hidden" name="diary_no" value="<%=d.getDiaryNo()%>">
							<div id="diary_update_btn_box">
								<div class="diary_update_btn">저장</div>
								<div class="diary_cancel_btn">취소</div>
							</div>
						</div>						
					</div>
				</div>
			</div>			
		<%} 
	}%>	
				
  <div id="pageBar">
  	<%=pageBar %>	
  </div> 
	
</div>
<script src="<%=request.getContextPath() %>/js/minihome/rightpage_diary.js"></script>
