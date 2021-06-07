<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List"%>
<%
	List<String> folderList=(List<String>)request.getAttribute("folderList");
	int[] albumCountArr=(int[])request.getAttribute("albumCountArr");
	String currentFolder=(String)request.getAttribute("currentFolder");
	if(currentFolder==null) currentFolder="내 모든 사진";
%>
<div class="album-menu-container">
	<p class="album-title">ALBUM</p>
	
	<nav class="albums">
		<ul id="albumMenu">
			<%for(int i=0;i<folderList.size();i++) {%>
				<%if(currentFolder.equals(folderList.get(i))) {%>
					<li style="text-decoration:underline;"><%=folderList.get(i)%>[<%=albumCountArr[i]%>]</li>
				<%}else {%>
					<li><%=folderList.get(i)%>[<%=albumCountArr[i]%>]</li>
				<%} %>
			<%} %>
		</ul>
	</nav>
	
	<input type="button" id="uploadPhotoBtn" value="새로운 사진 올리기">
	
	<div id="addAlbumFolderBox">
		<input type="text" id="addFolderTitle" placeholder="앨범명 입력" size="10">
		<input type="button" id="addFolderBtn" value="폴더 추가">
	</div>
	
	<div id="deleteAlbumFolderBox">
		<select id="deleteFolderTarget">
			<%for(int i=0;i<folderList.size();i++) {%>
				<option value="<%=folderList.get(i)%>"><%=folderList.get(i)%></option>
			<%} %>
		</select>
	<input type="button" id="deleteFolderBtn" value="폴더 삭제">
	</div>
</div>

<script src="<%=request.getContextPath()%>/js/minihome/leftpage_album.js"></script>