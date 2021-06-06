<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import='java.util.HashMap, java.util.ArrayList, com.friend.model.vo.FeedAlbum' %>
    
<%
	HashMap<String, Object> newFeed = (HashMap<String, Object>)request.getAttribute("newFeed");
	ArrayList<FeedAlbum> newFeedAlbum = (ArrayList<FeedAlbum>)(newFeed.get("feedAlbum"));
%>

   	<% for(FeedAlbum f : newFeedAlbum){ %>
	    <div class="newFeed" id='newFeedAlbum'>
	        <div class="user">
	        	<input type='hidden' value='<%=f.getMemberId()%>'>
	            <img src="<%= request.getContextPath() %>/upload/MINIMI/<%=f.getProfilePath() %>" alt="" class="userImg">
	            <div class="userInfo">
	                <p class="userName"><%=f.getMemberName() %></p>
	                <p class="userTitle"><%=f.getTitle() %></p>
	            </div>
	        </div>
	        <% if(f.getFilepath()==null){ %>
	        	<img src="<%= request.getContextPath() %>/upload/photo/photo_path01.jpg" alt="" class="image">
	        <% } else { %>
	        	<img src="<%= request.getContextPath() %>/upload/photo/<%=f.getFilepath() %>" alt="" class="image">
	        <% } %>
	        <div class="contents">
	            <img src="<%= request.getContextPath() %>/images/unlike.png" alt="" class="like">
	            <%-- <img src="<%= request.getContextPath() %>/images/home_comment.png" alt="" class="comment"> --%>
	            <div class="title">
   	                <span>#감성</span>
	                <span>#노을</span>
	                <span>#바다</span>
	                <p><%=f.getContent() %></p>
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
	    });
	    
	    $('#contentResultAlbum .userImg').on('click', (e)=>{
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
	    
	    $('#contentResultAlbum .userName').on('click', (e)=>{
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