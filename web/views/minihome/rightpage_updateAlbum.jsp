<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List"%>
<%
	String loginMemberId=(String)request.getAttribute("loginMemberId");
	String hostMemberId=(String)request.getAttribute("hostMemberId");
	List<String> folderList=(List<String>)request.getAttribute("folderList");
	String imgNo=(String)request.getAttribute("imgNo");
	String folder=(String)request.getAttribute("folder");
	String title=(String)request.getAttribute("title");
	String hashTag=(String)request.getAttribute("hashTag");
	String content=(String)request.getAttribute("content");
	String filepath=(String)request.getAttribute("filepath");
%>
<div id="update-photo-container">
	<form name="uploadPhotoFrm" enctype="multipart/formdata">
		<table id="updatePhotoTable">
			<tr>
				<td>제목</td>
				<td><input type="text" id="title" name="title" placeholder="제목을 입력하세요" value="<%=title!=null?title:""%>"></td>
			</tr>
			<%if(filepath!=null) {%>
				<tr>
					<td>현재 이미지 파일</td>
					<td><input type="text" name="existingFile" value="<%=filepath%>" readonly></td>
				</tr>
			<%} %>
			<tr>
				<td>사진</td>
				<td><input type="file" id="uploadFile" name="uploadFile" value="<%=filepath!=null?filepath:""%>"></td>
			</tr>
			<tr>
				<td>폴더</td>
				<td>
				<select id="folder" name="folder">
					<%for(int i=0;i<folderList.size();i++) {%>
						<option value="<%=folderList.get(i)%>" <%=folder!=null&&folder.equals(folderList.get(i))?"selected":""%>><%=folderList.get(i)%></option>
					<%} %>
				</select>
				</td>
			</tr>
			<tr>
				<td>함께 남기는 글</td>
				<td>
					<textarea id="content" name="content" cols="30" rows="5" placeholder="남기고 싶은 글을 입력하세요"><%=content!=null?content:""%></textarea>
				</td>
			</tr>
			<tr>
				<td>해시태그</td>
				<td><input type="text" id="hashTag" name="hashTag" placeholder="해시태그를 입력하세요" size="25" value="<%=hashTag!=null?hashTag:""%>"></td>
			</tr>
		</table>
		
		<input type="hidden" name="upload_memberId" value="<%=loginMemberId%>">
		<input type="hidden" name="upload_imgNo" value="<%=imgNo!=null?imgNo:""%>">
		<div id="updatePhotoBtnBox">
			<input type="button" id="submitPhotoBtn" value="업로드">
			<input type="reset" value="다시 작성">
		</div>
	</form>
</div>

<script src="<%=request.getContextPath()%>/js/minihome/rightpage_updateAlbum.js"></script>