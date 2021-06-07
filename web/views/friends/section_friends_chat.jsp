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
		border: 1px solid lightgray;
		padding: 2px;
	}
	#chatBody>#senderBox>#align>#nameBox>span{
		font-size: 13px;
		font-weight: 500;
		margin-right: 2px;
	}
	#chatBody>#senderBox>#align>#msgBox{
		display: flex;
	}
	#chatBody>#senderBox>#align>#msgBox>#msgText{
		background-color: lightgray;
		border-radius: 5px;
		max-width: 400px;
		height: auto;
		word-break:break-all;
		padding: 10px;
		color: white;
		margin-left: 5px;
	}
	#chatBody>#senderBox>#align>#msgBox>span{
		font-size: 13px;
		color: gray;
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
		border: 1px solid lightgray;
		padding: 2px;
	}
	#chatBody>#receiverBox>#align>#nameBox>span{
		font-size: 13px;
		font-weight: 500;
	}
	#chatBody>#receiverBox>#align>#msgBox{
		display: flex;
	}
	#chatBody>#receiverBox>#align>#msgBox>#msgText{
		background-color: gray;
		border-radius: 5px;
		max-width: 400px;
		height: auto;
		padding: 10px;
		color: white;
		margin-right: 5px;
	}
	#chatBody>#receiverBox>#align>#msgBox>span{
		font-size: 13px;
		color: gray;
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

	var count = 0;
	// 서버에서 전송한 데이터를 수신하고 페이지에 적용하는 함수
	socket.onmessage = (e)=>{
		console.log(e);
		console.log("socket onmessage");
		
		// 자바스크립트 객체 형식으로 넘어온 문자열은 객체로 변환할 수 있음
		// JSON.parse() 함수
		
		let data = JSON.parse(e.data);
		console.log('메세지 : ', data['msg']);
		console.log('센더 : ', data['sender']);
		
		const myId = '<%=member.getMemberName()%>';
		
		
 		if(data['type']=="요청"){
			if(data['receiver']==myId){
				alert('a');
			}
 			
		} else{
			
			let msg;
			if($('#sender').val()==data['sender']){
				// 자신
				
				const rootPath = '<%=request.getContextPath()%>';			
				const imgPath = '<%=profilePath%>';
				const time = data['date'].substring(data['date'].indexOf(' ')+1, data['date'].lastIndexOf(':'));
				
				msg  = "<div id='senderBox'>";
				msg += "<div id='align'>";
				msg += "<div id='nameBox'>";
				//msg += "<span>나</span>";
				//msg += "<span>"+ data['sender'] +"</span>";
				msg += "<img src='" + rootPath + "/upload/MINIMI/" + imgPath + "'>";
				msg += "</div>";
				msg += "<div id='msgBox'>";
				msg += "<span>" + time + "</span><div id='msgText'>" + data['msg'] + "</div>";
				msg += "</div></div></div>";
				
			} else {
				// 상대방
				
				
				const rootPath = '<%=request.getContextPath()%>';			
				const imgPath = $('#receiverProfilePath').val();
				const time = data['date'].substring(data['date'].indexOf(' ')+1, data['date'].lastIndexOf(':'));
				
				msg  = "<div id='receiverBox'>";
				msg += "<div id='align'>";
				msg += "<div id='nameBox'>";
				msg += "<img src='" + rootPath + "/upload/MINIMI/" + imgPath + "'>";
				msg += "<span>"+ data['sender'] +"</span>";
				msg += "</div>";
				msg += "<div id='msgBox'>";
				msg += "<div id='msgText'>" + data['msg'] + "</div><span>" + time + "</spans>";
				msg += "</div></div></div>";
						
			}
			$('#chatBody').append(msg);
		}
	}


	
	
	function Message(sender, receiver, msg, date, type){
		this.sender = sender;
		this.receiver = receiver;
		this.msg = msg;
		this.date = date;
		this.type = type;
	}
	
	
	$('#sendMsg').click((e)=>{
		
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
        
		if($(e.target).prev().val()==''){

			$('#sendAlert').slideDown();
			setTimeout(()=>{
				$('#sendAlert').slideUp();
			}, 1000);
		} 
		else{
			var sendMsg = new Message($('#sender').val(), $('#receiver').val(), $('#chatInput #msg').val(), date, "채팅");
			socket.send(JSON.stringify(sendMsg));
		}
	})
	

	
	$('#sendMsg').on('click', (e)=>{
		$('#chatBody').animate({
			scrollTop: $('#chatBody')[0].scrollHeight
		}, 500);
		$(e.target).prev().val('');
		$(e.target).prev().focus();
	});
	

</script>