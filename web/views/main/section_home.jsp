<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id='selectBox'>
	<div id='albumBox'>PHOTO</div>
	<div id='diaryBox'>DIARY</div>
</div>

<div id='contentResult'></div>

<img id='loading' src='<%=request.getContextPath() %>/images/loading.gif'>

<style>
	#selectBox{
		margin: 10px;
		display: flex;
		width: 100%;
		border-radius: 5px;
		justify-content: center;
	}
	
	#selectBox>div{
		padding: 5px 10px;
		width: 60px;
		font-size: 13px;
		color: white;
		display: flex;
		justify-content: center;
		cursor: default;
	}
	
	#selectBox>div:hover{
		opacity: .7;
	}
	
	#selectBox>div:active{
		opacity: 1;
	}
	
	#selectBox>div#diaryBox{
		border-top-right-radius: 5px;
		border-bottom-right-radius: 5px;
		background-color: lightgray;
	}
	
	#selectBox>div#albumBox{
		border-top-left-radius: 5px;
		border-bottom-left-radius: 5px;
		background-color: gray;
	}
	
	#contentResult{
	    width: 100%;
	    height: 96%;
	    display: flex;
	    flex-direction: column;
	    align-items: center;
	    overflow: scroll;
	    padding: 20px 0 0 0;
	}
	
	
	
	#loading{
		width: 100px;
		display: none;
	}
	
	
	
	#newFeedDiary{
	    width: 600px;
	    height: auto;
	    border: 1px solid #eee;
	    margin-bottom: 20px;
	}
	
	#newFeedDiary>.user{
	    padding: 10px;
	    display: flex;
	    border-bottom: 1px solid #eee;
	}
	
	#newFeedDiary>.user>.userImg{
	    width: 35px;
	    border-radius: 50%;
	    margin-right: 10px;
	}
	
	#newFeedDiary>.user>.userInfo{
	    display: flex;
	    flex-direction: column;
	    justify-content: center;
	    color: rgb(94, 94, 94);
	    font-size: 15px;
	}
	
	#newFeedDiary>.contents{
	    padding: 10px;
	    display: flex;
	    justify-content: space-between;
	}
	
	#newFeedDiary>.contents>img{
	    width: 20px;
	}
	
	#newFeedDiary>.contents>div{
	    font-size: 15px;
	    font-weight: 300;
	    line-height: 1.5;
	    word-break:break-all;
	}
</style>

<script>
	var page = 1; 
		
	$(document).ready(function(){
	     getDiaryList(page);
	     page++;
	});
	
/*  	$('#aa').on('click',()=>{
		console.log('click');
		getDiaryList(page);
		page++;
	}); */
		
	
	
 	$('#contentResult').scroll(function(){
   		var scrollT = $(this).scrollTop();
   		var scrollH = $(this).height();
   		var contentH = document.getElementById('contentResult').scrollHeight;
   		
   		console.log(scrollT);
   		console.log(scrollH);
   		console.log(contentH);
    		
        if(scrollT + scrollH + 20 >= contentH) {
		
        	$('#loading').show();
        	
        	setTimeout(function(){
				getDiaryList(page);
				page++;
				$('#loading').hide();
        	}, 1000);
        }
   	});

	 
	function getDiaryList(page){
		console.log(page);
	    $.ajax({
	        url : '<%=request.getContextPath() %>/main/newFeedDiary',
	        data : {
	        	'page': page
	        },
	        success : (data)=>{
	            if (page==1) {
	            	console.log('1페이지');
	            	$("#contentResult").html(data);
	            } else {
	            	console.log('2페이지');
	            	$("#contentResult").append(data);
	            }
	       }
	    });
	}
	
	$('#albumBox').on('click', ()=>{
		console.log("album");
	    $.ajax({
	        url : '<%=request.getContextPath() %>/main/newFeedAlbum',
	        data : {
	        	'page': page
	        },
	        success : (data)=>{
	        	console.log('diary page :', page);
	            if (page==1) {
	            	$("#contentResult").html(data);
	            } else {
	            	$("#contentResult").append(data);
	            }
	       }
	    });
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
</script>