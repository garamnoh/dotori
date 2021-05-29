<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.member.model.vo.Member" %>
<%
	Member member = (Member)session.getAttribute("loginMember");
%>
    
    <div class="profile">
    	<form id="submitForm" action="" method="post" enctype="multipart/form-data">
	    	<img src="<%= request.getContextPath() %>/images/profile_img_default.png" alt="">
	    	<span id="editProfile">MINIMI</span>
	    	<input type="submit" id="submitProfile" value="">
	    	<input type="file" name="uploadProfile" id="uploadProfile" accept="image/*">
    	</form>
    </div>
    
    <div class="info">
        <hr>
        <div id="userName"><%= member.getNickname() %></div>
        <div id="userEmail"><%= member.getMemberId() %></div>
        <hr>
        <div id="today">Today : 133</div>
        <div id="total">Total : 323423</div>
        <hr>
        <div id="board">New Feed : 10</div>
        <div id="request">일촌 신청 : 5</div>
        <div id="editBox">
			<button id="editBtn">Edit Profile</button>
		</div>
		<div id="logoutBox">
			<form action="<%= request.getContextPath() %>/memberLogout" method="post">
				<button type="submit" name="logout" id="logout" formtarget="_parent">Logout</button>
			</form>
		</div>
    </div>
    
    <style>
    	
    	aside{
    		width: 100%;
    	}
    	
		*::-webkit-scrollbar{
		    display: none;
		}
		
		.profile{
		    height: 200px;
		    width: 100%;
		    background-color: inherit;
		    margin: 30px 0 20px 0;
		    border-radius: 50%;

		    display: flex;
		    justify-content: center;
		    align-items: center;
		}
		
		.profile>form{
		    height: 200px;
		    width: 200px;
		    border-radius: 50%;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    position: relative;
		}
		
		.profile>form>img{
		    height: 200px;
		    width: 200px;
   		    border: 2px solid #eee;
		    border-radius: 50%;
		}
		
		.profile>form>span#editProfile{
			position: absolute;
			font-size: 13px;
		    color: rgb(94, 94, 94);
		    background-color: inherit;
			top: 190px;
			left: 150px;
			cursor: default;
		}
		
		.profile>form>span#editProfile:hover{
			opacity: .7;
		}
		
		.profile>form>span#editProfile:active{
			opacity: 1;
		}
		
		.profile>form>input[type=file],
		.profile>form>input[type=submit]{
			display: none;
		}
		
		.info{
		    margin: 0 10px 0 10px;
		}
		
		.info>div{
		    border-radius: 3px;
		    padding: 8px 5px;
		    font-size: 14px;
		    font-weight: 500;
		    color: rgb(94, 94, 94);
		    margin: 10px 0 10px 0;
		}
		
		.info>hr{
		    margin-right: 0;
		}
		
		.info>div#logoutBox,
		.info>div#editBox{
			width: 100%;
			margin: 5px 0;
			padding: 0;
		}
		
		.info>div#logoutBox button#logout,
		.info>div#editBox button#editBtn{
			background-color: #eee;
			opacity: 0.4;
			border: none;
			border: 1px #eee solid;
			width: 100%;
			height: 30px;
		}
		
		.info>div#logoutBox button#logout:hover,
		.info>div#editBox button#editBtn:hover{
			background-color: #eee;
			opacity: 0.5;
		}
		
		.info>div#logoutBox button#logout:active,
		.info>div#editBox button#editBtn:active{
			opacity: 0.4;
		}    
    
    </style>
    
    
<%--     <script src="<%= request.getContextPath() %>/views/main/sideMain.jsp"></script> --%>
    <script>
    	$('#editBtn').on('click', (e)=>{
    		
    		$('#section').html('');
    		
    		$.ajax({
    			url: '<%= request.getContextPath() %>/views/section/section_home_editProfile.jsp',
    			dataType: 'html',
    			success: data=>{
    				$('#section').append(data);
    			}
    		});
    	});
    
    
    
    
    
    
    
    
    
//    	$('#editProfile').click((e)=>{
//    		$('#uploadProfile').click();
//    	});
//    	
//    	$('#uploadProfile').change((e)=>{
//    		const valueA = $('#uploadProfile').val();
//    		const value = valueA.substring(valueA.lastIndexOf('\\')+1);
//    		
//    		$('#submitProfile').val(value);
//    		$('#submitForm').submit();
//    		console.log('a', $('#submitProfile').val());
//    	});
//    	
//    	$('#editBtn').on('click', function(e){
//			$(parent.document).find('#section').attr('src', '<%= request.getContextPath() %>/moveToEditProfile');
//    	})
    </script>