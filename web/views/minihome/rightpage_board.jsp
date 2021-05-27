<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous"> -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/minihome/mini_board.css">
    
<!-- <p>right-page-board</p> -->
<div id="right_board_box">

    <div id="geust_reply_box">            
        <div id="guest_inner">
            <img id="guest_minimi" src="<%=request.getContextPath()%>/images/MINIMI/mickey.jpg" alt="">
            <!-- <span id="guest_minimi"></span> -->
            <span id="guest_real_reply_box">
 	            <input type="text" id="real_reply"> 
		        <button id="reply-btn">확인</button>
		        <!-- <button type="button" class="btn btn-secondary">확인</button> -->
	        </span>
        </div>   
        <!-- <input type="text" id="reply" style="visibility:hidden;"> --> 
    </div>

    <div id="geust_box">
        <div id="guest_info">
            <span id="guest_no">No.1</span>
            <span id="guest_name">user</span>
            <span id="guest_date"></span>
        </div>
        <div id="guest_inner">
            <img id="guest_minimi" src="<%=request.getContextPath()%>/images/MINIMI/mickey.jpg" alt="">
            <!-- <span id="guest_minimi"></span> -->
            <span id="guest_reply_box"></span>
        </div>   
        <input type="text" id="reply">     
        <button>확인</button>
        <!-- <button type="button" class="btn btn-secondary">확인</button> -->
    </div>
    
</div>