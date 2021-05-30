<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,com.shop.model.vo.Music"%>
<%
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
<%if(musicList!=null) {%>
	<%for(int i=0;i<musicList.size();i++) {%>
		<div class="audio-box">
			<p><%=musicList.get(i).getMusicTitle()%>_<%=musicList.get(i).getSinger()%></p>
			<audio src="<%=request.getContextPath()%>/audio/<%=musicList.get(i).getFilepath()%>" controls></audio>
		</div>
	<%} %>
<%} %>