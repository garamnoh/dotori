<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.minihome.diary.model.vo.DiaryFolder, java.util.List, com.member.model.vo.Member" %>
<%
	List<DiaryFolder> list=(List<DiaryFolder>)request.getAttribute("list");
	Member loginMember=(Member)request.getAttribute("loginMember");	
	Member hostMember=(Member)request.getAttribute("hostMember");
	
%>

<div id="diary_folder_box">
	<div id="diary_folder_title">DIARY</div>
	<div id="diary_folder_list">		
		<%for(DiaryFolder df : list) {%>			
			<ul>
				<li class="folderLevel"><%=df.getFolderName()%> (<%=df.getDiaryCount() %>)</li>
			</ul>
			<input type="hidden" name="diaryFolderLevel" value="<%=df.getFolderNo()%>">
		<%} %>
	</div>
	<input type="hidden" name="loginMemberId" value="<%=loginMember.getMemberId()%>">
	<input type="hidden" name="hostMemberId" value="<%=hostMember.getMemberId()%>">
</div>
<script>		
	$(".folderLevel").click(e=>{		
		$(e.target).siblings().css("text-decoration", "none");
		$.ajax({
			url:"<%=request.getContextPath()%>/diary/diaryFolder",
			type:"post",
			data:{
				"diaryFolderLevel":$(e.target).parent().next().val(),
				"loginMemberId":$("input[name='loginMemberId']").val(),
				"hostMemberId":$("input[name='hostMemberId']").val()
			},
			dataType:"html",
			success:data=>{				
				$("#right-page").html(data);
			}
		});
		$(e.target).css("text-decoration", "underline");
			
	});	
	 $(document).ready(function(){
		$("ul").children().first().css("text-decoration", "underline");
	});
	/* $(".folderLevel").click(e=>{
		$(li).siblings().css("text-decoration", "none");		
		$(e.target).css("text-decoration", "underline");
	}); */
</script>
