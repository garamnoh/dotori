$("#diary_input_btn").click(e=>{
	$.ajax({
		url:"<%=request.getContextPath()%>/diary/diaryWrite",
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
			url:"<%=request.getContextPath()%>/diary/diaryDelete",
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
  
$(".diary_up_btn").click(e=>{
	$(e.target).parent().parent().next().next().show();
	$(e.target).parent().parent().next().hide();	
	$(e.target).parent().parent().parent().parent().parent().css("height", "150px");
	$(e.target).parent().parent().parent().css("height", "145px");
});

$(".diary_cancel_btn").click(e=>{
	$(e.target).parent().parent().next().next().hide();
	$(e.target).parent().parent().next().show();	
});

$(".diary_update_btn").click(e=>{
	$.ajax({
		url:"<%=request.getContextPath()%>/diary/diaryUpdate",
		type:"post",
		data:{				
			/*"diary_no":$(e.target).parent().prev().val(),
			"diary_folder":$(e.target).parent().prev().prev().prev().child().val(),
			"diary_content_input":$(e.target).parent().prev().prev().val(),*/
			"diary_no":$("input[name='diary_no']"),
			"diary_folder":$("select[name='diary_folder_up']"),
			"diary_content_input":$(".diary_content_input").val()
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
  
