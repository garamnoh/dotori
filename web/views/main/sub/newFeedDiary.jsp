<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import='java.util.HashMap, java.util.ArrayList, com.friend.model.vo.FeedDiary' %>
    
<%
	HashMap<String, Object> newFeed = (HashMap<String, Object>)request.getAttribute("newFeed");
	ArrayList<FeedDiary> newFeedDiary = (ArrayList<FeedDiary>)(newFeed.get("feedDiary"));
%>

   	<% for(FeedDiary d : newFeedDiary){ %>
	    <div class="newFeed" id='newFeedDiary'>
	        <div class="user">
	        	<input type='hidden' value='<%=d.getWriter() %>'>
	            <img src="<%= request.getContextPath() %>/upload/MINIMI/<%=d.getProfilePath() %>" alt="" class="userImg">
	            <div class="userInfo">
	                <p class="userName"><%=d.getMemberName() %></p>
	                <p class="userTitle">title</p>
	            </div>
	        </div>
	        <div class="contents">
	            <div class="title"><%=d.getContent() %></div>
	            <img src="<%= request.getContextPath() %>/images/unlike.png" alt="" class="like">
	        </div>
	    </div>
    <% } %>

    <script>
	    $('.like').on('click', (e)=>{
	        let unlike = '<%= request.getContextPath() %>/images/unlike.png'
	        let like = '<%= request.getContextPath() %>/images/like.png'
	        let src = $(e.target).attr('src');
	        let newSrc = src==unlike ? like : unlike;
	        $(e.target).attr('src', newSrc); 
	    });
	    
	    $('#contentResultDiary .userImg').on('click', (e)=>{
	    	const hostMemberId = $(e.target).prev().val();
	    	
			const minihomeWidth = 1200;
			const minihomeHeight = 756;
			const xAxis = (window.screen.width / 2) - (minihomeWidth / 2);
			const yAxis = (window.screen.height / 2) - (minihomeHeight / 2); 
    		
			//const status="width=1200px,height=756px,left=50px,top=50px";
			const status="width=1200px,height=756px,left="+xAxis+",top="+yAxis;
    		const url="<%=request.getContextPath()%>/page/minihome.do?hostMemberId="+hostMemberId;
    		window.open(url,"",status);
	    });
	    
	    $('#contentResultDiary .userName').on('click', (e)=>{
	    	const hostMemberId = $(e.target).parent().prev().prev().val();
	    	
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