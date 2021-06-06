<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id='selectBox'>
	<div id='diaryBox'>DIARY</div>
	<div id='albumBox'>PHOTO</div>
</div>

<div id='contentResultDiary'></div>
<div id='contentResultAlbum'></div>

<img id='loading' src='<%=request.getContextPath() %>/images/loading.gif'>
<div id='scrollTopDiary'><img src='<%=request.getContextPath()%>/images/up_black.svg'></div>
<div id='scrollTopAlbum'><img src='<%=request.getContextPath()%>/images/up_black.svg'></div>

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
		border-top-left-radius: 5px;
		border-bottom-left-radius: 5px;
		background-color: gray;
	}
	
	#selectBox>div#albumBox{
		border-top-right-radius: 5px;
		border-bottom-right-radius: 5px;
		background-color: lightgray;
	}
	
	#contentResultDiary,
	#contentResultAlbum{
	    width: 100%;
	    height: 96%;
	    display: flex;
	    flex-direction: column;
	    align-items: center;
	    overflow: scroll;
	    padding: 20px 0 0 0;
	}
	
/* 	#contentResultAlbum{
		display: none;
	} */
	
	
	/* 로딩 */
	#loading{
		width: 100px;
		display: none;
	}
	
	
	
	/* 다이어리 */
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
	
	
	
	/* 앨범 */
	#newFeedAlbum{
	    width: 400px;
	    height: auto;
	    border: 1px solid #eee;
	    margin-bottom: 20px;
	}
	
	#newFeedAlbum>.user{
	    padding: 10px;
	    display: flex;
	}
	
	#newFeedAlbum>.user>.userImg{
	    width: 35px;
	    border-radius: 50%;
	    margin-right: 10px;
	}
	
	#newFeedAlbum>.user>.userInfo{
	    display: flex;
	    flex-direction: column;
	    justify-content: center;
	    color: rgb(94, 94, 94);
	    font-size: 15px;
	}
	
	#newFeedAlbum>.user>.userInfo>.userName{
		margin-bottom: 5px;
		font-weight: 500;
	}
	
	#newFeedAlbum>.image{
	    width: 400px;
	    height: auto;
	}
	
	#newFeedAlbum>.contents{
	    padding: 10px;
	}
	
	#newFeedAlbum>.contents>img{
	    width: 20px;
	}
	
	#newFeedAlbum>.contents>div>p{
	    font-size: 15px;
	    font-weight: 300;
	    line-height: 1.5;
	}
	
	#scrollTopDiary,
	#scrollTopAlbum{
		position: fixed;
		bottom: 20px;
		right: 20px;
		background-color: #eee;
		padding: 10px;
		border-radius: 50%;
 		display: flex;
		justify-content: center;
		align-items: center;
		width: 20px;
		height: 20px;
 	}
 	
	#scrollTopDiary>img,
	#scrollTopAlbum>img{
		opacity: .4;
	}
	
	#scrollTopDiary:hover,
	#scrollTopAlbum:hover{
		opacity: .7;
	}
	
	#scrollTopDiary:active,
	#scrollTopAlbum:active{
		opacity: 1;
	}
</style>

<script>
	var page = 1; 
		
	$(document).ready(function(){
		$('#contentResultAlbum').hide();
		$('#scrollTopAlbum').hide();
	    getDiaryList(page);
	    page++;
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
	            	$("#contentResultDiary").html(data);
	            } else {
	            	console.log('2페이지');
	            	$("#contentResultDiary").append(data);
	            }
	       }
	    });
	}
	
	
	$('#albumBox').on('click', ()=>{
		$('#albumBox').css('background-color', 'gray');
		$('#diaryBox').css('background-color', 'lightgray');
		
		$('#contentResultDiary').hide();
		$('#contentResultAlbum').show();
		
		$('#scrollTopDiary').hide();
		$('#scrollTopAlbum').show();
		
		$('#contentResultAlbum').scrollTop(0);
		
		console.log("album");
		page = 1;
		getAlbumList(page);
		page++;
	});
	
	$('#diaryBox').on('click', ()=>{
		$('#albumBox').css('background-color', 'lightgray');
		$('#diaryBox').css('background-color', 'gray');
		
		$('#contentResultAlbum').hide();
		$('#contentResultDiary').show();
		
		$('#scrollTopAlbum').hide();
		$('#scrollTopDiary').show();
		
		$('#contentResultDiary').scrollTop(0);
		
		console.log("diary");
		page = 1;
		getDiaryList(page);
		page++;
	});
	
	
	function getAlbumList(page){
		
	    $.ajax({
	        url : '<%=request.getContextPath() %>/main/newFeedAlbum',
	        data : {
	        	'page': page
	        },
	        success : (data)=>{
	        	console.log('diary page :', page);
	            if (page==1) {
	            	$("#contentResultAlbum").html(data);
	            } else {
	            	$("#contentResultAlbum").append(data);
	            }
	       }
	    });
	}
	
	
 	$('#contentResultDiary').scroll(function(){
   		var scrollT = $(this).scrollTop();
   		var scrollH = $(this).height();
   		var contentH = document.getElementById('contentResultDiary').scrollHeight;
   		
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
	
 	$('#contentResultAlbum').scroll(function(){
   		var scrollT = $(this).scrollTop();
   		var scrollH = $(this).height();
   		var contentH = document.getElementById('contentResultAlbum').scrollHeight;
   		
   		console.log(scrollT);
   		console.log(scrollH);
   		console.log(contentH);
    		
        if(scrollT + scrollH + 20 >= contentH) {
		
        	$('#loading').show();
        	
        	setTimeout(function(){
				getAlbumList(page);
				page++;
				$('#loading').hide();
        	}, 1000);
        }
   	});
 	
 	
	$('#scrollTopAlbum').on('click', ()=>{
		$('#contentResultAlbum').animate({
			scrollTop: 0
		}, 500);
	});
	
	$('#scrollTopDiary').on('click', ()=>{
		$('#contentResultDiary').animate({
			scrollTop: 0
		}, 500);
	});
</script>