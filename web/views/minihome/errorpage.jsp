<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	@font-face {
	    font-family: 'ROKABold';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2104@1.1/ROKABold.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	#one{
		width:100%;
		height:600px;				
	}
	#two{		
		font-weight:bold;
		font-size:30px;
		text-align:center;
		font-family:'ROKABold';
		margin-top: 120px;
	}
	#three{
		text-align:center;
	}

</style>
<title>미니홈피</title>
</head>
<body>
	<div id="one">
		<div id="two">로그인을 다시 해주세요</div>
		<div id="three">
			<img src="<%= request.getContextPath() %>/images/minihome/error.jpg" alt="에러">		
		</div>
	</div>
</body>
</html>