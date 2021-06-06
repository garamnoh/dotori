<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.member.model.vo.Member" %>
<%
	Member member = (Member)session.getAttribute("loginMember");
	String profilePath = (String)session.getAttribute("profilePath");
%>
    
    <div class="profile">
    	<img id='minimi' src="<%= request.getContextPath() %>/upload/MINIMI/<%= profilePath %>" alt="">
    </div>
    
    <div class="info">
        <hr>
        <div id="userName"><%= member.getNickname() %></div>
        <div id="userEmail"><%= member.getMemberId() %></div>
        <hr>
        <div id="today">Today : <span></span>명</div>
        <div id="total">Total : <span></span>명</div>
        <hr>
        <div id="board">New Feed : 10</div>
        <div id="requestFromCount">일촌 신청 : <span></span>명</div>
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
		    position: relative;
		}
		
		.profile:hover{
			opacity: 0.7;
		}
		
		.profile:active{
			opacity: 1;
		}

		.profile>img{
			padding: 4px;
		    height: 200px;
		    width: 200px;
   		    border: 1px solid #eee;
		    border-radius: 50%;
		}
		
		.profile>span#editMinimi{
			position: absolute;
			font-size: 13px;
		    color: rgb(94, 94, 94);
		    background-color: inherit;
			top: 190px;
			left: 165px;
			cursor: default;
		}
		
		.profile>span#editProfile:hover{
			opacity: .7;
		}
		
		.profile>span#editProfile:active{
			opacity: 1;
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
			opacity: 1;
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

    
    <script>
    	$('#editBtn').on('click', (e)=>{
    		
    		$('#section').html('');
    		
    		$.ajax({
    			url: '<%= request.getContextPath() %>/profile',
    			dataType: 'html',
    			success: data=>{
    				$('#section').append(data);
    			}
    		});
    	});
    
    	$('#minimi').on('click', (e)=>{
    		
    		$('#section').html('');
    		
    		$.ajax({
    			url: '<%= request.getContextPath() %>/editMinimi',
    			success: data=>{
    				$('#section').append(data);
    			}
    		});
    	});
    
		$(document).ready(function(){
			
			const memberId = '<%= member.getMemberId() %>';
			
			$.ajax({
				url: '<%= request.getContextPath() %>/refreshInfo',
				data: {
					'memberId': memberId
				},
				success: data=>{
					$('#today').children('span').text(data['today']);
					$('#total').children('span').text(data['total']);
					$('#requestFromCount').children('span').text(data['requestedFromCount']);
				}
			});
		});  
    </script>