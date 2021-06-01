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

<script src="<%=request.getContextPath()%>/js/minihome/leftpage_album.js"></script>