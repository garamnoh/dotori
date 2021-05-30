<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div class="content">
	    <div class="newFeed">
	        <div class="user">
	            <img src="<%= request.getContextPath() %>/images/profile_img_default.png" alt="" class="userImg">
	            <div class="userInfo">
	                <p class="userName">user01</p>
	                <p class="userTitle">user01_official</p>
	            </div>
	        </div>
	        <img src="<%= request.getContextPath() %>/images/home_feed1.png" alt="" class="image">
	        <div class="contents">
	            <img src="<%= request.getContextPath() %>/images/home_unlike.png" alt="" class="like">
	            <img src="<%= request.getContextPath() %>/images/home_comment.png" alt="" class="comment">
	            <p class="title">
	                <span>#감성</span>
	                <span>#노을</span>
	                <span>#바다</span>
	                <p>text content text content text content</p>
	            </p>
	        </div>
	    </div>
	    <div class="newFeed">
	        <div class="user">
	            <img src="<%= request.getContextPath() %>/images/profile_img_default.png" alt="" class="userImg">
	            <div class="userInfo">
	                <p class="userName">user01</p>
	                <p class="userTitle">user01_official</p>
	            </div>
	        </div>
	        <img src="<%= request.getContextPath() %>/images/home_feed2.png" alt="" class="image">
	        <div class="contents">
	            <img src="<%= request.getContextPath() %>/images/home_unlike.png" alt="" class="like">
	            <img src="<%= request.getContextPath() %>/images/home_comment.png" alt="" class="comment">
	            <p class="title">
	                <span>#감성</span>
	                <span>#노을</span>
	                <span>#바다</span>
	                <p>text content text content text content</p>
	            </p>
	        </div>
	    </div>
	    <div class="newFeed">
	        <div class="user">
	            <img src="<%= request.getContextPath() %>/images/profile_img_default.png" alt="" class="userImg">
	            <div class="userInfo">
	                <p class="userName">user01</p>
	                <p class="userTitle">user01_official</p>
	            </div>
	        </div>
	        <img src="<%= request.getContextPath() %>/images/home_feed3.png" alt="" class="image">
	        <div class="contents">
	            <img src="<%= request.getContextPath() %>/images/home_unlike.png" alt="" class="like">
	            <img src="<%= request.getContextPath() %>/images/home_comment.png" alt="" class="comment">
	            <p class="title">
	                <span>#감성</span>
	                <span>#노을</span>
	                <span>#바다</span>
	                <p>text content text content text content</p>
	            </p>
	        </div>
	    </div>
	    <div class="newFeed">
	        <div class="user">
	            <img src="<%= request.getContextPath() %>/images/profile_img_default.png" alt="" class="userImg">
	            <div class="userInfo">
	                <p class="userName">user01</p>
	                <p class="userTitle">user01_official</p>
	            </div>
	        </div>
	        <img src="<%= request.getContextPath() %>/images/home_feed4.png" alt="" class="image">
	        <div class="contents">
	            <img src="<%= request.getContextPath() %>/images/home_unlike.png" alt="" class="like">
	            <img src="<%= request.getContextPath() %>/images/home_comment.png" alt="" class="comment">
	            <p class="title">
	                <span>#감성</span>
	                <span>#노을</span>
	                <span>#바다</span>
	                <p>text content text content text content</p>
	            </p>
	        </div>
	    </div>
	    <div class="newFeed">
	        <div class="user">
	            <img src="<%= request.getContextPath() %>/images/profile_img_default.png" alt="" class="userImg">
	            <div class="userInfo">
	                <p class="userName">user01</p>
	                <p class="userTitle">user01_official</p>
	            </div>
	        </div>
	        <img src="<%= request.getContextPath() %>/images/home_feed5.png" alt="" class="image">
	        <div class="contents">
	            <img src="<%= request.getContextPath() %>/images/home_unlike.png" alt="" class="like">
	            <img src="<%= request.getContextPath() %>/images/home_comment.png" alt="" class="comment">
	            <p class="title">
	                <span>#감성</span>
	                <span>#노을</span>
	                <span>#바다</span>
	                <p>text content text content text content</p>
	            </p>
	        </div>
	    </div>
	</div>
    
    <style>
    
	    .content{
		    width: 100%;
		    height: 95%;
		    display: flex;
		    flex-direction: column;
		    align-items: center;
		    overflow: scroll;
		    padding: 20px 0 0 0;
		}
		
    	*::-webkit-scrollbar{
		    display: none;
		}
		
		.newFeed{
		    width: 400px;
		    height: 550px;
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
		
		.newFeed>.image{
		    width: 400px;
		    height: 400px;
		}
		
		.newFeed>.contents{
		    padding: 10px;
		}
		
		.newFeed>.contents>img{
		    width: 20px;
		}
		
		.newFeed>.contents>p{
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