<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,com.minihome.album.model.vo.Album,com.minihome.album.model.vo.AlbumComment"%>
<%
	List<Album> albumList=(List<Album>)request.getAttribute("albumList");
	List<String> folderList=(List<String>)request.getAttribute("folderList");
	String folder=(String)request.getAttribute("folder");
	List<AlbumComment> commentList=(List<AlbumComment>)request.getAttribute("commentList");
	String pageBar=(String)request.getAttribute("pageBar");
%>
<p>처음 들어갔을 때는 모든 사진을 보여주며, 폴더 변경을 할 수 없습니다</p>
<p>왼쪽 폴더를 클릭하여 선택하면 각 폴더 안의 사진을 보여주며, 폴더 변경을 할 수 있습니다</p>
<p>폴더를 삭제하면 그 안의 사진들은 '기본폴더'로 들어가며 기본폴더는 삭제할 수 없습니다</p>

<%if(folder!=null) {%>
	<select id="changeFolderTarget">
		<%for(int i=0;i<folderList.size();i++) {%>
			<option value="<%=folderList.get(i)%>"><%=folderList.get(i)%></option>
		<%} %>
	</select>
	<input type="button" id="changeFolderBtn" value="폴더 변경">
<%} %>

<div id="albumBox" style="text-align:center;">
	<%for(int i=0;i<albumList.size();i++) {%>
		<%if(folder!=null) {%>
			<input type="checkbox">
			<input type="hidden" value="<%=albumList.get(i).getImgNo()%>">
		<%} %>
		<div style="border:1px solid black; padding:20px 20px; width:400px;">
			<p><%=albumList.get(i).getTitle()%></p>
			<img src="<%=request.getContextPath()%>/upload/photo/<%=albumList.get(i).getFilepath()%>" width="400px">
			<p><%=albumList.get(i).getContent()%>
			<p><%=albumList.get(i).getPostDate()%></p>
			<input type="button" onclick="fn_openCommentBox(event);" value="댓글 보기">
			<input type="text"><input type="button" value="댓글 달기" onclick="fn_insertComment(event);">
			<input type="hidden" value="<%=albumList.get(i).getImgNo()%>">
			<input type="hidden" value="0">
			<input type="hidden" value="1">
		</div>
		<div style="border:1px solid black;padding:20px 20px;width:400px;display:none;">
			<%for(int j=0;j<commentList.size();j++) {%>
				<%if(commentList.get(j).getAlbumRef()==albumList.get(i).getImgNo()) {%>
					<%if(commentList.get(j).getCommentLevel()==1) {%>
						<div style="font-size:11px;color:red;">
							댓글 no : <%=commentList.get(j).getCommentNo()%> / 
							댓글 level : <%=commentList.get(j).getCommentLevel()%> / 
							참조 댓글 no : <%=commentList.get(j).getAlbumCommentRef()%> / 
							내용 : <%=commentList.get(j).getCommentContent()%>
							<input type="text"><input type="button" value="댓글" onclick="fn_insertComment(event);">
							<input type="hidden" value="<%=albumList.get(i).getImgNo()%>">
							<input type="hidden" value="<%=commentList.get(j).getCommentNo()%>">
							<input type="hidden" value="2">
						</div>
					<%}else if(commentList.get(j).getCommentLevel()==2) {%>
						<div style="font-size:11px;color:orange;">
							댓글 no : <%=commentList.get(j).getCommentNo()%> / 
							댓글 level : <%=commentList.get(j).getCommentLevel()%> / 
							참조 댓글 no : <%=commentList.get(j).getAlbumCommentRef()%> / 
							내용 : <%=commentList.get(j).getCommentContent()%>
							<input type="text"><input type="button" value="댓글" onclick="fn_insertComment(event);">
							<input type="hidden" value="<%=albumList.get(i).getImgNo()%>">
							<input type="hidden" value="<%=commentList.get(j).getCommentNo()%>">
							<input type="hidden" value="3">
						</div>
					<%}else {%>
						<div style="font-size:11px;color:blue;">
							댓글 no : <%=commentList.get(j).getCommentNo()%> / 
							댓글 level : <%=commentList.get(j).getCommentLevel()%> / 
							참조 댓글 no : <%=commentList.get(j).getAlbumCommentRef()%> / 
							내용 : <%=commentList.get(j).getCommentContent()%>
						</div>
					<%} %>
				<%} %>
			<%} %>
		</div>
	<%} %>
</div>

<div id="pageBar">
	<%=pageBar%>
</div>

<style>
	#pageBar>a{color:blue;cursor:pointer;}
</style>

<input type="hidden" id="currentFolder" value="<%=folder%>">

<script src="<%=request.getContextPath()%>/js/minihome/rightpage_album.js"></script>