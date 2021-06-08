<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import='java.util.HashMap, java.util.ArrayList, com.friend.model.vo.FeedDiary, com.friend.model.vo.Like' %>
    
<%
	HashMap<String, Object> newFeed = (HashMap<String, Object>)request.getAttribute("newFeed");
	ArrayList<FeedDiary> newFeedDiary = (ArrayList<FeedDiary>)(newFeed.get("feedDiary"));
	ArrayList<Integer> likeList = (ArrayList<Integer>)request.getAttribute("likeList");
	ArrayList<Like> count = (ArrayList<Like>)request.getAttribute("count");
%>

   	<% for(FeedDiary d : newFeedDiary){ %>
	    <div class="newFeed" id='newFeedDiary'>
	        <div class="user">
	        	<input type='hidden' value='<%=d.getWriter() %>'>
	            <img src="<%= request.getContextPath() %>/upload/MINIMI/<%=d.getProfilePath() %>" alt="" class="userImg">
	            <div class="userInfo">
	                <p class="userName"><%=d.getMemberName() %></p>
	                <% if(d.getFriendshipName()=="일촌"){ %>
	                	<p class="userTitle"><%=d.getFriendshipName() %></p>
	                <% } %>
	            </div>
	        </div>
	        <div class="contents">
	            <div class="title"><%=d.getContent() %></div>
	            <input type='hidden' value='<%=d.getDiaryNo() %>'>
	            <%
	            	boolean likeOrNot = false;
	            	for(Integer no: likeList){
	            		if(no == d.getDiaryNo()){
	            			likeOrNot = true;
	            			break;
	            		}
	            	}
	            %>
	            <div id="likeBox">
	            <% for(Like like : count){ %>
	            	<% if(d.getDiaryNo() == like.getDiaryNo()){ %>
	            		<span><%= like.getCount() %></span>
	            	<% break; } %>
	            <% } %>
	            <% if(likeOrNot == true) { %>
	            	<img src="<%= request.getContextPath() %>/images/like.png" alt="" class="like">
	            <% } else {%>
	            	<img src="<%= request.getContextPath() %>/images/unlike.png" alt="" class="like">
	            <% } %>
	            </div>
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
	        
	        const diaryNo = $(e.target).parent().prev().val();
	        $.ajax({
	        	url: '<%= request.getContextPath() %>/friends/like',
	        	data:{
	        		'diaryNo': diaryNo
	        	},
	        	success: (data)=>{
	        		const likeCount = data['likeCount'];
	        		$(e.target).parent().children('span').text(likeCount);
	        	}
	        });
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