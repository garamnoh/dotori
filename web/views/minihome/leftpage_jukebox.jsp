<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List"%>
<%
	List<String> albumList=(List<String>)request.getAttribute("albumList");
%>
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

<script src="<%=request.getContextPath()%>/js/minihome/leftpage_jukebox.js"></script>