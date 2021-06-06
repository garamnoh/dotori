<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List"%>
<%
	List<String> albumList=(List<String>)request.getAttribute("albumList");
	String currentFolder=(String)request.getAttribute("currentFolder");
	int[] countArr=(int[])request.getAttribute("countArr");
%>
<div id="jukebox-menu-container">
	<p class="music-title">MUSIC</p>
	
	<nav class="albums">
	    <ul id="jukeboxMenu">
	    	<%for(int i=0;i<albumList.size();i++) {%>
		    	<%if(albumList.get(i).equals(currentFolder)) {%>
		    		<li style="text-decoration:underline;"><%=albumList.get(i)%>[<%=countArr[i]%>]</li>
		    	<%}else {%>
		    		<li><%=albumList.get(i)%>[<%=countArr[i]%>]</li>
		    	<%} %>
	        <%} %>
	    </ul>
	</nav>
	
	<div id="addAlbumBox">
		<input type="text" id="newAlbumTitle" placeholder="앨범명 입력" size="10">
		<input type="button" id="addAlbum" value="앨범 추가">
	</div>
	<div id="deleteAlbumBox">
		<select id="albumForDelete">
			<%for(int i=0;i<albumList.size();i++) {%>
				<option value="<%=albumList.get(i)%>"><%=albumList.get(i)%></option>
			<%} %>
		</select>
		<input type="button" id="deleteAlbum" value="앨범 삭제">
	</div>
</div>

<script src="<%=request.getContextPath()%>/js/minihome/leftpage_jukebox.js"></script>