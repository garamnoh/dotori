<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="diary_folder_box">
	<div id="diary_folder_title">Diary folder</div>
	<div id="diary_folder_list">
		<ul>		
			<li class="diary_folder_li">전체공개</li>
			<li class="diary_folder_li">일촌</li>
			<li class="diary_folder_li">비공개</li>
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
