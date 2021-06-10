<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import='java.util.ArrayList, com.friend.model.vo.Log' %>
<%
	ArrayList<Log> myLog = (ArrayList<Log>)request.getAttribute("myLog");
	ArrayList<Log> friendsLog = (ArrayList<Log>)request.getAttribute("friendsLog");
	String myId = (String)request.getAttribute("myId");
%>

<div id='logContainer'>
	<p>내가 좋아하는 친구</p>
		<div id='myLogContainer'>
			<% if(myLog.size() != 0){ %>
				<% for(int i = 0; i < 5; i++){ %>
					<div id='userInfo'>
						<input type='hidden' value='<%=myLog.get(i).getMemberId() %>'>
						<img id='userImg' src='<%=request.getContextPath() %>/upload/MINIMI/<%=myLog.get(i).getProfilePath() %>'>
						<div id='userName'><%=myLog.get(i).getMemberName() %></div>
						<div id='gender'><%=myLog.get(i).getGender()	 %></div>
						<div id='count'><%=myLog.get(i).getVisitCount() %>회</div>
					</div>
					<% if(myLog.size()-1 == i) break; %>
				<% } %>
			<% } %>
		</div>
	<p id="pp">나를 좋아하는 친구</p>
	<div id='friendsLogContainer'>
		<% if(friendsLog.size() != 0){ %>
			<% for(int i = 0; i < 5; i++){ %>
				<div id='userInfo'>
					<input type='hidden' value='<%=friendsLog.get(i).getMemberId() %>'>
					<img id='userImg' src='<%=request.getContextPath() %>/upload/MINIMI/<%=friendsLog.get(i).getProfilePath() %>'>
					<div id='userName'><%=friendsLog.get(i).getMemberName() %></div>
					<div id='gender'><%=friendsLog.get(i).getGender()	 %></div>
					<div id='count'><%=friendsLog.get(i).getVisitCount() %>회</div>
				</div>
				<% if(friendsLog.size()-1 == i) break; %>
			<% } %>
		<% } %>
	</div>
</div>

<style>
	#myLogContainer{
		display: flex;
		overflow-x: scroll;
	}

	#myLogContainer>#userInfo{
		display: flex;
		flex-direction: column;
		width: auto;
		height: auto;
		margin: 10px 10px;
		border: 1px solid #eee;
		padding: 10px;
	}
	
	#myLogContainer>#userInfo>div#userName:hover,
	#myLogContainer>#userInfo>img:hover{
		opacity: .7;
	}
	
	#myLogContainer>#userInfo>div#userName:active,
	#myLogContainer>#userInfo>img:active{
		opacity: 1;
	}
	
	#myLogContainer>#userInfo>div{
		margin: 10px 0;
		text-align: center;
		font-size: 14px;
		cursor: default;
	}

	#myLogContainer>#userInfo>img{
		padding: 4px;
		width: 90px;
		height: 90px;
		border: 1px solid #eee;
		border-radius: 50%;
	}
	
	#myLogContainer>#userInfo:nth-child(3){
		border: 2px solid #eee;
	}
	
	#myLogContainer>#userInfo:nth-child(2){
		border: 3px solid #eee;
	}
	
	#myLogContainer>#userInfo:nth-child(2)>img{
		padding: 4px;
		width: 150px;
		height: 150px;
		border: 1px solid #eee;
		border-radius: 50%;
	}
	
	#myLogContainer>#userInfo:first-child{
		border: 3px solid gray;
	}
	
	#myLogContainer>#userInfo:first-child>img{
		padding: 4px;
		width: 190px;
		height: 190px;
		border: 1px solid #eee;
		border-radius: 50%;
	}
	
	
	#logContainer>#pp{
		margin-top: 20px;	
	}
	
	#friendsLogContainer{
		margin-top: 10px;
		display: flex;
		overflow-x: scroll;
	}

	#friendsLogContainer>#userInfo{
		display: flex;
		flex-direction: column;
		width: auto;
		height: auto;
		margin: 10px 10px;
		border: 1px solid #eee;
		padding: 10px;
	}
	
	#friendsLogContainer>#userInfo>div#userName:hover,
	#friendsLogContainer>#userInfo>img:hover{
		opacity: .7;
	}
	
	#friendsLogContainer>#userInfo>div#userName:active,
	#friendsLogContainer>#userInfo>img:active{
		opacity: 1;
	}
	
	#friendsLogContainer>#userInfo>div{
		margin: 10px 0;
		text-align: center;
		font-size: 14px;
		cursor: default;
	}

	#friendsLogContainer>#userInfo>img{
		padding: 4px;
		width: 90px;
		height: 90px;
		border: 1px solid #eee;
		border-radius: 50%;
	}
	
	#friendsLogContainer>#userInfo:nth-child(3){
		border: 2px solid #eee;
	}
	
	#friendsLogContainer>#userInfo:nth-child(2){
		border: 3px solid #eee;
	}
	
	#friendsLogContainer>#userInfo:nth-child(2)>img{
		padding: 4px;
		width: 150px;
		height: 150px;
		border: 1px solid #eee;
		border-radius: 50%;
	}
	
	#friendsLogContainer>#userInfo:first-child{
		border: 3px solid gray;
	}
	
	#friendsLogContainer>#userInfo:first-child>img{
		padding: 4px;
		width: 190px;
		height: 190px;
		border: 1px solid #eee;
		border-radius: 50%;
	}
</style>

<script>
	$('#myLogContainer #userImg').on('click', (e)=>{
		const hostMemberId = $(e.target).prev().val();
		const hostMemberName = $(e.target).next().text();
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
					$(e.target).next().next().next().text(data['accessCount']);
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
	$('#myLogContainer #userName').on('click', (e)=>{
		const hostMemberId = $(e.target).prev().prev().val();
		const hostMemberName = $(e.target).text();
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
					$(e.target).next().next().text(data['accessCount']);
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
	
	$('#friendsLogContainer #userImg').on('click', (e)=>{
		const hostMemberId = $(e.target).prev().val();
		const hostMemberName = $(e.target).next().text();
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
	$('#friendsLogContainer #userName').on('click', (e)=>{
		const hostMemberId = $(e.target).prev().prev().val();
		const hostMemberName = $(e.target).text();
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
</script>