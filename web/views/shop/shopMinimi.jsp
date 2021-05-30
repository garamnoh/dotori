<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,com.shop.model.vo.Minimi"%>
<%
List<Minimi> list=(List<Minimi>)request.getAttribute("minimiList");
Minimi mini=(Minimi)request.getAttribute("minimi");
%> 
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/shop/shopProductMinimi.css">
<%@ include file="/views/common/shopheader.jsp"%>
<form action="<%=request.getContextPath()%>/shop/minimiTable" method="post">
	<%if(list==null&&list.isEmpty()){ %>
		<p>조회된 데이터가 없습니다</p>
	<%}else{%> 
		<table id=minimiTable>
		<% for(int i=0;i<list.size()/3+1;i++){%> 
		<tr>
			<td>
			<div class="productMinimi">
				<div class="MinimiPicture">
					<img alt="미니미사진" src="<%=request.getContextPath()%>/upload/MINIMI/<%=list.get(3*i).getFilepath()%>"> 
				</div>
				<br>
                <div class="MinimiInfo">
                <input class="shopMinimiCheck" type="checkbox">
                <ul>
                    <%-- <li><b>[<%=list.get(3*i).getSinger()%>]</b></li> --%>
                    <li><b><%=list.get(3*i).getTitle() %></b></li>
                    <li><b>도토리 <%=list.get(3*i).getPrice() %>개</b></li>
                </ul>
                <input class="shopMinimiCheck" type="checkbox">
                </div>
			</div>
			</td>
			<%if(3*i+1<list.size()) {%>
			<td>
			<div class="productMinimi">
				<div class="MinimiPicture">
					<img alt="미니미사진" src="<%=request.getContextPath()%>/upload/MINIMI/<%=list.get(3*i+1).getFilepath()%>"> 
				</div>
				<br>
                <div class="MinimiInfo">
                <input class="shopMinimiCheck" type="checkbox">
                <ul>
                    <%-- <li><b>[<%=list.get(3*i+1).getTitle()%>]</b></li> --%>
                    <li><b><%=list.get(3*i+1).getTitle() %></b></li>
                    <li><b>도토리 <%=list.get(3*i+1).getPrice() %>개</b></li>
                </ul>
                <input class="shopMinimiCheck" type="checkbox">
                </div>
			</div>
			</td>
			<%} %>
			<td>
			<%if(3*i+2<list.size()) {%>
			<div class="productMinimi">
				<div class="MinimiPicture">
					<img alt="미니미사진" src="<%=request.getContextPath()%>/upload/MINIMI/<%=list.get(3*i+2).getFilepath()%>"> 
				</div>
				<br>
                <div class="MinimiInfo">
                <input class="shopMinimiCheck" type="checkbox">
                <ul>
                    <%-- <li><b>[<%=list.get(3*i+2).getSinger()%>]</b></li> --%>
                    <li><b><%=list.get(3*i+2).getTitle() %></b></li>
                    <li><b>도토리 <%=list.get(3*i+2).getPrice() %>개</b></li>
                </ul>
                <input class="shopMinimiCheck" type="checkbox">
                </div>
			</div>
			</td>
			<%} %>
		</tr>
		
	<%} 
	}%>
</form>
