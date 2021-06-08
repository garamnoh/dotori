<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.minihome.diary.model.vo.DiaryFolder, java.util.List, com.member.model.vo.Member" %>
<%
	List<DiaryFolder> list=(List<DiaryFolder>)request.getAttribute("list");
	Member loginMember=(Member)request.getAttribute("loginMember");	
	Member hostMember=(Member)request.getAttribute("hostMember");
	String currentPage=(String)request.getAttribute("currentPage");
	if(currentPage==null) currentPage="전체공개";
%>

<div id="diary_folder_box">
	<div id="diary_folder_title">DIARY</div>
	<div id="diary_folder_list">		
		<%for(DiaryFolder df : list) {%>			
			<ul>
				<%if(currentPage.equals(df.getFolderName())) {%>
					<li style="text-decoration:underline;" class="folderLevel"><%=df.getFolderName()%> (<%=df.getDiaryCount() %>)</li>				
				<%} else{%>
					<li class="folderLevel"><%=df.getFolderName()%> (<%=df.getDiaryCount() %>)</li>	
				<%} %>
			</ul>
			<input type="hidden" name="diaryFolderLevel" value="<%=df.getFolderNo()%>">
			<input type="hidden" name="shareLevel" value="<%=df.getShareLevel() %>">
		<%} %>
	</div>
	
	<input type="hidden" name="loginMemberId" value="<%=loginMember.getMemberId()%>">
	<input type="hidden" name="hostMemberId" value="<%=hostMember.getMemberId()%>">
	
	<!-- 폴더 설정 버튼 -->
	<%if(loginMember.getMemberId().equals(hostMember.getMemberId())
		|| loginMember.getMemberId().equals("admin@gmail.com")) {%>
		<div id="diary_folder_setting_btn">DIARY SETTING</div>
	<%} %>	
</div>

<script src="<%=request.getContextPath()%>/js/minihome/leftpage_diary.js"></script>
