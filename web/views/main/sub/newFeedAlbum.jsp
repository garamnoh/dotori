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
    </script>