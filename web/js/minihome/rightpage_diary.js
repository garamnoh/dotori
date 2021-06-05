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
	$(e.target).parents('#diary_content_list').children('#diary_comment_box').show();
	$(e.target).parents('#diary_content_box').css("height", "110px");
	$(e.target).parents('#diary_content_list').css("height", "105px");
	//$(e.target).parent().parent().next().next().show();//diary_comment_box보이게
	//$(e.target).parent().parent().parent().parent().css("height", "110px");//diary_content_box
	//$(e.target).parent().parent().parent().css("height", "105px");//diary_content_list
});

$(".diary_up_btn").click(e=>{
	//$(e.target).parent().parent().next().hide();//diary_content_content숨기게
	//$(e.target).parent().parent().next().next().next().next().show();//diary_content_update보이게
	//$(e.target).parent().parent().parent().parent().css("height", "150px");//diary_content_box
	//$(e.target).parent().parent().parent().css("height", "145px");//diary_content_list
	//$(e.target).parent().parent().next().next().next().hide();//diary_comment_box숨기기	
	$(e.target).parents('#diary_content_list').children('#diary_content_content').hide();
	$(e.target).parents('#diary_content_list').children('#diary_comment_box').hide();
	$(e.target).parents('#diary_content_list').children('.diary_comment_list_box').hide();//댓글출력창도닫기
	$(e.target).parents('#diary_content_list').children('#diary_co_comment_box').hide();//대댓글출력창닫기
	$(e.target).parents('#diary_content_list').children('#diary_content_update').show();
	$(e.target).parents('#diary_content_box').css("height", "150px");
	$(e.target).parents('#diary_content_list').css("height", "145px");
});

$(".diary_cancel_btn").click(e=>{
	//$(e.target).parent().parent().hide();////diary_content_update숨기게
	//$(e.target).parent().parent().prev().show();//diary_content_content보이게	
	//$(e.target).parent().parent().parent().parent().parent().css("height", "85px");//diary_content_box 다시 높이85
	//$(e.target).parent().parent().parent().css("height", "80px");//diary_content_list 높이 80
	$(e.target).parents('#diary_content_list').children('#diary_content_update').hide();
	$(e.target).parents('#diary_content_list').children('#diary_content_content').show();
	$(e.target).parents('#diary_content_box').css("height", "85px");
	$(e.target).parents('#diary_content_list').css("height", "80px");
});

$(".diary_comment_btn").click(e=>{
	$.ajax({
		url:contextPath+"/diary/diaryCommentWrite",
		type:"post",
		data:{
			"comment_level":1,
			"loginMemberId":$("input[name='loginMemberId']").val(),	
			"diary_comment":$(e.target).prev().val(),
			"diary_no":$(e.target).parent().prev().prev().val(),			
			"diary_comment_ref":0 //원댓글은 참고댓글번호가 없다
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
			"diary_no":$(e.target).parent().parent().prev().val(),
			"diary_folder":$(e.target).parent().prev().prev().val(),
			"diary_content_input":$(e.target).parent().prev().val()	
			//"diary_no":$("input[name='diary_no']").val(),
			//"diary_folder":$("select[name='diary_folder_up']").val(),
			//"diary_content_input":$(".diary_content_up_input").val()
		},
		dataType:"html",
		success:data=>{			
			$("#right-page").html(data);
	 	}
	})
});

$(".diary_co_com_btn").click(e=>{	
	//$(e.target).parent().parent().prev().hide();//diary_comment_box숨기기
	//$(e.target).parent().parent().next().show();//diary_co_comment_box보이기
	$(e.target).parents('#diary_content_list').children('#diary_comment_box').hide();
	$(e.target).parents('#diary_content_list').children('#diary_co_comment_box').show();
	
});

$(".diary_co_del_btn, .diary_reply_btn").click(e=>{
	if(confirm("정말 삭제하시겠습니까?")){
		$.ajax({
			url:contextPath+"/diary/commentDelete",
			type:"post",
			data:{
				"commentNo":$("input[name='diary_comment_ref']").val(),
				"commentWriter":$("input[name='loginMemberId']").val()		 	
			},
			dataType:"html",
			success:data=>{
				$("#right-page").html(data);
			}
		}) 
	}
});

$(".diary_co_comment_btn").click(e=>{
	$.ajax({
		url:contextPath+"/diary/diaryCommentWrite",
		type:"post",
		data:{
			"comment_level":2,
			"loginMemberId":$("input[name='loginMemberId']").val(),	
			"diary_comment":$(e.target).prev().val(),
			//"diary_no":$(e.target).parent().prev().prev().val(),
			//"diary_no":$("input[name='diary_com_no']").val(),
			//"diary_comment_ref":$("input[name='diary_comment_ref']").val()			
			"diary_no":$(e.target).parent().prev().prev().prev().prev().val(),
			"diary_comment_ref":$(e.target).parent().prev().child().val()
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
		console.log(cPage,numPerpage);		
		$.ajax({
			url:contextPath+"/diary/diaryFolder",
			type:"post",
			data:{
				//"hostMemberId":hostMemberId,
				"diaryFolderLevel":$(e.target).parent().prev().val(),
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
  
