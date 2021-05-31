<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List"%>
<%
	List<String> albumList=(List<String>)request.getAttribute("albumList");
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/minihome/leftpage_jukebox.css">
<style>
    .music-title{
        /* border:1px solid black; */
        margin-top:0;
        font-weight:bolder;
        font-size:30px;
    }
    .albums li{
        list-style-image:url(albumIcon.ico);
        margin-bottom:10px;
        color:slateblue;
    }
    .albums{
        /* border:1px solid black; */
    }
</style>

<p class="music-title">MUSIC</p>

<nav class="albums">
    <ul id="jukeboxMenu">
    	<%for(int i=0;i<albumList.size();i++) {%>
	    	<li><%=albumList.get(i)%></li>
        <%} %>
    </ul>
</nav>

<input type="text" id="newAlbumTitle" placeholder="앨범명을 입력하세요"><br>
<input type="button" id="addAlbum" value="앨범 추가"><br><br>
<label for="albumForDelete">삭제할 앨범</label>
<select id="albumForDelete">
	<%for(int i=0;i<albumList.size();i++) {%>
		<option value="<%=albumList.get(i)%>"><%=albumList.get(i)%></option>
	<%} %>
</select>
<input type="button" id="deleteAlbum" value="앨범 삭제">

<script src="<%=request.getContextPath()%>/js/minihome/leftpage_jukebox.js"></script>