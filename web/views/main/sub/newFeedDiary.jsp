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
    </script>