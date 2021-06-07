<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.minihome.diary.model.vo.DiaryFolder, java.util.List, com.member.model.vo.Member" %>
<%
	List<DiaryFolder> list=(List<DiaryFolder>)request.getAttribute("list");
	Member loginMember=(Member)request.getAttribute("loginMember");	
	Member hostMember=(Member)request.getAttribute("hostMember");
	//String currentPage=(String)request.getAttribute("currentPage");	
%>

<div id="diary_folder_box">
	<div id="diary_folder_title">DIARY</div>
	<div id="diary_folder_list">		
		<%for(DiaryFolder df : list) {%>			
			<ul>
				<li class="folderLevel"><%=df.getFolderName()%> (<%=df.getDiaryCount() %>)</li>
			</ul>
			<input type="hidden" name="diaryFolderLevel" value="<%=df.getFolderNo()%>">
			<input type="hidden" name="shareLevel" value="<%=df.getShareLevel() %>">
		<%} %>
	</div>
	
	<input type="hidden" name="loginMemberId" value="<%=loginMember.getMemberId()%>">
	<input type="hidden" name="hostMemberId" value="<%=hostMember.getMemberId()%>">
	
	<div id="diary_folder_title">DIARY SETTING</div>
	<div id="diary_folder_setting">
		<input type="text" id="diary_folder_name" placeholder="추가할 폴더명 입력">
		<div id="diary_add_folder_btn">폴더추가</div>
		
		<select id="folderName" name="folderName">
			<%for(DiaryFolder df : list) {%>	
				<option value=<%=df.getFolderName()%>><%=df.getFolderName()%></option>
			<%} %>
		</select>
		<div id="diary_del_folder_btn">폴더삭제</div>
	</div>	
</div>

<script src="<%=request.getContextPath()%>/js/minihome/leftpage_diary.js"></script>
