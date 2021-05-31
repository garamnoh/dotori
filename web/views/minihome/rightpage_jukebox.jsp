<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,com.shop.model.vo.Music"%>
<%
	List<String> albumList=(List<String>)request.getAttribute("albumList");
	String album=(String)request.getAttribute("album");
	List<Music> musicList=(List<Music>)request.getAttribute("musicList");
%>
<style>
    .audio-box{
        border:1px solid white;
        border-radius:10px;
        background-color:white;
        box-sizing:border-box;
        width:320px;
        height:120px;
        text-align:center;
        font-weight:bold;
        margin:10px 10px;
    }
</style>

<select id="chooseFolder">
	<%for(int i=0;i<albumList.size();i++) {%>
		<option value="<%=albumList.get(i)%>"><%=albumList.get(i)%></option>
	<%} %>
</select>
<input type="button" id="changeBtn" value="폴더 이동"><br>

<div id="jukeboxContainer">
	<%if(musicList!=null) {%>
		<%for(int i=0;i<musicList.size();i++) {%>
			<input type="checkbox" name="changeFolder">
			<input type="hidden" value="<%=musicList.get(i).getMusicNo()%>">
			<div class="audio-box">
				<p><%=musicList.get(i).getMusicTitle()%>_<%=musicList.get(i).getSinger()%><p>
				<audio src="<%=request.getContextPath()%>/audio/<%=musicList.get(i).getFilepath()%>" controls></audio>
			</div>
		<%} %>
	<%} %>
</div>

<input type="hidden" id="currentAlbum" value="<%=album%>">

<script src="<%=request.getContextPath()%>/js/minihome/rightpage_jukebox.js"></script>