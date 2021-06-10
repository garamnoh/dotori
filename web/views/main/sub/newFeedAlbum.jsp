<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import='java.util.HashMap, java.util.ArrayList, com.friend.model.vo.FeedAlbum, com.friend.model.vo.Like' %>
    
<%
	HashMap<String, Object> newFeed = (HashMap<String, Object>)request.getAttribute("newFeed");
	ArrayList<FeedAlbum> newFeedAlbum = (ArrayList<FeedAlbum>)(newFeed.get("feedAlbum"));
	ArrayList<Integer> likeListAlbum = (ArrayList<Integer>)request.getAttribute("likeListAlbum");
	ArrayList<Like> countAlbum = (ArrayList<Like>)request.getAttribute("countAlbum");
	String myId = (String)request.getAttribute("myId");
%>

   	<% for(FeedAlbum f : newFeedAlbum){ %>
        <% if(f.getFilepath()!=null){ %>
		    <div class="newFeed" id='newFeedAlbum'>
		        <div class="user">
		        	<input type='hidden' value='<%=f.getMemberId()%>'>
		            <img src="<%= request.getContextPath() %>/upload/MINIMI/<%=f.getProfilePath() %>" alt="" class="userImg">
		            <div class="userInfo">
		                <p class="userName"><%=f.getMemberName() %></p>
		                <% if(f.getTitle() != null){ %>
		                <p class="userTitle"><%=f.getTitle() %></p>
		                <% } %>
		            </div>
		        </div>
	        	<img src="<%= request.getContextPath() %>/upload/photo/<%=f.getFilepath() %>" alt="" class="image">
		        <div class="contents">
	   	            <%
		            	boolean likeOrNotA = false;
		            	for(Integer no: likeListAlbum){
		            		if(no == f.getImgNo()){
		            			likeOrNotA = true;
		            			break;
		            		}
		            	}
		            %>
	                <div id='likeBox'>
	                	<input type='hidden' value='<%=f.getImgNo() %>'>
	                	<% if(likeOrNotA == true) { %>
			            	<img src="<%= request.getContextPath() %>/images/like.png" alt="" class="like">
			            <% } else {%>
			            	<img src="<%= request.getContextPath() %>/images/unlike.png" alt="" class="like">
			            <% } %>
		   	            <% for(Like like : countAlbum){ %>
			            	<% if(f.getImgNo() == like.getNo()){ %>
			            		<span><%= like.getCount() %></span>
			            	<% break; } %>
			            <% } %>
		            </div>
		            <div class="title">
	   	                <span>#감성</span>
		                <span>#노을</span>
		                <span>#바다</span>
		                <p><%=f.getContent() %></p>
		            </div>
		        </div>
		    </div>
	    <% } %>
    <% } %>
    

    <script>
    	var myId = '<%=myId %>';
    
	    $('.like').on('click', (e)=>{
	        let unlike = '<%= request.getContextPath() %>/images/unlike.png'
	        let like = '<%= request.getContextPath() %>/images/like.png'
	        let src = $(e.target).attr('src');
	        let newSrc = src==unlike ? like : unlike;
	        $(e.target).attr('src', newSrc);
	        
	        const imgNo = $(e.target).prev().val();
	        $.ajax({
	        	url: '<%= request.getContextPath() %>/friends/likeAlbum',
	        	data:{
	        		'imgNo': imgNo
	        	},
	        	success: (data)=>{
	        		const likeCount = data['likeCount'];
	        		$(e.target).parent().children('span').text(likeCount);
	        	}
	        });
	    });
	    
	    $('#contentResultAlbum .userImg').on('click', (e)=>{
	    	const hostMemberId = $(e.target).prev().val();
	    	const hostMemberName = $(e.target).next().children('p.userName').text();
	    	
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
	    
	    $('#contentResultAlbum .userName').on('click', (e)=>{
	    	const hostMemberId = $(e.target).parent().prev().prev().val();
	    	const hostMemberName = $(e.target).text();
	    	
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