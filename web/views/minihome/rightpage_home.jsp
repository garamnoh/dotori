<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,com.minihome.album.model.vo.Album,com.minihome.diary.model.vo.Diary"%>
<%
	List<Album> latestAlbumList=(List<Album>)request.getAttribute("latestAlbumList");
	List<Diary> latestDiaryList=(List<Diary>)request.getAttribute("latestDiaryList");
%>


<p>미니홈피는 개발 중입니다. <strong>관리자 계정</strong>으로 접속하여 구경해주세요~ 싫음 말구</p>

<div style="border:1px solid black;padding:10px">
	<p>새로운 소식<p>
	<%for(int i=0;i<latestAlbumList.size();i++) {%>
		<span style="background-color:orange;color:white;font-weight:bolder;">앨범</span>
		<span>
			<%=latestAlbumList.get(i).getTitle()%> / <%=latestAlbumList.get(i).getPostDate()%>
		</span>
		<br>
	<%} %>
	<%for(int i=0;i<latestDiaryList.size();i++) {%>
		<span style="background-color:pink;color:white;font-weight:bolder;">다이어리</span>
		<span>
			<%=latestDiaryList.get(i).getWriter()%> / <%=latestDiaryList.get(i).getPostDate()%>
		</span>
		<br>
	<%} %>
</div>

<script src="<%=request.getContextPath()%>/js/minihome/rightpage_home.js"></script>