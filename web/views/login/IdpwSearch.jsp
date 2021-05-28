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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/login/idpwSearch.css">
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

<div id="a">
      <p id="title">아이디 찾기</p>
     
      <div id="id1">
             이름 : <input type="text" name="name">
   

   
        주민등록번호 :<input type="text" maxlength="6" size="10">-
        <input type="password" maxlength="7"  id="no1">
        <button id="ok">확인</button>
    </div> 
</div>

    <div id="b">
    <p id="title">비밀번호 찾기</p>
   
    <div id="id1">
        계정 : <input type="text" name="userId">@
        <input type="text" name="domain" id="domain"  value=""> 

        <select name='selectEmail' id="selectEmail">
        
                   <option value="1">직접입력</option>
            <option value='dotori.com'>dotori.com</option>
            <option value="dreamwiz.com">dreamwiz.com</option> 
            <option value="freechal.com">freechal.com</option>
            <option value="gmail.com">gmail.com</option> 
            <option value='hanmail.net'>hanmail.net</option>
            <option value="korea.com">korea.com</option> 
            <option value="lycos.co.kr">lycos.co.kr</option> 
            <option value='nate.com'>nate.com</option>
            <option value='naver.com'>naver.com</option>
            <option value='yahoo.co.kr'>yahoo.co.kr</option>
   

          </select>
                  <button id=email>이메일인증</button>
                <br>
        </div>
        <div id="id2">
           이름 : <input type="text" name="name">
 

 
      주민등록번호 :<input type="text" maxlength="6" size="10">-
        <input type="password" maxlength="7" id="no1">
      <button id="ok">확인</button>
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
		}else{ //직접입력이 아닐경우
			 $("#domain").val($(this).text());      //선택값 입력
			 $("#domain").attr("readonly",true); //비활성화
		}
   });
});
   </script>
</body>
</html>