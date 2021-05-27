<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/shop/shopProductDotori.css">
<%@ include file="/views/common/shopheader.jsp"%>
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