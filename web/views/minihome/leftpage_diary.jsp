<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.minihome.diary.model.vo.DiaryFolder, java.util.List, com.member.model.vo.Member" %>
<%
	List<DiaryFolder> list=(List<DiaryFolder>)request.getAttribute("list");
%>

<div id="diary_folder_box">
	<div id="diary_folder_title">Diary folder</div>
	<div id="diary_folder_list">		
		<ul>
			<%for(DiaryFolder df : list) {%>		
				<li><%=df.getFolderName() %></li>
			<%} %>
		</ul>
	</div>
	
</div>
<script>
	$(".diary_folder_li").click(e=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/diary/diaryFolder",
			type:"get",
			data:{
				"diary_folder_li":$(".diary_folder_li").text()
			},
			dataType:"html",
			success:data=>{
				$("left-page").html(data);
			}
		})
	});	
</script>
