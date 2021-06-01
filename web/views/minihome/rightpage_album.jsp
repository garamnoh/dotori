<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,com.minihome.album.model.vo.Album,com.minihome.album.model.vo.AlbumComment"%>
<%
	List<Album> albumList=(List<Album>)request.getAttribute("albumList");
	List<String> folderList=(List<String>)request.getAttribute("folderList");
	String folder=(String)request.getAttribute("folder");
	List<AlbumComment> commentList=(List<AlbumComment>)request.getAttribute("commentList");
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
		</div>
		<div style="border:1px solid black;padding:20px 20px;width:400px;display:none;">
			<%for(int j=0;j<commentList.size();j++) {%>
				<%if(commentList.get(j).getCommentLevel()==1&&albumList.get(i).getImgNo()==commentList.get(j).getAlbumRef()) {%>
					<div style="font-size:12px;text-align:left;">
						레벨 : <%=commentList.get(j).getCommentLevel()%> / 
						cr : <%=commentList.get(j).getAlbumCommentRef()%> / 
						<%=commentList.get(j).getCommentWriter()%>
						<%=commentList.get(j).getCommentContent()%>
						<%=commentList.get(j).getCommentDate()%>
					</div>
				<%} %>
				<%for(int k=0;k<commentList.size();k++) {%>
					<%if(commentList.get(k).getCommentLevel()==2&&albumList.get(i).getImgNo()==commentList.get(k).getAlbumRef()&&commentList.get(k).getAlbumCommentRef()==commentList.get(j).getCommentNo()) {%>
						<div style="font-size:12px;text-align:center;">
							레벨 : <%=commentList.get(k).getCommentLevel()%> / 
							cr : <%=commentList.get(k).getAlbumCommentRef()%> / 
							<%=commentList.get(k).getCommentWriter()%>
							<%=commentList.get(k).getCommentContent()%>
							<%=commentList.get(k).getCommentDate()%>
						</div>
					<%} %>
				<%} %>
			<%} %>
		</div>
	<%} %>
</div>

<input type="hidden" id="currentFolder" value="<%=folder%>">

<script src="<%=request.getContextPath()%>/js/minihome/rightpage_album.js"></script>