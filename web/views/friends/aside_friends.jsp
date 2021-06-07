<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sender = (String)request.getAttribute("sender");
%>
    <div class="menuOption">
        <div id="optionTitle">Friend</div>
        <div class="menuTitle abc" id="administrationFriends">친구관리</div>
        <div class="menuSub">
            <p id="menu1">일촌관리</p>
            <p id="menu3">신청현황</p> 
            <p id="menu2">친구찾기</p>
        </div>
        <div class="menuTitle" id="logedInFriends">현재 접속중인 친구</div>
        <div class="menuSub logedInMember">

        </div>
    </div>
    
    <style>
    
		*::-webkit-scrollbar{
		    display: none;
		}
		
		.menuOption{
		    margin: 0;
		    cursor: default;
		}
		
		.menuOption>#optionTitle,
		.menuOption>.menuTitle{
		    height: 30px;
		    padding: 15px;
		    font-size: 14px;
		    font-weight: 700;
		    color: rgb(94, 94, 94);
		    border-top-right-radius: 5px;
		    border-top-left-radius: 5px;
		    margin: 0;
		    display: flex;
		    flex-direction: column;
		    justify-content: center;
		}
		
		.menuOption>#optionTitle{
		    font-size: 18px;
		    padding: 15px;
		    font-weight: 900; 
		    margin-top: 10px;
		    /* border-bottom: 1px solid rgb(190, 190, 190); */
		}
		
		.menuOption>.menuTitle:hover{
		    background-color: rgb(218, 216, 216, .2);
		}
		
		.menuOption>.menuTitle:active{ 
		    background-color: rgb(224, 224, 224, .4);
		}
		
		.menuOption>.menuSub{
		    display: none;
		}
		
		.menuOption>.menuSub>p{
		    display: flex;
		    align-items: center;
		    justify-content: space-between;
		    width: auto;
		    height: 30px;
		    padding: 15px;
		    font-size: 14px;
		    font-weight: 500; 
		    background-color: rgb(238, 238, 238, .2);
		    color: rgb(94, 94, 94);
		    /* display: none; */
		    /* border-bottom: 1px solid #eee; */
		}
		
		.menuOption>.menuSub>p:hover{
		    background-color: rgb(228, 228, 228, .4);
		}
		
		.menuOption>.menuSub>p:active{   
		    background-color: rgb(238, 238, 238, .3);
		}
		
    </style>
    
    
    <script>
	    $('.menuOption>.abc').on('click', (e)=>{
	        $(e.target).next().slideToggle();
	        $('.menuOption>.menuTitle').not($(e.target)).next().slideUp();
	    });
	    
	    $('#logedInFriends').on('click', (e)=>{
	    	$(e.target).next().slideDown();
	        $('.menuOption>.menuTitle').not($(e.target)).next().slideUp();
	    });
	    
	    $('#menu1').click(()=>{
	    	
	    	$('#section').html('');
	    	
	    	$.ajax({
	    		url: '<%= request.getContextPath() %>/friends/myFriends',
	    		dataType: 'html',
	    		success: data=>{
	    			$('#section').append(data);
	    		}
	    	});
	    });
	    
	    $('#menu2').click(()=>{
	    	
	    	$('#section').html('');
	    	
	    	$.ajax({
	    		url: '<%= request.getContextPath() %>/views/friends/section_friends_find.jsp',
	    		dataType: 'html',
	    		success: data=>{
	    			$('#section').append(data);
	    		}
	    	});
	    });
	    
	    $('#menu3').click(()=>{
			
	    	$('#section').html('');
	    	
	    	$.ajax({
	    		url: '<%= request.getContextPath() %>/friends/requestedList',
	    		dataType: 'html',
	    		success: data=>{
	    			$('#section').append(data);
	    		}
	    	});
	    });
	    
	    var isData;
	    
	    $('#logedInFriends').on('click', (e)=>{
			
	    	$('div.logedInMember').html('');
	    	$.ajax({
	    		url: '<%= request.getContextPath() %>/chat/logedInInfo',
	    		success: (data)=>{
	    			isData = data['logedList'].length;
	    			if(data['logedList'].length!=0){
						$.each(data, (i, v)=>{
							$.each(v, (i, v)=>{
								const p = $('<p>').text(v.memberName);
								$('div.logedInMember').append(p);
							});							
						});
	    			} else {
	    				console.log('no result');
	    				const p = $('<p>').text('접속중인 친구가 없습니다.');
	    				$('div.logedInMember').append(p);
	    				
	    			}
	    		}
	    	});
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
	    
	    $('div.logedInMember').on('click', (e)=>{
	    	
	    	const sender = '<%=sender%>';
	    	const receiver = $(e.target).text();
	    	
	    	console.log(isData);
	    	if(isData!=0){
	    		
				var sendMsg = new Message(sender, receiver, "", date, "요청");
				socket.send(JSON.stringify(sendMsg));
				
				console.log(sender);
				console.log(receiver);
	    		
	    		$('#section').html('');
		    	$.ajax({
		    		url: '<%= request.getContextPath() %>/chat/chatScreen',
		    		success: data=>{
		    			console.log('socket : success');
		    			$('#section').append(data);
		    		}
		    	}).done(()=>{
		    		
			    	const receiverName = $(e.target).text();
			    	console.log(receiverName);
		    		
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
	    	}
    	});
	    	

	    
    </script>
