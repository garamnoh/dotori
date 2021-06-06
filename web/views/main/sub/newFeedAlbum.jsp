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

    
    <style>
    
		.newFeed{
		    width: 400px;
		    height: auto;
		    border: 1px solid #eee;
		    margin-bottom: 20px;
		}
		
		.newFeed>.user{
		    padding: 10px;
		    display: flex;
		}
		
		.newFeed>.user>.userImg{
		    width: 35px;
		    border-radius: 50%;
		    margin-right: 10px;
		}
		
		.newFeed>.user>.userInfo{
		    display: flex;
		    flex-direction: column;
		    justify-content: center;
		    color: rgb(94, 94, 94);
		    font-size: 15px;
		}
		
		.newFeed>.user>.userInfo>.userName{
			margin-bottom: 5px;
			font-weight: 500;
		}
		
		.newFeed>.image{
		    width: 400px;
		    height: auto;
		}
		
		.newFeed>.contents{
		    padding: 10px;
		}
		
		.newFeed>.contents>img{
		    width: 20px;
		}
		
		.newFeed>.contents>div>p{
		    font-size: 15px;
		    font-weight: 300;
		    line-height: 1.5;
		}
    
    </style>
    

    <script>
	    $('.contents>.like').on('click', (e)=>{
	        let unlike = '<%= request.getContextPath() %>/images/unlike.png'
	        let like = '<%= request.getContextPath() %>/images/like.png'
	        let src = $(e.target).attr('src');
	        let newSrc = src==unlike ? like : unlike;
	        $(e.target).attr('src', newSrc); 
	    });
    </script>