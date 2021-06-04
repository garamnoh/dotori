<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="menuOption">
    <div id="optionTitle">Admin</div>
    <div class='menuTitle' id="option1">회원관리</div>
    <div class="menuSub">
    	<p id='member'>회원정보 조회</p>
        <p id='memberOption'>option1</p>
    </div>
    <div class='menuTitle' id="option2">게시글관리</div>
    <div class="menuSub">
        <p id='board'>게시물 조회 및 관리</p>
        <p id='boardOption1'>공지사항 조회 및 관리</p>
        <p id='boardOption2'>option2</p>
    </div>
    <div class='menuTitle' id="option3">상품관리</div>
    <div class="menuSub">
        <p id='notice'>상품조회 및 삭제</p>
        <p id='noticeOption'>상품 등록</p>
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
	
	$('#member').on('click', (e)=>{
		
		$('#section').html('');
		
		$.ajax({
			url: '<%= request.getContextPath() %>/admin/membersList',
			dataType: 'html',
			success: data=>{
				$('#section').append(data);
			}
		});
	});
</script>