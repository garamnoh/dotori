<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kor">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>contentShop</title>
    <%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/css/reset.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/contentShop.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700;900&display=swap">
 	--%>
 
<!-- 외부 스타일시트 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/reset.css">
    
    <!-- 초기화 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/contentShop.css">
    <!-- 폰트 -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700;900&display=swap">

</head>
<body>
    <div class="container">
        <div class="shopTop">
            <div class="shopTopLeft"></div>
                <!-- <p>SHOP</p> -->
                <iframe src="shopSearch.jsp"></iframe>
            </div>
    
            <div class="shopTopRight">
                 <iframe src="shopTopTap.jsp" class="shopTopTap"></iframe>
            </div> 
        </div>

        <div class="test2">
            <iframe src="shopProductMusic.jsp" class="shopProductMusic"></iframe>
        </div>
    </div>
    
    <script src='../js/jquery-3.6.0.min.js'></script>
    <scrip src='../js/contentShopTest.js'></scrip>
</body>
</html>