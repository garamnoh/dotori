<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import='com.friend.model.vo.SearchF, com.friend.model.vo.Friend, java.util.ArrayList' %>
<%
	ArrayList<SearchF> resultList = (ArrayList<SearchF>)request.getAttribute("resultList");
%>

<div id='tempBox'>
	<% if(resultList != null){ %>
	 	<% for(SearchF list : resultList){ %>
 			<% if(list.getFriendship().equals("일촌")) { %>
				<div id='detail'>
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
				<div id='detail'>
					<img src='<%=request.getContextPath() %>/upload/MINIMI/<%=list.getProfilePath() %>'>
					<div id='person'>
						<span><%=list.getMemberName() %></span>
						<span><%=list.getPhone() %></span>
						<span><%=list.getMemberId() %></span>
					</div>
					<div id='buttons'>
						<input type='hidden' name='hostMemberId' value='<%=list.getMemberId()%>'>
						<button id='accept'>수락</button>
						<button id='reject'>거부</button>
					</div>
				</div>
			<% } else { %>
				<div id='detail'>
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
	<% } else { %>
			<p style='width:100%;text-align:center;'></p>
	<% } %>
</div>



<%-- 			<% for(Friend cList : compareList) { %>
				<% if(!cList.getFollowee().contains(sList.getMemberId()) && !cList.getFollower().contains(sList.getMemberId())){ %>
					<div id='detail'>
						<img src='<%=request.getContextPath() %>/upload/MINIMI/<%=sList.getProfilePath() %>'>
						<div id='person'>
							<span><%=sList.getMemberName() %></span>
							<span><%=sList.getGender() %></span>
							<span><%=sList.getBirth() %></span>
							<span><%=sList.getAddress().substring(0, sList.getAddress().indexOf(" ")) %></span>
						</div>
						<div id='buttons'>
							<input type='hidden' name='hostMemberId' value='<%=sList.getMemberId()%>'>
							<button id='minihome'>Mini</button>
							<button id='requestTo'>일촌신청</button>
						</div>
					</div>
				<% } else if((cList.getFollowee().equals(sList.getMemberId()) && cList.getFriendshipName().equals("일촌"))) { %>
					<div id='detail'>
						<img src='<%=request.getContextPath() %>/upload/MINIMI/<%=sList.getProfilePath() %>'>
						<div id='person'>
							<span><%=sList.getMemberName() %></span>
							<span><%=sList.getGender() %></span>
							<span><%=sList.getBirth() %></span>
							<span><%=sList.getAddress().substring(0, sList.getAddress().indexOf(" ")) %></span>
						</div>
						<div id='buttons'>
							<input type='hidden' name='hostMemberId' value='<%=sList.getMemberId()%>'>
							<button id='minihome'>Mini</button>
							<button id='delete'>일촌끊기</button>
						</div>
					</div>
				<% } else if((cList.getFollowee().equals(sList.getMemberId()) && cList.getFriendshipName().equals("신청"))) { %>
					<div id='detail'>
						<img src='<%=request.getContextPath() %>/upload/MINIMI/<%=sList.getProfilePath() %>'>
						<div id='person'>
							<span><%=sList.getMemberName() %></span>
							<span><%=sList.getGender() %></span>
							<span><%=sList.getBirth() %></span>
							<span><%=sList.getAddress().substring(0, sList.getAddress().indexOf(" ")) %></span>
						</div>
						<div id='buttons'>
							<input type='hidden' name='hostMemberId' value='<%=sList.getMemberId()%>'>
							<button id='accept'>수락</button>
							<button id='reject'>거절</button>
						</div>
					</div>
				<% } %>
			<% } %> --%>




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
	
	#detail>#buttons>#delete{
		background-color: tomato;
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
						$(e.target).parent().parent().html("<p id='delP'>일촌이 삭제되었습니다</p><style>#delP{margin: 12px 0;width:100%;text-align:center;color:tomato;font-size:14px;}</style>");
						setTimeout(()=>{
							$('#delP').parent().animate({height:0,opacity:0}, 500);
							$('#delP').animate({opacity:0}, 500);
						}, 2000);
					}
					else alert('일촌 삭제 실패');
				}
			});
		}
	});
	
	$('#tempBox #accept').on('click', (e)=>{
		const follower = $(e.target).prev().val();
		
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