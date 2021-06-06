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
        </div>
    </header>



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
	
	
	
	<footer>
		<div id='footer'>
			<p id='footer-info'>라이센스. @ right. javajava footer dotori</p>
		</div>
	</footer>



	<script>
 		const socket = new WebSocket('ws://localhost:9090/<%=request.getContextPath()%>/chatting');
	
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
						url: '<%= request.getContextPath() %>/friends/myFriends',
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

		
		
		
		
		
		
		function Message(sender, receiver, msg, date){
			this.sender = sender;
			this.receiver = receiver;
			this.msg = msg;
			this.date = date;
		}
		
		const memberName = '<%=memberName%>';
		
		$('#footer-info').on('click', ()=>{
			var sendMsg = new Message(memberName, 'test', 'test', 'test');
			socket.send(JSON.stringify(sendMsg));
		});
		
		
		$(document).ready(function(){
			setTimeout(()=>{
				$('#footer-info').trigger('click');
			}, 2000);
		});
	</script>

</body>
</html>