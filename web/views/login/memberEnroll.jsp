<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kor">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DOTORI</title>
    <!-- 외부 스타일시트 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/login/reset.css"><!-- 초기화 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/login/main.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/login/memberenroll.css">
    <!-- 폰트 -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700;900&display=swap">
    <!-- 파비콘 -->
    <link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/images/favicon.ico"/>
</head>
<body>
    <div class="main">
        <!-- 상단 메뉴 -->

    
        <br>
  
      <section class="join">
          <form action="<%=request.getContextPath()%>/memberEnrollEnd" method="post" onsubmit="return fn_id_invalidate();" >
       <p style="font-weight: bold; text-align: center;">회원가입</p>
       
        계정  <br><input type="text" name="memberId" id="email1"required>  @ 
        <input type="text" name="domain" id="domain"  value=""> 
        <select name='selectEmail' id="selectEmail" >
             		<option value="1">직접입력</option>
	                <option value="dotori.com">dotori.com</option>
	                <option value="dreamwiz.com">dreamwiz.com</option> 
	                <option value="freechal.com">freechal.com</option>
	                <option value="gmail.com">gmail.com</option> 
	                <option value="hanmail.net">hanmail.net</option>
	                <option value="korea.com">korea.com</option> 
	                <option value="lycos.co.kr">lycos.co.kr</option> 
	                <option value="nate.com">nate.com</option>
	                <option value="naver.com">naver.com</option>
	                <option value="yahoo.co.kr">yahoo.co.kr</option>

          </select>
        
        
        
        <button type="button" id= "IdCheck" onclick="fn_duplicateId();">확인</button>   
       
        <div id="pwd" >비밀번호  
        <br>  
            <input type="password" name="memberPwd" id="pw" placeholder="5자리 이상"required>
     
        </div>
   
        <div id=pwd2>비밀번호 확인  <br>
           
      
     
            <input type="password" name="memberPwd" id="pwck"  placeholder="5자리 이상"  required><span id="result"></span>
        </div> 
       
    <div id="name">
        이름 <br>	 <input type="text" required name="memberName" id=memberName> 
    </div>

	  <div id="ninkname1">
        닉네임 <br>	 <input type="text" maxlength="10" placeholder="최대 10글자" name="nickname" id= "nickname" > 
        <button type="button" onclick="fn_duplicateNickname();">확인</button>  
    </div>
	<br>
    <div id="no">
        생년월일 <br>   <input type="Date" name="birthDate" maxlength="6" size="8"required>
       <!--  <input type="password" maxlength="7" size="8" id="birth" required> -->
    </div> 
       <br>
      성별<br>  
				<div>
					<input type="radio" name="gender" id="gender0" value="M">
					<label for="gender0">남</label>
					<input type="radio" name="gender" id="gender1" value="F">
					<label for="gender1">여</label>
				</div> 
       <br>
       
    <div >
        핸드폰번호 <br><input type="tel" placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11" required
     size="150" ><br>
    </div>
	<br>
	<div>주소
	<br>
	<input type="text" placeholder="주소입력" name="address"></div>
<!-- <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
<br>
<input type="text" id="sample4_roadAddress" placeholder="도로명주소" size="60" >
<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소"  size="60">
<span id="guide" style="color:#999;display:none"></span>
<input type="text" id="sample4_detailAddress" placeholder="상세주소"  size="60"><br>
<input type="hidden" id="sample4_extraAddress" placeholder="참고항목"  size="60">
<input type="hidden" id="sample4_engAddress" placeholder="영문주소"  size="60" ><br> -->
          
        <button id="cancle" onclick="location.href='SignUp.jsp'">취소</button>  
       
        <button id= "okay">등록</button>    

 </form> 
 
 <form name="duplicateFrm" action="" method="post">
  	<input type="hidden" name="memberId">
  </form>
   <form name="duplicateFrm1" action="" method="post">
  	<input type="hidden" name="nickname">
  </form>
</section>
    </div>
      

        
   
  


    <!-- 외부 js파일 -->
    <script src='<%=request.getContextPath()%>/js/jquery-3.6.0.min.js'></script>
    <script src='<%=request.getContextPath()%>/js/main/contentMain.js'></script>
   <script>
       $('#selectEmail').change(function(){
   $("#selectEmail option:selected").each(function () {
		
		if($(this).val()== '1'){ //직접입력일 경우
			 $("#domain").val('');                        //값 초기화
			 $("#domain").attr("readonly",false); //활성화
		}else{ //직접입력이 아닐경우
			 $("#domain").val($(this).text());      //선택값 입력
			 $("#domain").attr("readonly",true); //비활성화
		}
   });
});

        $("#pwck").keyup((e)=>{   
                   // $("#pwck").blur((e)=>{ //focus반대 
                    let pw=$(e.target).parent().prev().children("input").val();
                    let ck=$(e.target).val();
                    console.log(pw);
                    console.log(ck);
                   
                        
                   
                    	if(pw==ck){
                            $(e.target).next().html("비밀번호가 일치합니다.").css("color","green");
                        }else{
                            $(e.target).next().html("비밀번호가 일치하지 않습니다.").css("color","red");
                          
                           $(e.target).focus();
                        }
                    
                });
             
                
                	
                	 $("#pw").blur((e)=>{ 
                		 
                		 let pw=$(e.target).parent().prev().children("input").val();
                         let ck=$(e.target).val();
                         if(ck.length<5){  
                        	  alert("비밀번호를 5자리이상 입력해주세요");
    
                        	return false;
                         }
                		  
                	 
        				});
                //등록
                const fn_id_invalidate=()=>{
            	
            		const userId=$("#email1").val();/* +$("#domain").val() */
            
            		console.log(userId);
            		if(userId.trim().length<2){
            			alert("계정명은 2글자 이상으로 작성하세요");
            			$("#email1").focus();
            			return false;
            		}
            		
       
            		
            	}      
                //계정명 중복체크
               const fn_duplicateId=()=>{
             		
            	   
           		
            	   
            		const userId=$("#email1").val();/* +$("#domain").val() */
            		const userId2=$("#domain").val();
            		const email=$("#email1").val()+"@"+$("#domain").val();
            		const regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
            		
            		
            		
            		if(userId.trim().length<2){
            			alert("계정명은 2글자 이상으로 작성하세요");
            			$("#email1").focus();
            			return false;
            		}
            		
       
            		
            		if(regExp.test(email)==false){

            			//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐 경우

            			alert("이메일 형식이 올바르지 않습니다.");
            			
            			return false;

            			}
            		
            		if(userId2.replace(/\s|　/gi,'').length==0){
            			alert("이메일을 입력해주세요");
            			$("#domain").focus();
            			return false;
            		}
            		
            
           
            	   
            	   const status="width=300px,height=200px,left=500px,top=500px";
             		const title="duplicateId";
             		const url="<%=request.getContextPath()%>/checkDuplicateId";
             		
             		open("",title,status);
             		
             	//	console.log($("#email1").val()+"@"+$("#domain").val());
     				/* console.log(duplicateFrm); */
             		duplicateFrm.memberId.value=$("#email1").val()+"@"+$("#domain").val();
             		duplicateFrm.target=title;
             		duplicateFrm.action=url;
             		duplicateFrm.submit();  

             		
             		
             		
             	} 
               
               //이름 잠시 보류

   /*             $("#memberName").blur((e)=>{ 
               const name=$(e.target).val();
               const regExpName =/^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
           		if(regExpName.test(name)==false){

    			alert("이름이 올바르지 않습니다.");
    			$("#memberName").focus();
    			return false;
           		}
    			
	
    			
           		}); */
           		
               
               const fn_duplicateNickname=()=>{
            	   
            	   const nickname=$("#nickname").val();
            	   
            	   const status="width=300px,height=200px,left=500px,top=500px";
            		const title="duplicatenickname";
            		const url="<%=request.getContextPath()%>/checkDuplicatenickname";
            		
            		open("",title,status);
            		
            	//	console.log($("#email1").val()+"@"+$("#domain").val());
    				/* console.log(duplicateFrm); */
            		duplicateFrm1.nickname.value=$("#nickname").val();
            		duplicateFrm1.target=title;
            		duplicateFrm1.action=url;
            		duplicateFrm1.submit();  

            	   
               }
                        /*     $("#phone").blur((e)=>{ 
               
	 		const phone =$("#phone").val();
  			const regExphone = /^\d{3}\d{3,4}\d{4}$/;
  			if(!regExphone.test($("input[id='phone']").val())) {
  				alert("전화번호 형식이 올바르지 않습니다.");
  				
  			}; 
             }); */
  			
			
   </script>
   <!-- <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
   <script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
         
                document.getElementById("sample4_engAddress").value = data.addressEnglish;
                       
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script> -->
</body>
</html>