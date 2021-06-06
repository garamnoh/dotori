<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.friend.model.vo.Friend, java.util.ArrayList" %>
<%
	ArrayList<Friend> requestedList = (ArrayList<Friend>)request.getAttribute("requestedList");
	ArrayList<Friend> requestToList = (ArrayList<Friend>)request.getAttribute("requestToList");
%>

<p id='title'>신청현황</p>

<div id='contentScroll'>
	<div id='content1'>
		<div id='propose'>
			<p>일촌 신청받은 친구</p>
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
							<button id='minihome'>Mini</button>
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
			<p>일촌 신청한 친구</p>
			<% if(requestToList != null){ %>
				<% for(Friend f : requestToList){ %>
					<div id='detail'>
						<img src='<%=request.getContextPath() %>/upload/MINIMI/<%=f.getFollowerProfilePath() %>'>
						<div id='person'>
							<span><%=f.getFollowerProfileName() %></span>
							<span><%=f.getGender() %></span>
							<span><%=f.getBirth() %></span>
							<span><%=f.getAddress().substring(0, 2) %></span>
						</div>
						<div id='buttons'>
							<input type='hidden' value='<%=f.getFollowee() %>'>
							<button id='minihome'>Mini</button>
							<button id='cancel'>신청중</button>
						</div>
					</div>
				<% } %>
			<% } %>
		</div>
	</div>
</div>

<style>
	#title{
		width: 100%;
		margin-top: 30px;
		margin-bottom: 30px;
		padding-bottom: 5px;
		font-weight: bold;
		border-bottom: 1px solid #eee;
	}
	
	#contentScroll{
		width: 100%;
		height: 88%;
		overflow: scroll;
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
	
	#content1>#propose>#detail>#buttons>button#minihome,
	#content1>#propose>#detail>#buttons>button#accept,
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
	
	#content1>#propose>#detail>#buttons>button#reject{
		background-color: tomato;
		border: none;
		border-radius: 5px;
		width: 80px;
		height: 30px;
		margin-left: 10px;
		font-size: 12px;
		font-weight: 700;
	}
	
	#content1>#propose>#detail>#buttons>#delete,
	#content2>#friends>#detail>#buttons>#delete,
	#content2>#friends>#detail>#buttons>#cancel{
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
					$(e.target).parent().parent().css('border', '1px solid teal');
					setTimeout(()=>{
						$(e.target).parent().parent().slideUp(500);
					}, 1000);
				}
				else alert('일촌 수락 실패');
			}
		});
	});
	
	$('#propose #reject').on('click', (e)=>{
		const reject = $(e.target).parent().prev().children('span#followerId').text();
		
		if(confirm('일촌신청을 거절하시겠습니까?')){
			
			$.ajax({
				url: '<%=request.getContextPath() %>/friends/reject',
				data: {
					'reject': reject,
				},
				success: (data)=>{
					const result = data['result'];
					if(result > 0){
						$(e.target).parent().parent().css('border', '1px solid tomato');
						setTimeout(()=>{
							$(e.target).parent().parent().slideUp(500);
						}, 1000);
					}
					else alert('일촌 거부 실패');
				}
			});
		}
	});
	
	$('#friends #cancel').on('click', (e)=>{
		const cancel = $(e.target).prev().prev().val();
		console.log(cancel);
		if(confirm('취소?')){
		$.ajax({
			url: '<%=request.getContextPath() %>/friends/cancel',
			data: {
				'cancel': cancel,
			},
			success: (data)=>{
				const result = data['result'];
				if(result > 0){
					$(e.target).parent().parent().css('border', '1px solid tomato');
					setTimeout(()=>{
						$(e.target).parent().parent().slideUp(500);
					}, 1000);
				}
				else alert('신청 취소 실패');
			}
		}); }
	});
	
	$('#propose #minihome').on('click', (e)=>{
		const hostMemberId = $(e.target).parent().prev().children('span#followerId').text();

		console.log(hostMemberId);
		
		const minihomeWidth = 1200;
		const minihomeHeight = 756;
		const xAxis = (window.screen.width / 2) - (minihomeWidth / 2);
		const yAxis = (window.screen.height / 2) - (minihomeHeight / 2); 
		
		//const status="width=1200px,height=756px,left=50px,top=50px";
		const status="width=1200px,height=756px,left="+xAxis+",top="+yAxis;
		const url="<%=request.getContextPath()%>/page/minihome.do?hostMemberId="+hostMemberId;
		window.open(url,"",status);
	});
	
	$('#friends #minihome').on('click', (e)=>{
		const hostMemberId = $(e.target).parent().prev().children('span#followeeId').text();

		console.log(hostMemberId);
		
		const minihomeWidth = 1200;
		const minihomeHeight = 756;
		const xAxis = (window.screen.width / 2) - (minihomeWidth / 2);
		const yAxis = (window.screen.height / 2) - (minihomeHeight / 2); 
		
		//const status="width=1200px,height=756px,left=50px,top=50px";
		const status="width=1200px,height=756px,left="+xAxis+",top="+yAxis;
		const url="<%=request.getContextPath()%>/page/minihome.do?hostMemberId="+hostMemberId;
		window.open(url,"",status);
	});
	
	
</script>