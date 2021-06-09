<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import='com.friend.model.vo.SearchF, com.friend.model.vo.Friend, java.util.ArrayList' %>
<%
	ArrayList<SearchF> resultList = (ArrayList<SearchF>)request.getAttribute("resultList");
	String myId = (String)request.getAttribute("myId");
%>

<div id='tempBox'>
	<% if(resultList != null){ %>
	 	<% for(SearchF list : resultList){ %>
 			<% if(list.getFriendship().equals("일촌")) { %>
				<div id='detail'>
					<input type='hidden' value='<%=list.getMemberName() %>'>
					<img src='<%=request.getContextPath() %>/upload/MINIMI/<%=list.getProfilePath() %>'>
					<div id='person'>
						<span><%=list.getMemberName() %></span>
						<span><%=list.getPhone() %></span>
						<span><%=list.getMemberId() %></span>
					</div>
					<div id='buttons'>
						<input type='hidden' name='hostMemberId' value='<%=list.getMemberId() %>'>
						<button id='minihome'>Mini</button>
						<button id='delete'>일촌끊기</button>
					</div>
				</div>
			<% } else if(list.getFriendship().equals("신청")) { %>
				<% if(list.getFollower().equals(list.getMemberId())){ %>
					<div id='detail'>
						<input type='hidden' value='<%=list.getMemberName() %>'>
						<img src='<%=request.getContextPath() %>/upload/MINIMI/<%=list.getProfilePath() %>'>
						<div id='person'>
							<span><%=list.getMemberName() %></span>
							<span><%=list.getPhone() %></span>
							<span><%=list.getMemberId() %></span>
						</div>
						<div id='buttons'>
							<input type='hidden' name='hostMemberId' value='<%=list.getMemberId()%>'>
							<button id='minihome'>Mini</button>
							<button id='accept'>수락</button>
							<button id='reject'>거부</button>
						</div>
					</div>
				<% } else { %>
					<div id='detail'>
						<input type='hidden' value='<%=list.getMemberName() %>'>
						<img src='<%=request.getContextPath() %>/upload/MINIMI/<%=list.getProfilePath() %>'>
						<div id='person'>
						<span><%=list.getMemberName() %></span>
						<span><%=list.getGender() %></span>
						<span><%=list.getBirth() %></span>
						<span><%=list.getAddress().substring(0, 2) %></span>
						</div>
						<div id='buttons'>
							<input type='hidden' name='hostMemberId' value='<%=list.getMemberId()%>'>
							<button id='minihome'>Mini</button>
							<button id='cancel'>신청중</button>
						</div>
					</div>
				<% } %>
			<% } else { %>
				<% if(list.getMemberId().equals(myId)){ %>
					<div id='detail'>
						<input type='hidden' value='<%=list.getMemberName() %>'>
						<img src='<%=request.getContextPath() %>/upload/MINIMI/<%=list.getProfilePath() %>'>
						<div id='person'>
							<span>내 계정</span>
						</div>
						<div id='buttons'>
							<input type='hidden' name='hostMemberId' value='<%=list.getMemberId()%>'>
							<button id='minihome'>Mini</button>
						</div>
					</div>
				<% } else { %>
					<div id='detail'>
						<input type='hidden' value='<%=list.getMemberName() %>'>
						<img src='<%=request.getContextPath() %>/upload/MINIMI/<%=list.getProfilePath() %>'>
						<div id='person'>
							<span><%=list.getMemberName() %></span>
							<span><%=list.getGender() %></span>
							<span><%=list.getBirth() %></span>
							<span><%=list.getAddress().substring(0, 2) %></span>
						</div>
						<div id='buttons'>
							<input type='hidden' name='hostMemberId' value='<%=list.getMemberId()%>'>
							<button id='minihome'>Mini</button>
							<button id='requestTo'>일촌신청</button>
						</div>
					</div>
				<% } %>
			<% } %>
		<% } %>
	<% } else { %>
			<p style='width:100%;text-align:center;'></p>
	<% } %>
</div>


<style>
	#detail{
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
	
	#detail>img{
		width: 40px;
		border-radius: 50%
	}
	
	#detail>#person>span{
		font-size: 14px;
		font-weight: 300;
		margin: 0 50px;
	}
	
	#detail>#buttons>button{
		background-color: #eee;
		border: none;
		border-radius: 5px;
		width: 80px;
		height: 30px;
		margin-left: 10px;
		font-size: 12px;
		font-weight: 700;
	}
	
	#detail>#buttons>#delete,
	#detail>#buttons>#reject,
	#detail>#buttons>#cancel{
		background-color: tomato;
	}
	
	#detail>#buttons>#requestTo{
		background-color: teal;
	}
	
	#detail>#buttons>button:hover{
		opacity: .7;
	}
	
	#detail>#buttons>button:active{
		opacity: 1;
	}
</style>

<script src='<%=request.getContextPath() %>/js/jquery-3.6.0.min.js'></script>
<script>
	$('#tempBox button#minihome').on('click', (e)=>{
		const hostMemberId = $(e.target).prev().val();
		const hostMemberName = $(e.target).parent().parent().children('input[type=hidden]').val();
		const myId = '<%=myId %>'
		
		console.log(hostMemberId);
		
		const minihomeWidth = 1200;
		const minihomeHeight = 756;
		const xAxis = (window.screen.width / 2) - (minihomeWidth / 2);
		const yAxis = (window.screen.height / 2) - (minihomeHeight / 2); 
		
		//const status="width=1200px,height=756px,left=50px,top=50px";
		const status="width=1200px,height=756px,left="+xAxis+",top="+yAxis;
		const url="<%=request.getContextPath()%>/page/minihome.do?hostMemberId="+hostMemberId;
		window.open(url,"",status);
		
		if(hostMemberId != myId){
			$.ajax({
				url: '<%=request.getContextPath() %>/friends/accessLog',
				data: {
					'friendId': hostMemberId
				},
				success: (data)=>{
					$('#accessAlert>span#accessName').text("["+hostMemberName+"]님의");
					$('#accessAlert>div>span').text(data['accessCount']);
					$('#accessAlert').slideDown();
					setTimeout(()=>{
						$('#accessAlert').slideUp();
					}, 3000);
				}
			});
		}
	});

	$('#tempBox button#delete').on('click', (e)=>{
		const follower = $(e.target).prev().prev().val();
		console.log(follower);
		
		if(confirm('일촌을 끊으시겠습니까?')){
			
			$.ajax({
				url: '<%=request.getContextPath() %>/friends/deleteFriend',
				data: {
					'follower': follower
				},
				success: data=>{
					const result = data['result'];
					console.log(result);
					if(result > 0){
						alert('일촌 삭제 성공');
						$(e.target).parent().parent().css('border', '1px solid red');
						setTimeout(()=>{
							$(e.target).parent().parent().slideUp(500);
						}, 1000);
					}
					else alert('일촌 삭제 실패');
				}
			});
		}
	});
	
	$('#tempBox #accept').on('click', (e)=>{
		const follower = $(e.target).prev().prev().val();
		
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
	
	$('#tempBox #requestTo').on('click', (e)=>{
		const requestTo = $(e.target).prev().prev().val();
		
		$.ajax({
			url: '<%=request.getContextPath() %>/friends/requestTo',
			data: {
				'requestTo': requestTo,
			},
			success: data=>{
				const result = data['result'];
				if(result > 0){
					$(e.target).parent().parent().css('border', '1px solid teal');
					$(e.target).css('background-color', 'tomato');
					$(e.target).text('신청중');
					$(e.target).attr('id', 'cancel');
					
					setTimeout(()=>{
						$('#find #searchBtn').trigger('click');
					}, 500);
				}
				else alert('일촌 신청 실패');
			}
		});
	});
	
	$('#tempBox #reject').on('click', (e)=>{
		const reject = $(e.target).prev().prev().prev().val();
		
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
	
	$('#tempBox #cancel').on('click', (e)=>{
		const cancel = $(e.target).prev().prev().val();
		
		$.ajax({
			url: '<%=request.getContextPath() %>/friends/cancel',
			data: {
				'cancel': cancel,
			},
			success: (data)=>{
				const result = data['result'];
				if(result > 0){
					$(e.target).parent().parent().css('border', '1px solid tomato');
					$(e.target).css('background-color', 'teal');
					$(e.target).text('일촌신청');
					$(e.target).attr('id', 'requestTo');
					
					setTimeout(()=>{
						$('#find #searchBtn').trigger('click');
					}, 500);
				}
				else alert('신청 취소 실패');
			}
		});
	});
</script>