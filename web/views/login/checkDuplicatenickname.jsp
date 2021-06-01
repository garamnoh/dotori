<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	boolean result=(boolean)request.getAttribute("result");
	String nickname=(String)request.getAttribute("nickname");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>닉네임 중복확인</title>
<style>
	div#checkid-container{
		text-align:center;padding-top:50px;
	}
	span#duplicated{
	color:red; font-weight:bold;
	}
	span#duplicated1{
	color:green; font-weight:bold;
	}

</style>
</head>
<body>
	<div id="checkId-container">
		<%if(result){ %>
			[<span id="duplicated1"><%=nickname%></span>]는 사용가능합니다.	
			<br><br>
		<button type="button" onclick="fn_close();">닫기</button>
		<%}else{ %>
			[<span id="duplicated"><%=nickname %></span>]는 사용중입니다.
			<br><br>
			
			<!-- 아이디 재입력창 구성 -->
			<form action="<%=request.getContextPath() %>/checkDuplicatenickname" method="post">
				<input type="text" name="nickname" id="nickname" placeholder='최대 10글자 입력'>
				
				
				<input type="submit" value="중복검사" >
			</form>
				
				
			
		<%} %>
	</div>
	<script>
	 const fn_close=()=>{
	
	opener.document.getElementById("nickname").value="<%=nickname%>";

	
<%-- 	if(<%=domain%>==<%=selectEmail%>!){
		opener.document.getElementById("selectEmail").value="1";
		
	} --%>
	window.close(); /* 윈도우 닫기 */
	
	 }
	
	</script>
</body>
</html>