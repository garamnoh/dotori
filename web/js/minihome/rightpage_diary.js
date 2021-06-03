$("#diary_input_btn").click(e=>{
	$.ajax({
		url:contextPath+"/diary/diaryWrite",
		type:"post",
		data:{			  
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
  
$(".diary_del_btn").click(e => {
	if(confirm("정말 삭제하시겠습니까?")){
		$.ajax({
			url:contextPath+"/diary/diaryDelete",
			type:"post",
			data:{
				"diary_no":$("input[name='diary_no']").val(),
				"loginMemberId":$("input[name='loginMemberId']").val()		 	
			},
			dataType:"html",
			success:data=>{
				$("#right-page").html(data);
			}
		}) 
	}
});

$(".diary_com_btn").click(e=>{
	$(e.target).parent().parent().next().next().show();
	$(e.target).parent().parent().parent().parent().parent().css("height", "110px");//diary_content_box
	$(e.target).parent().parent().parent().css("height", "105px");//diary_content_list
});

$(".diary_up_btn").click(e=>{
	$(e.target).parent().parent().next().next().show();//diary_content_update보이게
	$(e.target).parent().parent().next().hide();//diary_content_content숨기게	
	$(e.target).parent().parent().parent().parent().parent().css("height", "150px");//diary_content_box
	$(e.target).parent().parent().parent().css("height", "145px");//diary_content_list
});

$(".diary_cancel_btn").click(e=>{
	$(e.target).parent().parent().hide();////diary_content_update숨기게
	$(e.target).parent().parent().prev().show();//diary_content_content보이게	
	$(e.target).parent().parent().parent().parent().parent().css("height", "85px");//diary_content_box 다시 높이85
	$(e.target).parent().parent().parent().css("height", "80px");//diary_content_list 높이 80
});

$(".diary_comment_btn").click(e=>{
	$.ajax({
		url:contextPath+"/diary/diaryCommentWrite",
		type:"post",
		data:{
			"comment_level":1,
			"loginMemberId":$("input[name='loginMemberId']").val(),	
			"diary_comment":$(e.target).prev().prev().val(),
			"diary_no":$(e.target).prev().val(),
			"diary_comment_ref":0
		},
		dataType:"html",
		success:data=>{
			$("#right-page").html(data);
		}
	})
});

$(".diary_update_btn").click(e=>{
	$.ajax({
		url:contextPath+"/diary/diaryUpdate",
		type:"post",
		data:{				
			"diary_no":$(e.target).parent().prev().val(),			
			"diary_folder":$(e.target).parent().prev().prev().prev().val(),
			"diary_content_input":$(e.target).parent().prev().prev().val()
			/*"diary_no":$("input[name='diary_no']"),
			"diary_folder":$("select[name='diary_folder_up']"),
			"diary_content_input":$(".diary_content_input").val()*/
		},
		dataType:"html",
		success:data=>{			
			$("#right-page").html(data);
	 	}
	})
});	

document.querySelectorAll("#pageBar>a").forEach((v, i)=>{
	$(v).click((e)=>{		
		let strArr=v.id.split("/");
		let cPage=strArr[0];
		let numPerpage=strArr[1];		
		$.ajax({
			url:contextPath+"/page/minihomeRightPageToDiary.do",
			type:"post",
			data:{
				//"hostMemberId":hostMemberId,
				"cPage":cPage,
				"numPerpage":numPerpage				
			},
			dataType:"html",
			success:data=>{
				$("#right-page").html(data);
			}
		});
	});
});
  
