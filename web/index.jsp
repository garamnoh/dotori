<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kor">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DOTORI</title>
   <!--외부 스타일 시트-->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/login.css">
 <link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/images/favicon.ico"/>
  
</head>
<body>
    <div class="center1">
        <div id="title">
   
            <form action="login.do" method="post">
	            <input type="text" name="localPart" id="localPart" placeholder="username"required >  <label id="gol">@</label> 
	            <input type="text" name="domain" id="domain"  value=""> 
	            <select name='selectEmail' id="selectEmail">
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
	            <input type="password" name="password" id="password" placeholder="*******" required>
	            <img src="<%=request.getContextPath()%>/images/logo_main.png" alt="">
	            <input type="submit" id="login" value="로그인">
            </form>
            
            
            
    
            <p><a href="views/IdpwSearch.jsp">아이디 </a>/<a href="views/IdpwSearch.jsp">비밀번호 찾기</a></p>
       
            <hr>
            <button id="new" onClick="location.href='views/SignUp.jsp'">새 계정 만들기</button>
        
       
        </div>
    </div>
     <!-- 외부 js파일 -->
     <script src='<%=request.getContextPath()%>/js/jquery-3.6.0.min.js'></script>
     <script src='<%=request.getContextPath()%>/js/main.js'></script>
     <script>
                        $('#selectEmail').change(function(){
        $("#selectEmail option:selected").each(function () {
                
                if($(this).val()== '1'){ //직접입력일 경우
                    $("#domain").val('');                        //값 초기화
                    $("#domain").attr("disabled",false); //활성화
                }        
                else{ 
                	//직접입력이 아닐경우
                	 
                  $("#domain").val($(this).text());     //선택값 입력
                    $("#domain").attr("readonly",true); //읽기전용
                }
               

            
                
            });
        });
     </script>
</body>
</html>