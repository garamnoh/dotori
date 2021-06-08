<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.minihome.diary.model.vo.DiaryFolder, java.util.List, com.member.model.vo.Member" %>

<%
	String loginMemberId=(String)request.getAttribute("loginMember");	
	String hostMemberId=(String)request.getAttribute("hostMember");
	List<DiaryFolder> list=(List<DiaryFolder>)request.getAttribute("list");
	List<DiaryFolder> fList=(List<DiaryFolder>)request.getAttribute("fList");
	System.out.println("폴더 쉐어 리스트 테스트 : "+fList);
%>

<div id="diarySetting">
	<fieldset id="folderAdd">
		<legend>폴더 추가</legend>
		<table>					
			<tr>
				<th>공개 범위</th>
				<td>
					<select id="folderShareLevel" name="folderShareLevel">						
						<option id="public" value="PUBLIC">전체공개</option>
						<option id="followers" value="FOLLOWERS">일촌공개</option>
						<option id="private" value="PRIVATE">비공개</option>
						<option id="friends" value="FRIENDS">멤버공개</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>폴더 이름</th>
				<td>
					<input type="text" id="addFolderName" placeholder="추가할 폴더이름을 입력하세요.">
				</td>
			</tr>						
		</table>
		<div id="diaryFolderSaveBtn">저장</div>		
	</fieldset>
	
	<fieldset id="addFriends">
		<legend>멤버공개 다이어리 친구추가</legend>
			<table>
				<tr>
					<th>폴더 선택</th>
					<td>
						<select id="shareFolderNo" name="shareFolderNo">						
							<%for(DiaryFolder dsf : fList) {%>	
								<option value="<%=dsf.getFolderNo()%>"><%=dsf.getFolderName()%></option>							
							<%} %>							
						</select>
					</td>
				</tr>			
				<tr>
					<th>멤버 초대</th>
					<td>
						<input type="text" id="shareMember" placeholder="콤마(,)로 구분해서 작성해주세요.">
					</td>
				</tr>
			</table>
			<div id="diaryMemberBtn">저장</div>
	</fieldset>
	
	<input type="hidden" name="loginMemberId" value="<%=loginMemberId%>">
	<input type="hidden" name="hostMemberId" value="<%=hostMemberId%>">
	
	<fieldset id="folderDel">
		<legend>폴더 삭제</legend>
		<table>			
			<tr>
				<th>폴더 선택</th>
				<td>
					<select id="folderName" name="folderName">
						<%for(DiaryFolder df : list) {%>	
							<option value="<%=df.getFolderNo()%>"><%=df.getFolderName()%></option>							
						<%} %>
					</select>
				</td>
			</tr>
		</table>	
		<div id="diary_del_folder_btn">삭제</div>
	</fieldset>
</div>

<script src="<%=request.getContextPath()%>/js/minihome/rightpage_diarySetting.js"></script>