<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/mini_board.css">
</head>
<body>
    <!-- <p>right-page-board</p> -->
    <div id="right_board_box">
    
        <div id="geust_reply_box">            
            <div id="guest_inner">
                <img id="guest_minimi" src="<%=request.getContextPath()%>/images/mickey.jpg" alt="">
                <!-- <span id="guest_minimi"></span> -->
                <span id="guest_reply_box"> 
	    	        <input type="text" id="real_reply"> 
    	        </span>
            </div>   
            <input type="text" id="reply" style="visibility:hidden;"> 
            <button>확인</button>
        </div>
    
        <div id="geust_box">
            <div id="guest_info">
                <span id="guest_no">No.1</span>
                <span id="guest_name">user</span>
                <span id="guest_date"></span>
            </div>
            <div id="guest_inner">
                <img id="guest_minimi" src="<%=request.getContextPath()%>/images/mickey.jpg" alt="">
                <!-- <span id="guest_minimi"></span> -->
                <span id="guest_reply_box"></span>
            </div>   
            <input type="text" id="reply">     
            <button>확인</button>
        </div>
        <div id="geust_box">
            <div id="guest_info">
                <span id="guest_no"></span>
                <span id="guest_name"></span>
                <span id="guest_date"></span>
            </div>
            <div id="guest_inner">
                <!-- <img id="guest_minimi" src="" alt=""> -->
                <span id="guest_minimi"></span>
                <span id="guest_reply_box"></span>
            </div>   
            <input type="text" id="reply">     
            <button>확인</button>
        </div>
        <div id="geust_box">
            <div id="guest_info">
                <span id="guest_no"></span>
                <span id="guest_name"></span>
                <span id="guest_date"></span>
            </div>
            <div id="guest_inner">
                <!-- <img id="guest_minimi" src="" alt=""> -->
                <span id="guest_minimi"></span>
                <span id="guest_reply_box"></span>
            </div>   
            <input type="text" id="reply">     
            <button>확인</button>
        </div>        
    </div>

</body>
</html>