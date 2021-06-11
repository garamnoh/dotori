<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import='com.member.model.vo.Member' %>
<%
	String admin = (String)session.getAttribute("admin");
	String memberName = (String)((Member)session.getAttribute("loginMember")).getMemberName();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>index</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/reset.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/main/main.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700;900&family=Roboto:wght@400;500;700;900&display=swap">
    <script type="text/javascript" src='<%= request.getContextPath() %>/js/jquery-3.6.0.min.js'></script>
</head>
<body>
    <div id="background"></div>
    
    
    
    <header>
        <div class="menuBox">
            <div class="logo">
                <img src="<%= request.getContextPath() %>/images/logo_main.png" alt="">
            </div>
            <div class="menu">
            	<% if(admin.equals("admin@gmail.com")) { %>
            		<span class='title box'>Admin</span>
	            	<span class="title box">Home</span>
	            	<div id='notification'></div>
	                <span class="title box" id='friendBtn'>Friends</span>
	                <span class="title box">Shop</span>
	                <img class="title" id="miniHome" src="<%= request.getContextPath() %>/images/logo_minihome.png" alt="">
            	<% } else {%>
	                <span class="title box">Home</span>
	                <span class="title box" id='friendBtn'>Friends</span>
	                <span class="title box">Shop</span>
	                <img class="title" id="miniHome" src="<%= request.getContextPath() %>/images/logo_minihome.png" alt="">
	            <% } %>
            </div>
            <div id='msgAlert'>
		    	<div id='msg'><span id='fromWho'></span>님의 채팅 요청</div>
		    	<button id='yes'>수락</button>
		    	<button id='no'>거절</button>
		    </div>
        </div>
    </header>
    
    <style>
    	#msgAlert{
    		position: fixed;
    		top: 0;
    		left: 30%;
    		border-bottom-left-radius: 10px;
    		border-bottom-right-radius: 10px;
    		background-color: #eee;
    		opacity: .7;
    		padding: 10px;
    		display: flex;
    		align-items: center;
    	}
    	#msgAlert>#msg{
    		margin-top: 10px;
    		color: gray;
    		opacity: .7;
    		margin-right: 20px;
    	}
    	#msgAlert>#msg>span{
    		margin-right: 5px;
    		font-size: 13px;
    		font-weight: 500;
    		opacity: 1;
    	}
    	#msgAlert button{
    		margin-top: 10px;
    		border: none;
    		padding: 5px 10px;
    		background-color: lightgray;
    		opacity: 1;
    		font-size: 13px;
    		color: gray;
    		margin-right: 5px;
    		border-radius: 5px;
    	}
    	#msgAlert button:hover{
    		opacity: .7;
    	}
    	#msgAlert button:active{
    		opacity: 1;
    	}
    	#msgAlert button:focus{
    		outline: none;
    	}
    </style>



	<div class="contents">
	    <div class="contentsSub">
	    	<!-- side -->
	        <aside id="aside">
				<%@ include file="/views/main/aside_home.jsp" %>
	        </aside>
	
			<!-- content -->
	        <section id="section">
				<%@ include file="/views/main/section_home.jsp" %>
	        </section>
	    </div>
	</div>
	<div id="accessAlert">
		<span id='accessName'></span>
		<span>MINIhome 방문</span>
		<div>최근 3일 : <span></span>회</div>
	</div>
	<style>
		#accessAlert{
			position: fixed;
			width: 200px;
			height: 100px;
			right: 30px;
			bottom: 30px;
			background-color: #eee;
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
			border-radius: 5px;
		}
		#accessAlert>span{
			margin: 5px;
			color: gray;
		}
		#accessAlert>div{
			font-size: 13px;
			color: gray;
		}
	</style>
	
	<footer>
		<div id='footer'>
			<p id='dotori'>DOTORI</p>
			<p>TEAM&emsp;|&emsp;김규희&emsp; 김기영&ensp; 노가람&ensp; 유혜신&ensp; 이시후
			<p>Copyright 2021 by 자바를 자바라.&emsp;All rights reserved.</p>
		</div>
	</footer>



	<script>
 		const socket = new WebSocket('ws://rclass.iptime.org:9999/<%=request.getContextPath()%>/chatting');
	
		socket.onopen = (e)=>{
			//alert('webSocket server 접속');
			console.log(e);
			console.log("socket open");
		}
		
		
		$('.menu').click((e)=>{
			
			const menu = $(e.target).html();
			
			console.log(menu);
			
			switch(menu){
			
				case 'Admin' :
					$('#aside').html('');
					$('#section').html('');
					
					$('#aside').removeClass('hide');
					
					$.ajax({
						url: '<%= request.getContextPath() %>/page/sidebarAdmin',
						dataType: 'html',
						success: data=>{
							$('#aside').append(data);
						}
					});
					
					$.ajax({
						url: '<%= request.getContextPath() %>/page/contentAdmin',
						dataTypd: 'html',
						success: data=>{
							$('#section').append(data);
						}
					});
					
					break;
				
				case 'Home' :
					$('#aside').html('');
					$('#section').html('');
					
					$('#aside').removeClass('hide');
					
					$.ajax({
						url: '<%= request.getContextPath() %>/page/sidebarMain',
						success: data=>{
							$('#aside').append(data);
						}
					});
					
					$.ajax({
						url: '<%= request.getContextPath() %>/page/contentMain',
						success: data=>{
							$('#section').append(data);
						}
					});
					
					break;
					
				case 'Friends' :
					$('#aside').html('');
					$('#section').html('');
					
					$('#aside').removeClass('hide');
					
					$.ajax({
						url: '<%= request.getContextPath() %>/page/sidebarFriends',
						dataYpe: 'html',
						success: data=>{
							$('#aside').append(data);
						}
					});
					
					$.ajax({
						url: '<%= request.getContextPath() %>/friends/log',
						dataTypd: 'html',
						success: data=>{
							$('#section').append(data);
						}
					});
					
					break;
					
				case 'Shop' :
					$('#aside').html('');
					$('#section').html('');
					
					$('#aside').removeClass('hide');
					
					$.ajax({
						url: '<%= request.getContextPath() %>/page/sidebarShop.do',
						dataYpe: 'html',
						success: data=>{
							$('#aside').append(data);
						}
					});
					
					$.ajax({
						url: '<%= request.getContextPath() %>/page/contentShop.do',
						dataTypd: 'html',
						success: data=>{
							$('#section').append(data);
						}
					});
					
					break;
					
					
				case '' :

					const minihomeWidth = 1200;
					const minihomeHeight = 756;
					const xAxis = (window.screen.width / 2) - (minihomeWidth / 2);
					const yAxis = (window.screen.height / 2) - (minihomeHeight / 2); 
		    		
					//const status="width=1200px,height=756px,left=50px,top=50px";
					const status="width=1200px,height=756px,left="+xAxis+",top="+yAxis;
		    		const url="<%=request.getContextPath()%>/page/minihome.do";
		    		window.open(url,"",status);
					
					break;
			}	
		});

		
		
		
		// 날짜 및 시간 //////////////////////////////////////////////////
        function getFormatDate(date){
            var year = date.getFullYear();              
            var month = (1 + date.getMonth());          
            month = month >= 10 ? month : '0' + month;  
            var day = date.getDate();                   
            day = day >= 10 ? day : '0' + day;          
            return  year + '-' + month + '-' + day;       
        }

        function getFormatTime(date){
            var hour = date.getHours();
            var minute = date.getMinutes();
            var second = date.getSeconds();
            return hour + ":" + minute + ":" + second;
        }
        var today = getFormatDate(new Date());
        var time = getFormatTime(new Date());
        console.log(today, time);
        
        var date = today + " " + time;
        ///////////////////////////////////////////////////////////////
		
		
		
		
		function Message(sender, receiver, msg, date, type){
			this.sender = sender;
			this.receiver = receiver;
			this.msg = msg;
			this.date = date;
			this.type = type;
		}
		
		const memberName = '<%=memberName%>';
		
		
		$('#footer-info').on('click', ()=>{
			console.log('access Member');
			setTimeout(()=>{
				var sendMsg = new Message(memberName, 'admin_test', 'test', 'test', '');
				socket.send(JSON.stringify(sendMsg));
			}, 1000);
		});
		
		var receiverName;

		socket.onmessage = (e)=>{
			console.log(e);
			console.log("socket onmessage");
			
			let data = JSON.parse(e.data);
			
	 		if(data['type']=="요청"){
				if(data['receiver']=='<%=memberName%>'){
					$('#fromWho').text(data['sender']);
					$('#msgAlert').slideDown();
					receiverName = data['sender'];
				}
			} 
		}
		
		const accept = memberName + "님이 채팅방에 입장했습니다.";
		
		$('#yes').on('click', (e)=>{
			$('#aside').html('');
			$('#section').html('');
			
			$('#aside').removeClass('hide');
			
			$.ajax({
				url: '<%= request.getContextPath() %>/page/sidebarFriends',
				dataYpe: 'html',
				success: data=>{
					$('#aside').append(data);
				}
			});
			
			$.ajax({
				url: '<%= request.getContextPath() %>/chat/chatScreen',
				dataTypd: 'html',
				success: data=>{
					$('#section').append(data);
				}
			}).done(()=>{
	    		
		    	$.ajax({
		    		url: '<%= request.getContextPath() %>/chat/logedInInfo',
		    		success: (data)=>{
		    			$.each(data, (i,v)=>{
			    			if(v[0].memberName==receiverName) {
			    				 const filePath = v[0].profilePath;
			    				 $('#receiverProfilePath').val(filePath);
			    			}
		    			});
		    		}
		    	});
		    	$('#receiver').val(receiverName);
		    	$('#receiver').next().focus();
		    });
			$('#msgAlert').slideUp();
			var sendMsg = new Message(memberName, receiverName, accept, date, '채팅');
			socket.send(JSON.stringify(sendMsg));
		});
		
		
		$('#accessAlert').hide();
		$('#msgAlert').hide();
		$(document).ready(function(){
			setTimeout(()=>{
				$('#footer-info').trigger('click');
			}, 2000);
		});

		

		
        const reject = memberName + "님이 채팅 요청을 거절 했습니다."
        $('#no').on('click', (e)=>{
			
			var sendMsg = new Message(memberName, receiverName, reject, date, '채팅');
			socket.send(JSON.stringify(sendMsg));
			$('#msgAlert').slideUp();
		});
		
	</script>

</body>
</html>