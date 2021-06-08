<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,com.minihome.album.model.vo.Album,com.minihome.album.model.vo.AlbumComment"%>
<%
	List<Album> albumList=(List<Album>)request.getAttribute("albumList");
	List<String> folderList=(List<String>)request.getAttribute("folderList");
	String folder=(String)request.getAttribute("folder");
	List<AlbumComment> commentList=(List<AlbumComment>)request.getAttribute("commentList");
	String pageBar=(String)request.getAttribute("pageBar");
	
	
	System.out.println("jsp테스트 : "+folder);
%>

<div class="album-controller">
	<%if(folder!=null) {%>
		<%if(!folder.equals("null")) {%>
		<select id="changeFolderTarget">
			<%for(int i=0;i<folderList.size();i++) {%>
				<option value="<%=folderList.get(i)%>"><%=folderList.get(i)%></option>
			<%} %>
		</select>
		<input type="button" id="changeFolderBtn" value="폴더 변경">
		<%} %>
	<%} %>
	<div class="album-tooltip">?
		<div class="album-tooltip-text">
			<ol>
				<li>처음 들어갔을 때는 모든 사진을 보여주며, 폴더 변경을 할 수 없습니다</li>
				<li>왼쪽 폴더를 클릭하여 선택하면 각 폴더 안의 사진을 보여주며, 폴더 변경을 할 수 있습니다</li>
				<li>폴더를 삭제하면 그 안의 사진들은 '기본폴더'로 들어가며 기본폴더는 삭제할 수 없습니다</li>
			</ol>
		</div>
	</div>
</div>

<hr>

<div id="albumBox">
	<%if(albumList==null||albumList.isEmpty()||albumList.get(0).getFilepath()==null) {%>
		<%if(folder!=null) {%>
			<p><strong><%=folder%></strong>에 들어있는 사진이 없습니다</p>
		<%} %>
	<%}else {%>
		<%for(int i=0;i<albumList.size();i++) {%>
			<div class="photoBox">
				<p class="photoTitle"><%=albumList.get(i).getTitle()%></p>
				<img src="<%=request.getContextPath()%>/upload/photo/<%=albumList.get(i).getFilepath()%>">
				<div class="photoContent">
					<%=albumList.get(i).getContent()%>
					<span class="photoPostDate"> [<%=albumList.get(i).getPostDate()%>]</span>
				</div>
				
				<hr>
				
				<div class="buttonsInPhotoBox">
					<%if(folder!=null) {%>
						<%if(!folder.equals("null")) {%>
						<input type="checkbox">
						<input type="hidden" value="<%=albumList.get(i).getImgNo()%>">
						<%} %>
					<%} %>
					<input type="button" onclick="fn_selectProfileImg(event);" value="대문 사진">
					<input type="hidden" value="<%=albumList.get(i).getImgNo()%>">
					<input type="button" onclick="fn_openCommentBox(event);" value="댓글 보기">
					<input type="button" class="modifyPhotoBtn" value="수정하기">
					<input type="hidden" value="<%=albumList.get(i).getImgNo()%>">
					<input type="hidden" value="<%=albumList.get(i).getFolder()%>">
					<input type="hidden" value="<%=albumList.get(i).getTitle()%>">
					<input type="hidden" value="<%=albumList.get(i).getHashTag()%>">
					<input type="hidden" value="<%=albumList.get(i).getContent()%>">
					<input type="hidden" value="<%=albumList.get(i).getFilepath()%>">
					<input type="button" class="deletePhotoBtn" value="삭제하기">
					<input type="hidden" value="<%=albumList.get(i).getImgNo()%>">
				</div>
			</div>
			<div class="albumCommentBox">
				<div class="insertCommentBox">
					<input type="text" size="35"><input type="button" value="작성" onclick="fn_insertComment(event);">
					<input type="hidden" value="<%=albumList.get(i).getImgNo()%>">
					<input type="hidden" value="0">
					<input type="hidden" value="1">
				</div>
				<hr>
				<%for(int j=0;j<commentList.size();j++) {%>
					<%if(commentList.get(j).getAlbumRef()==albumList.get(i).getImgNo()) {%>
						<%if(commentList.get(j).getCommentLevel()==1) {%>
							<div class="level1-comment">
								<%=commentList.get(j).getCommentWriter()%> / <%=commentList.get(j).getCommentDate()%><br>
								<p><%=commentList.get(j).getCommentContent()%></p>
								<input type="button" class="recommentBtn" onclick="fn_insertRecomment(event);" value="댓글">
								<div class="insertCommentBox" style="display:none;">
									<input type="text" size="35"><input type="button" value="작성" onclick="fn_insertComment(event);">
									<input type="hidden" value="<%=albumList.get(i).getImgNo()%>">
									<input type="hidden" value="<%=commentList.get(j).getCommentNo()%>">
									<input type="hidden" value="2">
								</div>
							</div>
						<%}else if(commentList.get(j).getCommentLevel()==2) {%>
							<div class="level2-comment">
								<%=commentList.get(j).getCommentWriter()%> / <%=commentList.get(j).getCommentDate()%><br>
								<p><%=commentList.get(j).getCommentContent()%></p>
								<input type="button" class="recommentBtn" onclick="fn_insertRecomment(event);" value="댓글">
								<div class="insertCommentBox" style="display:none;">
									<input type="text" size="35"><input type="button" value="작성" onclick="fn_insertComment(event);">
									<input type="hidden" value="<%=albumList.get(i).getImgNo()%>">
									<input type="hidden" value="<%=commentList.get(j).getCommentNo()%>">
									<input type="hidden" value="3">
								</div>
							</div>
						<%}else {%>
							<div class="level3-comment">
								<%=commentList.get(j).getCommentWriter()%> / <%=commentList.get(j).getCommentDate()%><br>
								<p><%=commentList.get(j).getCommentContent()%></p>
							</div>
						<%} %>
					<%} %>
				<%} %>
			</div>
		<%} %>
	<%} %>
</div>

<div id="pageBar">
	<%=pageBar%>
</div>

<input type="hidden" id="currentFolder" value="<%=folder%>">

<script src="<%=request.getContextPath()%>/js/minihome/rightpage_album.js"></script>