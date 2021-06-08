<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="com.member.model.vo.Member" %>
<%
	Member member = (Member)session.getAttribute("loginMember");
%>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
<br>   <img id="dotori" src="<%=request.getContextPath()%>/images/shopDOTORI.png" >
	    <span class="Title">도토리 충전</span>
	 <br>
	 
	 <div id="userdotori"><%= member.getNickname() %>님 <br><br> 
	 <img id="dotorisize" src="<%=request.getContextPath()%>/images/shopDOTORI.png" ><%=member.getDotori() %>개</div>
	
	
	 <br>
	 
	 <div class="dotoriBuy">
	 	<div class="dotoriBuy1">
	 	<form>
	 	<br>
	 	<div id="select">
	 	<label><input type="radio" name="radio" value="1000" ><span class="c">10</span>개(1000원)</label>
	 	 <label><input type="radio" name="radio" value="3000" ><span class="c">30</span>개(3000원)</label>
	 	 <label><input type="radio" name="radio" value="5000" ><span class="c">50</span>개(5000원)</label>
	 	 <label><input type="radio" name="radio" value="9000" ><span class="c">100</span>개(9000원)</label>
	 	 <div id="vip">
	     <label><input type="radio" name="radio" value="27000" ><span class="c">300</span>개(27000원)</label>
	   	 <label><input type="radio" name="radio" value="40000" ><span class="c">500</span>개(40000원)</label>

	   	  <label><input type="radio" value="1" name="radio" checked ><span class="c">직접입력</span>
	   	  <input type="text"  id="text" name = "wr_1"placeholder="최대1000개" size=8 maxlength=4 max=1000 onkeyup='printValue();' onkeypress="inNumber();"/>
	   	  개(<span id='result'></span>)원</label>
		</div>
		
	   
	
	   	 <div id="notice">※100개 이상 구매 시 10% , 500개 이상 구매 시 20% SALE</div>
	   	 </div>
	   
	   	 <div id="buy">
	<input type='reset' value="취소" > <input type="button" onclick="iamport()" id="money" value="결제">
	   	 </div>
	   	 </form>
	 	</div>
	
	 
	 
	 </div>
	 
	 <script>


		
	 function printValue()  {
		 //도토리 
		 const value = document.getElementById('text').value;
		  
		  //가격
		  const result=value*100;
		  if(value>=100&&value<500){
			 const result=(value*100)-(value*10); 
			 document.getElementById("result").innerText = result;
		  }
		  else if(value>=500){
				 const result=(value*100)-(value*20); 
				 document.getElementById("result").innerText = result;
			  }
		  
		  else{
			  
			  const result=value*100;
		
		  document.getElementById("result").innerText = result;
		  }
		   
		} 

	 //활성화 비활성화
	 $(document).ready(function(){
		 
	
		 
		    // 라디오버튼 클릭시 이벤트 발생
		    $("input:radio[name=radio]").click(function(){

		        if($("input[name=radio]:checked").val() == "1"){
		            $("#text").attr("disabled",false);
		            // radio 버튼의 value 값이 1이라면 활성화
		 
		        }else if($("input[name=radio]:checked").val() != "1"){
		              $("#text").attr("disabled",true);
		              $("#text").val("");
		              document.getElementById("result").innerText = 0;
		            // radio 버튼의 value 값이 0이라면 비활성화
		        }
		    });
		    
		
		});

/* 	 $("#text").on("keyup", function() {
		 
		    $(this).val($(this).val().replace(/[^0-9]/g,""));
		  
		}); */


	 $(document).on("keyup", "input[name^=wr_1]", function() {
		    var val= $(this).val();

		    if(val.replace(/[0-9]/g, "").length > 0) {
		        alert("숫자만 입력해 주십시오.");
		        $(this).val('');
		        document.getElementById("result").innerText = 0;
		    }

		    if(val > 1000) {
		        alert("최대 1000개까지 입력이 가능합니다");
		        document.getElementById("result").innerText = 0;
		        $(this).val('');
		    }
		});

	 
		function iamport(){
		   
		
			
			//라디오버튼 선택
		  const result1 = $("input[name=radio]:checked").val();
	<%-- 		const dotori1= $(".c").val();
			const dotori= "<%=request.getAttribute("dotori")%>""; --%>
		  //직접입력
			const result2 = document.getElementById("result").innerText 
			 if($("input[name=radio]:checked").val() == "1"){
				 
				 result=result2;
			
			 }else{
				 
				result=result1;
			 }
			
			
			
			//가맹점 식별코드
			IMP.init('imp50613142');
			IMP.request_pay({
			    pg : 'html5_inicis',
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '도토리충전' , //결제창에서 보여질 이름
			    amount : result, //실제 결제되는 가격
			    buyer_email : 'iamport@siot.do',
			    buyer_name : '구매자이름', 
			    buyer_tel : '010-1234-5678',
			    buyer_addr : '서울 강남구 도곡동',
			    buyer_postcode : '123-456'
			}, function(rsp) {
				console.log(rsp);
			    if ( rsp.success ) {
			    	var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			    } else {
			    	 var msg = '결제에 실패하였습니다.';
			         msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);
			});
		}
		
		 
		
		
		
		
	 </script>
	 
	 
	 
	    
	    <style>
	    #vip{
	    	 position:relative;
	    	 top:20px;
	    }
	    #dotori{
	    object-fit: contain;
	    	 width: 50px;
	    	 height : 50px;
	    }
	    .Title{
	    color:orange;
	    font-weight: bold;
	    font-size:30px;
	    
	    }
	    
	    .c{
	    color:orange;
	    
	    }
	.dotoriBuy{
	width: 800px;
   height: 230px;
    border: 1px solid rgb(221, 219, 219, .7);
    border-radius: 10px;
	    }
	 .dotoriBuy1{
	width: 600px;
   height: 100px;
    border: 1px solid rgb(221, 219, 219, .7);
    border-radius: 10px;
    position:relative;
	left : 100px;
	top: 30px;
	background-color: #f5f5f5 ;
	    }
	    #buy{
	       position:relative;
	    	left : 250px;
			top: 80px;

	    }
	    #money{
	    background-color :orange;

	    }
	    #notice{
	    font-size :13px;
	       position:relative;
	       top: 50px;
	    
	    }
	
	#select{
	 position:relative;
	      
	       left :50px;
	}
	#userdotori{
		 position:relative;
	left:345px;
	font-size:15px;
	top:-40px;
	width: 150px;
   height: 50px;
    
    position:relative;
	}
	#dotorisize{
	 width: 21px;
	 height : 21px;
	 vertical-align:bottom;
	}
	    </style>