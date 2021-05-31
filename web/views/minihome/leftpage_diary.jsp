<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="diary_folder_box">
	<ul>
		<li>diary folder</li>
		<li id="diary_a">전체공개</li>
		<li id="diary_b">일촌</li>
		<li id="diary_c">비공개</li>
	</ul>
</div>
<script>
	$("#diary_a").click(e=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/diary/diaryFolder",
			type:"get",
			data:{
				"diary_a":$("#diary_a").text()
			},
			dataType:"html",
			success:data=>{
				$("left-page").html(data);
			}
		})
	});	
</script>
