<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,com.minihome.album.model.vo.Album,com.minihome.model.vo.LatestDiaryInfo"%>
<%
	List<Album> latestAlbumList=(List<Album>)request.getAttribute("latestAlbumList");
	List<LatestDiaryInfo> latestDiaryList=(List<LatestDiaryInfo>)request.getAttribute("latestDiaryList");
	String colorStr=(String)request.getAttribute("colorStr");
%>

<div class="latestUploadBox">
	<p>새로운 소식<p>
	
	<%for(int i=0;i<latestAlbumList.size();i++) {%>
		<div class="latestAlbumBox">
			<span style="background-color:orange;color:white;font-weight:bolder;padding:3px;">앨범</span>
			<span>
				<%=latestAlbumList.get(i).getTitle()%> / <%=latestAlbumList.get(i).getFolder()%> / <%=latestAlbumList.get(i).getPostDate()%>
			</span>
		</div>
	<%} %>
	
	<%for(int i=0;i<latestDiaryList.size();i++) {%>
		<div class="latestDiaryBox">
			<span style="background-color:pink;color:white;font-weight:bolder;padding:3px;">다이어리</span>
			<span>
				<%=latestDiaryList.get(i).getNickname()%>(<%=latestDiaryList.get(i).getWriter()%>) / <%=latestDiaryList.get(i).getFolderName()%> / <%=latestDiaryList.get(i).getPostDate()%>
			</span>
		</div>
	<%} %>
</div>

<hr>

<div id="drawing-signal-box"><p>시그널 보내~ 시그널 보내~ 찌릿찌릿!</p></div>

<div id="color-selector-box">
	<label for="color-selector">색상 선택</label>
	<input type="color" id="color-selector">
</div>

<input type="button" id="resetAllColor" value="전체 칠하기">

<div class="drawing-signal-question">?</div>
<ul class="drawing-signal-explanation">
	<li>당신의 마음을 그림으로 표현해서 전달하세요</li>
	<li>손님은 누구나 그릴 수 있습니다</li>
	<li>그림은 데이터베이스에 저장되며, 웹 소켓으로 실시간 반영됩니다</li>
</ul>

<img src="<%=request.getContextPath()%>/images/minihome/하와이에서 만난 친구들.png" class="hawaiianFriends">
<img src="<%=request.getContextPath()%>/images/minihome/곰돌이의 유혹.png" class="lureOfBear">

<input type="hidden" id="colorStrVal" value="<%=colorStr%>">

<script src="<%=request.getContextPath()%>/js/minihome/rightpage_home.js"></script>