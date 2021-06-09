$(".folderLevel").click(e=>{	
	const current=e.target.innerText.substring(0,e.target.innerText.indexOf("("));
	$(e.target).css("text-decoration", "underline");
	$.ajax({
		url:contextPath+"/diary/diaryFolder",
		type:"post",
		data:{
			"folderNo":$(e.target).parent().next().val(),
			"loginMemberId":$("input[name='loginMemberId']").val(),
			"hostMemberId":$("input[name='hostMemberId']").val(),			
			"shareLevel":$(e.target).parent().next().next().val()				
		},
		dataType:"html",
		success:data=>{				
			$("#right-page").html(data);
		}
	});	
	$.ajax({
		url:contextPath+"/page/minihomeLeftPageToDiary.do",
		type:"post",
		data:{
			"loginMemberId":$("input[name='loginMemberId']").val(),
			"hostMemberId":$("input[name='hostMemberId']").val(),
			"currentPage":current							
		},
		dataType:"html",
		success:data=>{				
			$("#left-page").html(data);
		}
	});
	$(e.target).css("text-decoration", "underline");
});

$("#diary_folder_setting_btn").click(e=>{
	$.ajax({
		url:contextPath+"/diary/FolderSetting",
		type:"post",
		data:{
			"loginMemberId":$("input[name='loginMemberId']").val(),
			"hostMemberId":$("input[name='hostMemberId']").val()
		},
		dataType:"html",
		success:data=>{				
			$("#right-page").html(data);
		}
	})
});