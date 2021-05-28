<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,com.shop.model.vo.MusicItem"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/shop/shopProductMusic.css">

<%
	List<MusicItem> list=(List<MusicItem>)request.getAttribute("musicList");
	MusicItem m=(MusicItem)request.getAttribute("music");
%> 
<%@ include file="/views/common/shopheader.jsp"%>

<form action="<%=request.getContextPath()%>/shop/musicTable" method="post">
	<%if(list==null&&list.isEmpty()){ %>
		<p>조회된 데이터가 없습니다</p>
	<%}else{%> 
		<table>
		<% for(int i=0;i<list.size();i++){%> 
		<tr>
			<td>
			<div class="productMusic">
				<div class="MusicPicture">
					<img alt="음악사진" src="<%=request.getContextPath()%>/upload/MUSIC/<%=list.get(i).getImgPath()%>"> 
				</div>
				<br>
                <div class="MusicInfo">
                <input class="shopMusicCheck" type="checkbox">
                <ul>
                    <li><b>[<%=list.get(i).getSinger()%>]</b></li>
                    <li><b><%=list.get(i).getMusicTitle() %></b></li>
                    <li><b>도토리 <%=list.get(i).getPrice() %>개</b></li>
                </ul>
                <input class="shopMusicCheck" type="checkbox">
                </div>
			</div>
			</td>
			<% i++;%>
			<td>
			<div class="productMusic">
				<div class="MusicPicture">
					<img alt="음악사진" src="<%=request.getContextPath()%>/upload/MUSIC/<%=list.get(i).getImgPath()%>"> 
				</div>
				<br>
                <div class="MusicInfo">
                <input class="shopMusicCheck" type="checkbox">
                <ul>
                    <li><b>[<%=list.get(i).getSinger()%>]</b></li>
                    <li><b><%=list.get(i).getMusicTitle() %></b></li>
                    <li><b>도토리 <%=list.get(i).getPrice() %>개</b></li>
                </ul>
                <input class="shopMusicCheck" type="checkbox">
                </div>
			</div>
			</td>
			<% i++; %>
			<td>
			<div class="productMusic">
				<div class="MusicPicture">
					<img alt="음악사진" src="<%=request.getContextPath()%>/upload/MUSIC/<%=list.get(i).getImgPath()%>"> 
				</div>
				<br>
                <div class="MusicInfo">
                <input class="shopMusicCheck" type="checkbox">
                <ul>
                    <li><b>[<%=list.get(i).getSinger()%>]</b></li>
                    <li><b><%=list.get(i).getMusicTitle() %></b></li>
                    <li><b>도토리 <%=list.get(i).getPrice() %>개</b></li>
                </ul>
                <input class="shopMusicCheck" type="checkbox">
                </div>
			</div>
			</td>
			
		</tr>
		
	<%} 
	}%>
</form>

