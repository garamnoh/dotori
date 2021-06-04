<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.friend.model.vo.Friend, java.util.ArrayList" %>
<%
	ArrayList<Friend> requestedList = (ArrayList<Friend>)request.getAttribute("requestedList");
%>

<p id='title'>친구추천</p>

<div id='content1'>
	<div id='propose'>
		<p>일촌 신청한 친구</p>
		<% if(requestedList != null){ %>
			<% for(Friend f : requestedList){ %>
				<div id='detail'>
					<img src='<%=request.getContextPath() %>/upload/MINIMI/<%=f.getFollowerProfilePath() %>'>
					<div id='person'>
						<span><%=f.getFollowerProfileName() %></span>
						<span><%=f.getFollowerProfilePhone() %></span>
						<span id='followerId'><%=f.getFollower() %></span>
					</div>
					<div id='buttons'>
						<button id='accept'>수락</button>
						<button id='reject'>거절</button>
					</div>
				</div>
			<% } %>
		<% } %>
	</div>
</div>
<div id='content2'>
	<div id='friends'>
		<p>친구 추천</p>
		<div id='detail'>
			<img src='<%=request.getContextPath() %>/images/profile_img_default.png'>
			<div id='person'>
				<span>이름</span>
				<span>전화번호</span>
				<span>이메일</span>
			</div>
			<div id='buttons'>
				<button id='minihome'>수락</button>
				<button id='delete'>삭제</button>
			</div>
		</div>
	</div>
</div>

<style>
	#title{
		width: 100%;
		font-size: 16px;
		font-weight: 500;
		margin: 20px 0;
	}
	
	#content1,
	#content2{
		width: 100%;
	}
	
	#content1>#propose,
	#content2>#friends{
		width: 100%;
		display: flex;
		flex-direction: column;
	}
	
	#content1>#propose>p,
	#content2>#friends>p{
		margin-bottom: 20px;
	}
	
	#content2>#friends>p{
		margin-top: 30px;
	}
	
	#content1>#propose>#detail,
	#content2>#friends>#detail{
		width: auto;
		display: flex;
		align-items: center;
		justify-content: space-between;
	    border: #eee 1px solid;
	    /* backdrop-filter: saturate(80%) blur(10px); */
	    border-radius: 5px;
	    padding: 5px 10px;
	    margin-bottom: 10px;
	}
	
	#content1>#propose>#detail>img,
	#content2>#friends>#detail>img{
		width: 40px;
		border-radius: 50%
	}
	
	#content1>#propose>#detail>#person>span,
	#content2>#friends>#detail>#person>span{
		font-size: 14px;
		font-weight: 300;
		margin: 0 50px;
	}
	
	#content1>#propose>#detail>#buttons>button,
	#content2>#friends>#detail>#buttons>button{
		background-color: #eee;
		border: none;
		border-radius: 5px;
		width: 80px;
		height: 30px;
		margin-left: 10px;
		font-size: 12px;
		font-weight: 700;
	}
	
	#content1>#propose>#detail>#buttons>#delete,
	#content2>#friends>#detail>#buttons>#delete{
		background-color: tomato;
	}
	
	#content1>#propose>#detail>#buttons>button:hover,
	#content2>#friends>#detail>#buttons>button:hover{
		opacity: .7;
	}
	
	#content1>#propose>#detail>#buttons>button:active,
	#content2>#friends>#detail>#buttons>button:active{
		opacity: 1;
	}
	
</style>

<script>
	$('#propose #accept').on('click', (e)=>{
		const follower = $(e.target).parent().prev().children('span#followerId').text();
		
 		$.ajax({
			url: '<%=request.getContextPath() %>/friends/acceptFriend',
			data: {
				'follower': follower
			},
			success: data=>{
				const result = data['result'];
				console.log(result);
				if(result > 0){
					alert('일촌 수락 완료');
					$(e.target).parent().parent().html("<p id='delP'>일촌이 수락완료</p><style>#delP{margin: 12px 0;width:100%;text-align:center;color:teal;font-size:14px;}</style>");
					setTimeout(()=>{
						$('#delP').parent().animate({height:0,opacity:0}, 500);
						$('#delP').animate({opacity:0}, 500);
					}, 2000);
				}
				else alert('일촌 수락 실패');
			}
		});
	});
</script>
















