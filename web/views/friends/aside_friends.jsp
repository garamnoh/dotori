<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <div class="menuOption">
        <div id="optionTitle">Friend</div>
        <div class="menuTitle" id="option1">친구관리</div>
        <div class="menuSub">
            <p id="menu1">일촌관리</p>
            <p id="menu2">친구찾기</p>
            <p id="menu3">친구추천</p> 
        </div>
        <div class="menuTitle" id="option1">현재 접속중인 친구</div>
        <div class="menuSub">
            <p id="menu4">친구1</p>
            <p id="menu5">친구2</p>
            <p id="menu6">친구3</p> 
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
	    $('.menuOption>.menuTitle').on('click', (e)=>{
	        $(e.target).next().slideToggle();
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
    </script>
