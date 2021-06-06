<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,com.shop.model.vo.Music"%>
<%
	List<String> albumList=(List<String>)request.getAttribute("albumList");
	String album=(String)request.getAttribute("album");
	List<Music> musicList=(List<Music>)request.getAttribute("musicList");
%>

<%if(album!=null&&album.equals("내 모든 음악")) {%>
	<style>
		.audio-box{
			width:460px;
		}
		.audio-box>audio{
			right:5px;
		}
		.audio-box>div{
			margin-left:10px;
		}
	</style>
<%} %>

<div class="jukebox-controller">
	<%if(!album.equals("내 모든 음악")) {%>
		<input type="button" id="changePlaySeqBtn" value="순서 변경">
		<select id="jukeboxChooseFolder">
			<%for(int i=0;i<albumList.size();i++) {%>
				<option value="<%=albumList.get(i)%>"><%=albumList.get(i)%></option>
			<%} %>
		</select>
		<input type="button" id="changeBtn" value="폴더 이동">
	<%} %>
	<div class="jukebox-tooltip">?
		<div class="jukebox-tooltip-text">
			<ol>
				<li>배경음악으로 재생하려면 음악을 '배경음악' 앨범에 넣어주세요</li>
				<li>삭제된 앨범 안의 음악들은 모두 '기본앨범'으로 이동합니다</li>
				<li>오른쪽의 숫자 상자에 순서를 입력하고 '순서 변경' 버튼을 클릭해주세요</li>
				<li>'배경음악' 안의 음악들은 숫자가 작은 것부터 나열되고 실행됩니다</li>
				<li>다른 앨범의 음악들은 나열 순서에만 영향을 미칩니다</li>
			</ol>
		</div>
	</div>
</div>

<hr>

<div id="jukeboxContainer">
	<%if(musicList!=null) {%>
		<%if(musicList.isEmpty()) {%>
			<div>
				<strong><%=album%></strong> 폴더에 들어있는 음악이 없습니다
			</div>
		<%}else if(musicList.get(0).getMusicNo()==0) {%>
			<div>
				<strong><%=album%></strong> 폴더에 들어있는 음악이 없습니다
			</div>
		<%}else {%>
			<%for(int i=0;i<musicList.size();i++) {%>
				<div class="audio-box">
					<%if(!album.equals("내 모든 음악")) {%>
						<input type="checkbox" name="changeFolder">
						<input type="hidden" value="<%=musicList.get(i).getMusicNo()%>">
					<%} %>				
					<div><%=musicList.get(i).getMusicTitle()%>,</div>
					<div><%=musicList.get(i).getSinger()%></div>
					<audio src="<%=request.getContextPath()%>/audio/<%=musicList.get(i).getFilepath()%>" controls></audio>
					<%if(!album.equals("내 모든 음악")) {%>
						<input type="number" class="playSeq" value="<%=i+1%>">
						<input type="hidden" value="<%=musicList.get(i).getMusicNo()%>">
					<%} %>
				</div>
			<%} %>
		<%} %>
	<%} %>
</div>

<input type="hidden" id="currentAlbum" value="<%=album%>">

<script src="<%=request.getContextPath()%>/js/minihome/rightpage_jukebox.js"></script>