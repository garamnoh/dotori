<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import='java.util.ArrayList, com.friend.model.vo.Log' %>
<%
	ArrayList<Log> myLog = (ArrayList<Log>)request.getAttribute("myLog");
	ArrayList<Log> friendsLog = (ArrayList<Log>)request.getAttribute("friendsLog");
%>

<div id='logContainer'>
	<p>내가 좋아하는 친구</p>
		<div id='myLogContainer'>
			<% if(myLog.size() != 0){ %>
				<% for(int i = 0; i < 5; i++){ %>
					<div id='userInfo'>
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
	
	#myLogContainer>#userInfo>div{
		margin: 10px 0;
		text-align: center;
		font-size: 14px;
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
	
	#friendsLogContainer>#userInfo>div{
		margin: 10px 0;
		text-align: center;
		font-size: 14px;
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