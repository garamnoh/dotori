<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.friend.model.vo.Friend" %>    
<%
	ArrayList<Friend> friendsList = (ArrayList<Friend>)request.getAttribute("friendsList");
%>

<p id='title'>일촌관리</p>

<div id='content1'>
	<div id='administration'>
		<form action='' method='post' id='search'>
			<select name='searchType' id='searchType'>
				<option value='memberName' id='memberName'>이름</option>
				<option value='nickName' id='nickName'>별명</option>
			</select>
			<input type='text' name='searchKeyword' id='searchKeyword'>
		</form>
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
						<input type='hidden' name='hostMemberId' value='<%=f.getFollower() %>'>
						<button id='minihome'>Mini</button>
						<button id='delete'>일촌끊기</button>
					</div>
				</div>
			<% } %>
		<% } %>
	</div>
</div>


<style>
	#title{
		width: 100%;
		font-size: 16px;
		font-weight: 500;
		margin: 20px 0;
	}
	
	#content1{
		width: 100%;
	}
	
	#content1>#administration{
		width: 100%;
		display: flex;
		flex-direction: column;
	}
	
	#content1>#administration>form{
		width: 100%;
		margin-bottom: 20px;
		display: flex;
		border: none;
		border-radius: 2px;
		align-items: center;
	}
	
	#content1>#administration>form>select{
		width: 150px;
		height: 25px;
		border-radius: 2px;
	}
	
	#content1>#administration>form>input{
		flex-grow: 1;
		height: 20px;
		margin-left: 10px;
		text-align: center;
	}
	
	#content1>#administration>form>input:focus{
		outline: none;
	}
	
	#content1>#administration>#detail{
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
	
	#content1>#administration>#detail>img{
		width: 40px;
		border-radius: 50%
	}
	
	#content1>#administration>#detail>#person>span{
		font-size: 14px;
		font-weight: 300;
		margin: 0 50px;
	}
	
	#content1>#administration>#detail>#buttons>button{
		background-color: #eee;
		border: none;
		border-radius: 5px;
		width: 80px;
		height: 30px;
		margin-left: 10px;
		font-size: 12px;
		font-weight: 700;
	}
	
	#content1>#administration>#detail>#buttons>#delete{
		background-color: tomato;
	}
	
	#content1>#administration>#detail>#buttons>button:hover{
		opacity: .7;
	}
	
	#content1>#administration>#detail>#buttons>button:active{
		opacity: 1;
	}
</style>


<script>
	$('#administration button#minihome').on('click', (e)=>{
		const hostMemberId = $(e.target).prev().val();
		
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
	
	$('#administration button#delete').on('click', (e)=>{
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
						$(e.target).parent().parent().html("<p id='delP'>일촌이 삭제되었습니다</p><style>#delP{margin: 12px 0;width:100%;text-align:center;color:tomato;font-size:14px;}</style>");
						setTimeout(()=>{
							$('#delP').parent().animate({height:0,opacity:0}, 500);
							$('#delP').animate({opacity:0}, 500);
						}, 2000);
					}
					else alert('일촌 삭제 실패');
				},
				error: (r,s,m)=>{
					console.log(r);
					console.log(s);
				}
			});
		}
		
	});
</script>