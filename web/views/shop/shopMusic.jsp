<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,com.shop.model.vo.Music"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/shop/shopProductMusic.css">

<%
List<Music> list=(List<Music>)request.getAttribute("musicList");
	System.out.println("list길이"+list.size());
	Music m=(Music)request.getAttribute("music");
%> 
<%@ include file="/views/common/shopheader.jsp"%>

<form action="<%=request.getContextPath()%>/shop/musicTable" method="post">
	<%if(list==null&&list.isEmpty()){ %>
		<p>조회된 데이터가 없습니다</p>
	<%}else{%> 
		<table>
		<% for(int i=0;i<list.size()/3+1;i++){%>
		<%System.out.println("i테스트"+i); %> 
		<tr>
			<td>
			<div class="productMusic">
				<div class="MusicPicture">
					<img alt="음악사진" src="<%=request.getContextPath()%>/upload/MUSIC/<%=list.get(3*i).getImgFilepath()%>"> 
				</div>
				<br>
                <div class="MusicInfo">
                <input class="shopMusicCheck" type="checkbox">
                <ul>
                    <li><b>[<%=list.get(3*i).getSinger()%>]</b></li>
                    <li><b><%=list.get(3*i).getMusicTitle() %></b></li>
                    <li><b>도토리 <%=list.get(3*i).getPrice() %>개</b></li>
                </ul>
                <input class="shopMusicCheck" type="checkbox">
                </div>
			</div>
			</td>
			<%if(3*i+1<list.size()) {%>
			<td>
			<div class="productMusic">
				<div class="MusicPicture">
					<img alt="음악사진" src="<%=request.getContextPath()%>/upload/MUSIC/<%=list.get(3*i+1).getImgFilepath()%>"> 
				</div>
				<br>
                <div class="MusicInfo">
                <input class="shopMusicCheck" type="checkbox">
                <ul>
                    <li><b>[<%=list.get(3*i+1).getSinger()%>]</b></li>
                    <li><b><%=list.get(3*i+1).getMusicTitle() %></b></li>
                    <li><b>도토리 <%=list.get(3*i+1).getPrice() %>개</b></li>
                </ul>
                <input class="shopMusicCheck" type="checkbox">
                </div>
			</div>
			</td>
			<%} %>
			<td>
			<%if(3*i+2<list.size()) {%>
			<div class="productMusic">
				<div class="MusicPicture">
					<img alt="음악사진" src="<%=request.getContextPath()%>/upload/MUSIC/<%=list.get(3*i+2).getImgFilepath()%>"> 
				</div>
				<br>
                <div class="MusicInfo">
                <input class="shopMusicCheck" type="checkbox">
                <ul>
                    <li><b>[<%=list.get(3*i+2).getSinger()%>]</b></li>
                    <li><b><%=list.get(3*i+2).getMusicTitle() %></b></li>
                    <li><b>도토리 <%=list.get(3*i+2).getPrice() %>개</b></li>
                </ul>
                <input class="shopMusicCheck" type="checkbox">
                </div>
			</div>
>>>>>>> ab91a260ef5aa254abbfe2607af4f063aa83f877
			</td>
			<%} %>
		</tr>
		
	<%} 
	}%>
</form>

