<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	boolean result=(boolean)request.getAttribute("result");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복확인</title>
<style>
	div#checkid-container{
		text-align:center;padding-top:50px;
	}
	span#duplicated{
	color:red; font-weight:bold;
	}

</style>
</head>
<body>
	<div id="checkId-container">
		<%if(result){ %>
			[<span><%=request.getParameter("memberId") %></span>]는 사용가능합니다.	
			<br><br>
			<button type="button" onclick="fn_close();">닫기</button>
		<%}else{ %>
			[<span id="duplicated"><%=request.getParameter("memberId") %></span>]는 사용중입니다.
			<br><br>
			<!-- 아이디 재입력창 구성 -->
			<form action="<%=request.getContextPath() %>/checkDuplicateId" method="post">
				<input type="text" name="memberId" id="userId">
				<input type="submit" value="중복검사" >
			</form>
		<%} %>
	</div>
	
	<script>
	 const fn_close=()=>{
	opener.document.getElementById("userId_").value='<%=request.getParameter("memberId")%>';
	opener.document.getElementById("password").focus();
	window.close(); /* 윈도우 닫기 */
		 
	 }
	
	</script>
</body>
</html>