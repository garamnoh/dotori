<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.friend.model.vo.Friend" %>   
<%
	ArrayList<Friend> friendsList = (ArrayList<Friend>)request.getAttribute("friendsList");
%>

<% if(friendsList != null){ %>
	<% for(Friend f: friendsList){ %>
		<div id='detail'>
			<img src='<%=request.getContextPath() %>/upload/MINIMI/<%=f.getFollowerProfilePath() %>'>
			<div id='person'>
				<span><%=f.getFollowerProfileName() %></span>
				<span><%=f.getFollowerProfilePhone() %></span>
				<span><%=f.getFollower() %></span>
			</div>
			<div id='buttons'>
				<input type='hidden' value='<%=f.getFollowerProfileName() %>'>
				<input type='hidden' name='hostMemberId' value='<%=f.getFollower() %>'>
				<button id='minihome'>Mini</button>
				<button id='delete'>일촌끊기</button>
			</div>
		</div>
	<% } %>
<% } %>


<style>
	#content1>#administration #detail{
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
	
	#content1>#administration #detail>img{
		width: 40px;
		border-radius: 50%
	}
	
	#content1>#administration #detail>#person>span{
		font-size: 14px;
		font-weight: 300;
		margin: 0 50px;
	}
	
	#content1>#administration #detail>#buttons>button{
		background-color: #eee;
		border: none;
		border-radius: 5px;
		width: 80px;
		height: 30px;
		margin-left: 10px;
		font-size: 12px;
		font-weight: 700;
	}
	
	#content1>#administration #detail>#buttons>#delete{
		background-color: tomato;
	}
	
	#content1>#administration #detail>#buttons>button:hover{
		opacity: .7;
	}
	
	#content1>#administration #detail>#buttons>button:active{
		opacity: 1;
	}
</style>


<script>
	$('#searchResult button#minihome').on('click', (e)=>{
		const hostMemberId = $(e.target).prev().val();
		const hostMemberName = $(e.target).prev().prev().val();
		
		console.log(hostMemberId);
		
		const minihomeWidth = 1200;
		const minihomeHeight = 756;
		const xAxis = (window.screen.width / 2) - (minihomeWidth / 2);
		const yAxis = (window.screen.height / 2) - (minihomeHeight / 2); 
		
		//const status="width=1200px,height=756px,left=50px,top=50px";
		const status="width=1200px,height=756px,left="+xAxis+",top="+yAxis;
		const url="<%=request.getContextPath()%>/page/minihome.do?hostMemberId="+hostMemberId;
		window.open(url,"",status);
		
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
	});
	
	$('#searchResult button#delete').on('click', (e)=>{
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
</script>