<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import='com.member.model.vo.Member' %>
<%
	Member member = (Member)session.getAttribute("loginMember");
	String profilePath = (String)session.getAttribute("profilePath");
%>

<div id='chatScreen'>
	<p id='chatTitle'>Chat</p>
	<input type='hidden' id='receiverProfilePath' value=''>

	<div id="containerChat">
		<div id='chatBody'>

		</div>
		
		<div id='chatInput'>
			<input type='text' id='sender' size='8' value='<%=member.getMemberName()%>' readonly>
			<input type='text' id='receiver' size='8' value='' readonly>
			<input type='text' id='msg' placeholder='message'></input>
			<button id='sendMsg'>보내기</button>
			<div class='clear`'></div>
		</div>
		<div id='sendAlert'>
			<p>메세지를 입력하세요</p>
		</div>
	</div>
</div>


<style>
	#chatScreen{
		width: 100%;
		flex-grow: 1;
		overflow: hidden;
	}
	#chatScreen>#chatTitle{
		margin-top: 30px;
		margin-bottom: 10px;
		padding-bottom: 5px;
		font-weight: bold;
		border-bottom: 1px solid #eee;
	}
	#chatScreen>#containerChat{
		display: flex;
		flex-direction: column;
		height: 95%;
		overflow: hidden;
		position: relative;
	}
	#chatScreen>#containerChat>#chatBody{
		background-color: #eee;
		flex-grow: 1;
	}
	#chatScreen>#containerChat>#chatInput{
		margin-top: 10px;
		margin-bottom: 40px;
		display: flex;
		align-items: center;
	}
	#chatScreen>#containerChat>#chatInput>input#msg{
		height: 25px;
		flex-grow: 1;
		margin-right: 10px;
	}
	#chatScreen>#containerChat>#chatInput>input#sender,
	#chatScreen>#containerChat>#chatInput>input#receiver{
		margin-right: 10px;
		height: 25px;
		width: 80px;
		text-align: center;
	}
	#chatScreen>#containerChat>#chatInput>input:focus{
		outline: none;
	}
	#chatScreen>#containerChat>#chatInput>button{
		width: 100px;
		border: none;
		background-color: #eee;
		height: 32px;
	}
	#chatScreen>#containerChat>#chatInput>button:hover{
		opacity: .7;
	}
	#chatScreen>#containerChat>#chatInput>button:active{
		opacity: 1;
	}
	
	#chatScreen>#containerChat>#chatInput>button:focus{
		outline: none;
	}
	
	
	#chatBody{
		width: 100%;
		display: flex;
		flex-direction: column;
		overflow: scroll;
	}
	
	
	#chatBody>#senderBox{
		width: auto;
		display: flex;
		justify-content: flex-end;
		margin: 10px;	
	}
	#chatBody>#senderBox>#align{
		display: flex;
		flex-direction: column;
		width: 500px;
		align-items: flex-end;
	}
	#chatBody>#senderBox>#align>#nameBox{
		display: flex;
		align-items: center;
		margin-bottom: 5px;
	}
	#chatBody>#senderBox>#align>#nameBox>img{
		width: 25px;
		border-radius: 50%;
		margin-left: 10px;
	}
	#chatBody>#senderBox>#align>#nameBox>span{
		font-size: 13px;
		font-weight: 500;
		margin-right: 2px;
	}
	#chatBody>#senderBox>#align>#msgBox{
		border: 1px solid white;
		border-radius: 5px;
		max-width: 400px;
		height: auto;
		word-break:break-all;
		padding: 10px;
	}
	
	
	#chatBody>#receiverBox{
		width: auto;
		display: flex;
		justify-content: flex-start;
		margin: 10px;
	}
	#chatBody>#receiverBox>#align{
		display: flex;
		flex-direction: column;
		width: 500px;
		align-items: flex-start;
	}
	#chatBody>#receiverBox>#align>#nameBox{
		display: flex;
		align-items: center;
		margin-bottom: 5px;
	}
	#chatBody>#receiverBox>#align>#nameBox>img{
		width: 25px;
		border-radius: 50%;
		margin-right: 10px;
	}
	#chatBody>#receiverBox>#align>#nameBox>span{
		font-size: 13px;
		font-weight: 500;
	}
	#chatBody>#receiverBox>#align>#msgBox{
		border: 1px solid black;
		border-radius: 5px;
		max-width: 400px;
		height: auto;
		padding: 10px;	
	}
	
	#sendAlert{
		width: 100%;
		height: 34px;
		background-color: tomato;
		opacity: .6;
		position: absolute;
		bottom: 40px;
		display: none;
	}
	#sendAlert>p{
		text-align: center;
		font-size: 14px;
		font-weight: 500;
		color: white;
		opacity: 1;
		margin-top: 10px;
	}
</style>

<script src='<%=request.getContextPath()%>/js/jquery-3.6.0.min.js'></script>
<script>
<%-- 	const socket = new WebSocket('ws://localhost:9090/<%=request.getContextPath()%>/chatting');

	socket.onopen = (e)=>{
		//alert('webSocket server 접속');
		console.log(e);
		console.log("socket open");
	} --%>
	
	// 서버에서 전송한 데이터를 수신하고 페이지에 적용하는 함수
	socket.onmessage = (e)=>{
		console.log(e);
		console.log("socket onmessage");
		
		// 자바스크립트 객체 형식으로 넘어온 문자열은 객체로 변환할 수 있음
		// JSON.parse() 함수
		console.log(JSON.parse(e.data));
		
		let data = JSON.parse(e.data);
		
		let msg;
		if($('#sender').val()==data['sender']){
			// 자신
			const rootPath = '<%=request.getContextPath()%>';			
			const imgPath = '<%=profilePath%>';
			
			msg  = "<div id='senderBox'>";
			msg += "<div id='align'>";
			msg += "<div id='nameBox'>";
			//msg += "<span>나</span>";
			//msg += "<span>"+ data['sender'] +"</span>";
			msg += "<img src='" + rootPath + "/upload/MINIMI/" + imgPath + "'>";
			msg += "</div>";
			msg += "<div id='msgBox'>";
			msg += data['msg'];
			msg += "</div></div></div>";

		} else{
			// 상대방
			const rootPath = '<%=request.getContextPath()%>';			
			const imgPath = $('#receiverProfilePath').val();
			
			msg  = "<div id='receiverBox'>";
			msg += "<div id='align'>";
			msg += "<div id='nameBox'>";
			msg += "<img src='" + rootPath + "/upload/MINIMI/" + imgPath + "'>";
			msg += "<span>"+ data['sender'] +"</span>";
			msg += "</div>";
			msg += "<div id='msgBox'>";
			msg += data['msg'];
			msg += "</div></div></div>";
			
		}
		$('#chatBody').append(msg);
	}

	socket.onclose = (e)=>{
		console.log(e);
		console.log('socket close');
	}
	
	$('#sendMsg').click((e)=>{

		if($(e.target).prev().val()==''){

			$('#sendAlert').slideDown();
			setTimeout(()=>{
				$('#sendAlert').slideUp();
			}, 1000);
		} 
		else{
			const sendMsg = new Message($('#sender').val(), $('#receiver').val(), $('#msg').val());
			socket.send(JSON.stringify(sendMsg));
		}
	})
	
	function Message(sender, receiver, msg){
		this.sender = sender;
		this.receiver = receiver;
		this.msg = msg;
	}
	
	$('#sendMsg').on('click', (e)=>{
		$('#chatBody').animate({
			scrollTop: $('#chatBody')[0].scrollHeight
		}, 500);
		$(e.target).prev().val('');
		$(e.target).prev().focus();
	});
</script>