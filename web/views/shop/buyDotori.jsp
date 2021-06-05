<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<br>   <img id="dotori" src="<%=request.getContextPath()%>/images/shopDOTORI.png" >
	    <span class="Title">도토리 충전</span>
	 <br>
	 <div class="dotoriBuy">
	 	<div class="dotoriBuy1">
	 	<form>
	 	<br>
	 	<div id="select">
	 	<label><input type="radio" name="radio" value="0" ><span class="c">10</span>개(1000원)</label>
	 	 <label><input type="radio" name="radio" value="0" ><span class="c">30</span>개(3000원)</label>
	 	 <label><input type="radio" name="radio" value="0" ><span class="c">50</span>개(5000원)</label>
	 	 <label><input type="radio" name="radio" value="0" ><span class="c">100</span>개(9000원)</label>
	 	 <div id="vip">
	     <label><input type="radio" name="radio" value="0" ><span class="c">300</span>개(27000원)</label>
	   	 <label><input type="radio" name="radio" value="0" ><span class="c">500</span>개(40000원)</label>

	   	  <label><input type="radio" value="1" name="radio" checked ><span>직접입력</span>
	   	  <input type="text"  id="text" name = "wr_1"placeholder="최대1000개" size=8 maxlength=4 max=1000 onkeyup='printValue();' onkeypress="inNumber();"/>
	   	  개(<span id='result'></span>)원</label>
		</div>
		
	   
	
	   	 <div id="notice">※100개 이상 구매 시 10% , 500개 이상 구매 시 20% SALE</div>
	   	 </div>
	   
	   	 <div id="buy">
	<input type='reset' value="취소" > <button onclick="requestPay()" id="money">결제</button>
	   	 </div>
	   	 </form>
	 	</div>
	
	 
	 
	 </div>
	 
	 <script>


		
	 function printValue()  {
		  const value = document.getElementById('text').value;
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

	 
	 $(document).ready(function(){
		 
		    // 라디오버튼 클릭시 이벤트 발생
		    $("input:radio[name=radio]").click(function(){
		 
		        if($("input[name=radio]:checked").val() == "1"){
		            $("#text").attr("disabled",false);
		            // radio 버튼의 value 값이 1이라면 활성화
		 
		        }else if($("input[name=radio]:checked").val() == "0"){
		              $("#text").attr("disabled",true);
		              $("#text").val("");
		              document.getElementById("result").innerText = ""
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
		    }

		    if(val > 1000) {
		        alert("최대 1000개까지 입력이 가능합니다");
		        document.getElementById("result").innerText = ""
		        $(this).val('');
		    }
		});

	 
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
	    </style>