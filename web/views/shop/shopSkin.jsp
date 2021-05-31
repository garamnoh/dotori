<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,com.shop.model.vo.Skin"%>
<%
List<Skin> list=(List<Skin>)request.getAttribute("skinList");
Skin s=(Skin)request.getAttribute("skin");
%>  
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/shop/shopProductSkin.css">

<%@ include file="/views/common/shopheader.jsp"%>
<form action="<%=request.getContextPath()%>/shop/skinTable" method="post">
	<%if(list==null&&list.isEmpty()){ %>
		<p>조회된 데이터가 없습니다</p>
	<%}else{%> 
		<table id=SkinTable>
		<% for(int i=0;i<list.size()/3+1;i++){%> 
		<tr>
			<td>
			<div class="productSkin">
				<div class="SkinPicture">
					<img alt="스킨사진" src="<%=request.getContextPath()%>/upload/SKIN_ITEM/<%=list.get(3*i).getFilepath()%>"> 
				</div>
				<br>
                <div class="SkinInfo">
                <input class="shopSkinCheck" type="checkbox">
                <ul>
                    <%-- <li><b>[<%=list.get(3*i).getSinger()%>]</b></li> --%>
                    <li><b><%=list.get(3*i).getSkinTitle() %></b></li>
                    <li><b>도토리 <%=list.get(3*i).getPrice() %>개</b></li>
                </ul>
                <input class="shopSkinCheck" type="checkbox">
                </div>
			</div>
			</td>
			<%if(3*i+1<list.size()) {%>
			<td>
			<div class="productSkin">
				<div class="SkinPicture">
					<img alt="스킨사진" src="<%=request.getContextPath()%>/upload/SKIN_ITEM/<%=list.get(3*i+1).getFilepath()%>"> 
				</div>
				<br>
                <div class="SkinInfo">
                <input class="shopSkinCheck" type="checkbox">
                <ul>
                    <%-- <li><b>[<%=list.get(3*i+1).getTitle()%>]</b></li> --%>
                    <li><b><%=list.get(3*i+1).getSkinTitle() %></b></li>
                    <li><b>도토리 <%=list.get(3*i+1).getPrice() %>개</b></li>
                </ul>
                <input class="shopSkinCheck" type="checkbox">
                </div>
			</div>
			</td>
			<%} %>
			<td>
			<%if(3*i+2<list.size()) {%>
			<div class="productSkin">
				<div class="SkinPicture">
					<img alt="미니미사진" src="<%=request.getContextPath()%>/upload/SKIN_ITEM/<%=list.get(3*i+2).getFilepath()%>"> 
				</div>
				<br>
                <div class="SkinInfo">
                <input class="shopSkinCheck" type="checkbox">
                <ul>
                    <%-- <li><b>[<%=list.get(3*i+2).getSinger()%>]</b></li> --%>
                    <li><b><%=list.get(3*i+2).getSkinTitle() %></b></li>
                    <li><b>도토리 <%=list.get(3*i+2).getPrice() %>개</b></li>
                </ul>
                <input class="shopSkinCheck" type="checkbox">
                </div>
			</div>
			</td>
			<%} %>
		</tr>
		
	<%} 
	}%>
</form>
	