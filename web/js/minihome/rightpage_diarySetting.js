$("#diaryFolderSaveBtn").click(e=>{	
	if($("#folderShareLevel").val()=="friends"){
		$.ajax({
			url:contextPath+"/diary/folderWrite",
			type:"post",
			data:{
				"folderShareLevel":$("#folderShareLevel").val(),
				"addFolderName":$("#addFolderName").val(),
				"shareMember":$("#shareMember").val(),
				"hostMemberId":$("input[name='hostMemberId']").val(),
				"loginMemberId":$("input[name='loginMemberId']").val()
			},
			dataType:"html",
			success:data=>{
				$("#left-page").html(data);	
			}
		});
	}else{
		$.ajax({
			url:contextPath+"/diary/folderWrite",
			type:"post",
			data:{
				"folderShareLevel":$("#folderShareLevel").val(),
				"addFolderName":$("#addFolderName").val(),
				"hostMemberId":$("input[name='hostMemberId']").val(),
				"loginMemberId":$("input[name='loginMemberId']").val()
			},
			dataType:"html",
			success:data=>{
				$("#left-page").html(data);
			}		
		});
	}	
});

$("#folderShareLevel").change(e=>{
	if($(e.target).val()=="FRIENDS"){
		$("#shareMember").attr('disabled', false);		
	}else{
		$("#shareMember").attr('disabled', true);
	}		
});
$(function(){
	$("#folderShareLevel").change();
});



$("#diary_del_folder_btn").click(e=>{
	$.ajax({
		url:contextPath+"/diary/folderDelete",
		type:"post",
		data:{			
			"delFolderNo":$("#folderName").val()
		},
		dataType:"html",
		success:data=>{
			$("#left-page").html(data);
		}		
	})
});