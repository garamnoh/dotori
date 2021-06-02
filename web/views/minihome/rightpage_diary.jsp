<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/minihome/mini_diary.css">
<%@ page import="com.minihome.diary.model.vo.Diary, java.util.List, com.member.model.vo.Member" %>
<%
	List<Diary> list=(List<Diary>)request.getAttribute("list");
	Member loginMember=(Member)request.getAttribute("loginMember");	
	Member hostMember=(Member)request.getAttribute("hostMember");
%>
<div id="diary_content">
	<form>
		<div id="diary_input_box">
			<div id="input_minimi_container">
				<img src="<%=request.getContextPath()%>/upload/MINIMI/brown.png" alt="나의미니미">
			</div>
			<div id="diary_input_container">
				<div id="diary_title_left">
					<div id="diary_input_title_box">
						<select class="diary_folder" name="diary_folder">
							<option value="전체공개" seleted>전체공개</option>
							<option value="일촌공개">일촌공개</option>
							<option value="비공개">비공개</option>
						</select>
						<!-- <input type="text" class="diary_title_input" name="diary_title_input"> -->
					</div>
					<div id="diary_input_content_box">						
						<textarea class="diary_content_input" placeholder="다이어리를 작성해주세요."></textarea>
					</div>
				</div>				
				<div id="diary_input_btn_box">
					<input type="submit" value="확인" id="diary_input_btn">
				</div>									
			</div>
			<input type="hidden" name="loginMemberId" value="<%=loginMember.getMemberId()%>">
			<input type="hidden" name="hostMemberId" value="<%=hostMember.getMemberId()%>">
		</div>
	</form>
	
	<%if(list.isEmpty()) {%>
		<tr>
			<div id="diary_content_box">
				<div id="minimi_container">
					<img src="<%=request.getContextPath()%>/upload/MINIMI/admin_dotori.png" alt="관리자이미지">				
					<div id="diary_user">							
						<%=hostMember.getMemberName()%>회원님 환영합니다*^^*<br> <b>-도토리매니저-</b>
					</div>
				</div>
			</div>
		</tr>
	<%} else{ %>
		<%for(Diary d : list) {%>			
				<div class="diary_content_box">
					<div id="minimi_container">
						<img src="<%=request.getContextPath()%>/upload/MINIMI/selly.png" alt="미니미">
						<div id="diary_content_list">
							<div id="diary_content_title">
								<div id="diary_writer_container"><%=d.getMemberName()%></div>									
								<div id="diary_date_container"><%=d.getPostDate() %></div>
								<div id="diary_btn_container">
									<%if(loginMember.getMemberId().equals(hostMember.getMemberId())
											|| loginMember.getMemberId().equals("admin@gmail.com")
											|| loginMember.getMemberId().equals(d.getWriter())) {%>
										<div class="diary_up_btn">수정</div>
										<div class="diary_del_btn">삭제</div>
									<%} %>
								</div>
							</div>							
							<div class="diary_content_content">
								<%=d.getContent() %>
							</div>	
							<div class="diary_content_update" style="display:none">
								<select class="diary_folder_up" name="diary_folder">
									<option value="전체공개" <%=d.getFolderNo()==1?"seleted":""%>>전체공개</option>
									<option value="일촌공개" <%=d.getFolderNo()==2?"seleted":""%>>일촌공개</option>
									<option value="비공개" <%=d.getFolderNo()==3?"seleted":""%>>비공개</option>
								</select>
								<textarea class="diary_content_up_input" placeholder="다이어리를 작성해주세요."><%=d.getContent() %></textarea>
								<div id="diary_update_btn_box">
									<div class="diary_update_btn">저장</div>
									<div class="diary_cancel_btn">취소</div>
								</div>
							</div>						
							<input type="hidden" name="diary_no" value="<%=d.getDiaryNo()%>">
						</div>
					</div>
				</div>			
		<%} 
	}%>	
				
  <div id="pageBar">
  	<%=request.getAttribute("pageBar") %>	
  </div>
  
	<script>
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
					console.log("test");
					console.log(data);
					$("#right-page").html(data);
				},
				error:(r,m,s)=>{
					console.log(r);
					console.log(m);
					console.log(s);
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
					console.log(data);
					$("#right-page").html(data);
				}
			}) 
		}
	});
  
	$(".diary_up_btn").click(e=>{
		$(".diary_content_update").show();
		$(".diary_content_content").hide();
		$(".diary_content_box").attr("height", "100px");///////////////이거 왜 안바뀔까
	});
	
	$(".diary_update_btn").click(e=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/diary/diaryUpdate",
			type:"post",
			data:{
				"diary_no":$("input[name='diary_no']").val(),
				"diary_folder":$("select[name='diary_folder']").val(),
				"diary_content_input":$(".diary_content_up_input").val(),
		  	},
			dataType:"html",
		 	success:data=>{
				console.log(data);
				$("#right-page").html(data);
		 	}
		})
	});	  
  
  	</script>
</div>
