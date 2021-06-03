<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List"%>
<%
	String loginMemberId=(String)request.getAttribute("loginMemberId");
	String hostMemberId=(String)request.getAttribute("hostMemberId");
	List<String> folderList=(List<String>)request.getAttribute("folderList");
%>
<form name="uploadPhotoFrm" enctype="multipart/formdata">
	<table>
		<tr>
			<td>제목</td>
			<td><input type="text" id="title" name="title" placeholder="제목을 입력하세요"></td>
		</tr>
		<tr>
			<td>사진</td>
			<td><input type="file" id="uploadFile" name="uploadFile"></td>
		</tr>
		<tr>
			<td>폴더</td>
			<td>
			<select id="folder" name="folder">
				<%for(int i=0;i<folderList.size();i++) {%>
					<option value="<%=folderList.get(i)%>"><%=folderList.get(i)%></option>
				<%} %>
			</select>
			</td>
		</tr>
		<tr>
			<td>함께 남기는 글</td>
			<td><textarea id="content" name="content" cols="20" rows="5" placeholder="남기고 싶은 글을 입력하세요"></textarea></td>
		</tr>
		<tr>
			<td>해시태그</td>
			<td><input type="text" id="hashTag" name="hashTag" placeholder="해시태그를 입력하세요"></td>
		</tr>
	</table>
	
	<input type="hidden" name="upload_memberId" value="<%=loginMemberId%>">
	
	<input type="button" id="submitPhotoBtn" value="업로드">
	<input type="reset" value="다시 작성">
</form>

<script src="<%=request.getContextPath()%>/js/minihome/rightpage_updateAlbum.js"></script>