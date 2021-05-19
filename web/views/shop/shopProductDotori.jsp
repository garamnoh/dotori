<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kor">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
     <!-- 외부 스타일시트 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/reset.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/shopProductDotori.css">
    <!-- 폰트 -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700;900&display=swap">
</head>
<body>
    <!-- 이후 추천순 정렬을 위한 3*3 테이블형식 -->
    
     <form>
	<table id="DotoriTable">
        <tr>
            <td>
                <div class="productDotori">
                    <div class="DotoriPicture">
                        <img src="<%=request.getContextPath()%>/images/shopDOTORI.png" alt="[대체]음악사진">
                    </div>
                    <br>
                    <div class="DotoriInfo">
                        <input class="shopDotoriCheck" type="checkbox">
                        <ul>
                            <li><b>[도토리]</b></li>
                            <li><b>20개</b></li>
                            <li><b>2000원</b></li>
                        </ul>
                        <input class="shopDotoriCheck" type="checkbox">
                    </div>  
                </div>
            </td>
            <td>
                <div class="productDotori">
                    <div class="DotoriPicture">
                        <img src="<%=request.getContextPath()%>/images/shopDOTORI.png" alt="[대체]음악사진">
                    </div>
                    <br>
                    <div class="DotoriInfo">
                        <input class="shopMinimiCheck" type="checkbox">
                        <ul>
                            <li><b>[도토리]</b></li>
                            <li><b>50개</b></li>
                            <li><b>5000원</b></li>
                        </ul>
                        <input class="shopDotoriCheck" type="checkbox">
                    </div>  
                </div> 
            </td>
            <td>
                <div class="productDotori">
                    <div class="DotoriPicture">
                        <img src="<%=request.getContextPath()%>/images/shopDOTORI.png" alt="[대체]음악사진">
                    </div>
                    <br>
                    <div class="DotoriInfo">
                        <input class="shopDotoriCheck" type="checkbox">
                        <ul>
                            <li><b>[도토리]</b></li>
                            <li><b>100개</b></li>
                            <li><b>10000원</b></li>
                        </ul>
                        <input class="shopDotoriCheck" type="checkbox">
                    </div>  
                </div> 
            </td>
        </tr>
        <tr>
            <td>
                <div class="productDotori">
                    <div class="DotoriPicture">
                        <img src="<%=request.getContextPath()%>/images/shopDOTORI.png" alt="[대체]음악사진">
                    </div>
                    <br>
                    <div class="DotoriInfo">
                        <input class="shopDotoriCheck" type="checkbox">
                        <ul>
                            <li><b>[도토리]</b></li>
                            <li><b>500개</b></li>
                            <li><b>50000원</b></li>
                        </ul>
                        <input class="shopDotoriCheck" type="checkbox">
                    </div>  
                </div> 
            </td>
       </tr>
       </table>
     </form>
    
    
</body>
</html>