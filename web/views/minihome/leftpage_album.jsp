<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List"%>
<%
	List<String> folderList=(List<String>)request.getAttribute("folderList");
%>

<h1>ALBUM</h1>

<ul id="albumMenu">
	<%for(int i=0;i<folderList.size();i++) {%>
		<li style="color:slateblue;margin:20px;cursor:pointer;"><%=folderList.get(i)%></li>
	<%} %>
</ul>

<input type="text" id="addFolderTitle" placeholder="추가할 폴더명을 입력하세요">
<input type="button" id="addFolderBtn" value="폴더 추가"><br><br>

<select id="deleteFolderTarget">
	<%for(int i=0;i<folderList.size();i++) {%>
		<option value="<%=folderList.get(i)%>"><%=folderList.get(i)%></option>
	<%} %>
</select>
<input type="button" id="deleteFolderBtn" value="폴더 삭제">

<script src="<%=request.getContextPath()%>/js/minihome/leftpage_album.js"></script>