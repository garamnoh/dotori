<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.minihome.diary.model.vo.Diary, java.util.List, com.member.model.vo.ProfilePath" %>
<%@ page import="com.member.model.vo.Member, com.minihome.diary.model.vo.DiaryComment, com.minihome.diary.model.vo.DiaryFolder" %>
<%@ page import="java.util.ArrayList, com.friend.model.vo.Like" %>
<%
	List<Diary> list=(List<Diary>)request.getAttribute("list");	
	Member loginMember=(Member)request.getAttribute("loginMember");	
	Member hostMember=(Member)request.getAttribute("hostMember");
	String profilePath=(String)request.getAttribute("profilePath");
	String pageBar=(String)request.getAttribute("pageBar");
	List<DiaryComment> cList=(List<DiaryComment>)request.getAttribute("cList");
	int diaryFolderLevel=(int)request.getAttribute("diaryFolderLevel");
	List<DiaryFolder> fList=(List<DiaryFolder>)request.getAttribute("fList");
	String msg=(String)request.getAttribute("msg");
	ArrayList<Integer> likeList = (ArrayList<Integer>)request.getAttribute("likeList");
	ArrayList<Like> count = (ArrayList<Like>)request.getAttribute("count");
	String currentPage=(String)request.getAttribute("currentPage");
	//System.out.print(currentPage+"/////////////");
%>

<script src="<%=request.getContextPath() %>/js/minihome/rightpage_diary.js"></script>

<div id="diary_content">
	<div id="diary_input_box">
		<!-- 미니홈피 방문자(로그인한사람) 미니미출력 -->
		<div id="input_minimi_container">
			<img src="<%=request.getContextPath()%>/upload/MINIMI/<%=profilePath %>" alt="나의미니미">
		</div>
		<!-- 다이어리 작성 박스 -->
		<div id="diary_input_container">
			<div id="diary_title_left">
				<div id="diary_input_title_box">
					<select class="diary_folder" name="diary_folder">
						<%for(DiaryFolder df : fList) {%>
							<%if(df.getFolderName()==currentPage) {%>							
								<option selected value="<%=df.getFolderNo()%>"><%=df.getFolderName()%></option>
							<%}else {%>
								<option value="<%=df.getFolderNo()%>"><%=df.getFolderName()%></option>
							<%} %>							
						<%} %>							
					</select>						
				</div>
				<div id="diary_input_content_box">						
					<textarea class="diary_content_input" placeholder="다이어리를 작성해주세요."></textarea>
				</div>
			</div>				
			<div id="diary_input_btn_box">
				<input type="submit" value="저장" id="diary_input_btn">
			</div>									
		</div>
		<input type="hidden" name="loginMemberId" value="<%=loginMember.getMemberId()%>">
		<input type="hidden" name="hostMemberId" value="<%=hostMember.getMemberId()%>">
	</div>	
	
	<%if(list.isEmpty()) {%>
		<tr>
			<div id="diary_content_box">
				<div id="minimi_container">
					<img src="<%=request.getContextPath()%>/upload/MINIMI/admin_dotori.png" alt="관리자이미지">				
				</div>	
				<div id="diary_content_list">			
					<div id="diary_content_title">
						<div id="diary_writer_container">admin@gmail.com</div>				
					</div>
				<div id="diary_content_content" style="font-size: 13px;">
					환영합니다. 활발한 활동 응원합니다*^^*
				</div>
				</div>
			</div>
		</tr>
	<%} else{ %>
		<%for(Diary d : list) {%>					
			<div id="diary_content_box">
				<div id="minimi_container">
					<img src="<%=request.getContextPath()%>/upload/MINIMI/<%=d.getProfilePath() %>" alt="미니미">
				</div>
				<div id="diary_content_list">
				
					<!-- 댓글작성자, 날짜, 버튼박스 -->
					<div id="diary_content_title">						
						<div id="diary_writer_container"><%=d.getMemberName()%></div>									
						<div id="diary_date_container"><%=d.getPostDate() %></div>
						<input type="hidden" name="diary_no" value="<%=d.getDiaryNo()%>">	
						<div id="diary_btn_container">
							<%if(loginMember.getMemberId().equals(hostMember.getMemberId())
									|| loginMember.getMemberId().equals("admin@gmail.com")
									|| loginMember.getMemberId().equals(d.getWriter())) {%>
								<div class="diary_up_btn">수정</div>
								<div class="diary_del_btn">삭제</div>
							<%} %>
							<div class="diary_com_btn">댓글</div>
						</div>
						
						<!-- 다이어리 좋아요 -->										            
			            <input type='hidden' value='<%=d.getDiaryNo() %>'>
			            <%
			            	boolean likeOrNot = false;
			            	for(Integer no: likeList){
			            		if(no == d.getDiaryNo()){
			            			likeOrNot = true;
			            			break;
			            		}
			            	}
			            %>
			            <div id="likeBox">
				            <% for(Like like : count){ %>
				            	<% if(d.getDiaryNo() == like.getNo()){ %>
				            		<span><%= like.getCount() %></span>
				            	<% break; } %>
				            <% } %>
				            <% if(likeOrNot == true) { %>
				            	<img src="<%= request.getContextPath() %>/images/like.png" alt="" class="like">
				            <% } else {%>
				            	<img src="<%= request.getContextPath() %>/images/unlike.png" alt="" class="like">
				            <% } %>
			            </div>				        
					</div>	
					
					<!-- 댓글내용 -->						
					<div id="diary_content_content">
						<%=d.getContent() %>
					</div>
					
					<input type="hidden" name="diary_no" value="<%=d.getDiaryNo()%>">					
					
					<!-- 다이어리 수정박스 -->			
					<div id="diary_content_update" style="display:none">
						<select class="diary_folder_up" name="diary_folder_up">
							<%for(DiaryFolder df : fList) {%>
								<option value="<%=df.getFolderNo()%>"><%=df.getFolderName()%></option>							
							<%} %>							
						</select>
						<textarea class="diary_content_up_input" placeholder="다이어리를 작성해주세요."><%=d.getContent() %></textarea>
						<div id="diary_update_btn_box">
							<div class="diary_update_btn">저장</div>
							<div class="diary_cancel_btn">취소</div>
						</div>
					</div>	
					
					<!-- 댓글달기 -->
					<div id="diary_comment_box" style="display:none">
						<label>댓글</label>							
						<input type="text" class="diary_comment" name="diary_comment">
						<button class="diary_comment_btn">확인</button>						
					</div>					
					
					<!-- 댓글출력박스 -->
					<div class="diary_comment_list_box">
						<%for(DiaryComment dc : cList) {%>
							<%if(d.getDiaryNo()==dc.getDiaryRef()) {%>
								<%if(dc.getCommentLevel()==1) {%>
									<input type="hidden" name="diary_comment_ref" value="<%=dc.getCommentNo()%>">
									<input type="hidden" name="diary_com_no" value="<%=d.getDiaryNo()%>">										
									<div class="diary_comment_list">						
										<div class="diary_comment_user"><%= dc.getWriterName()%></div>
										<div class="diary_comment_content"><%=dc.getCommentContent() %></div>
										<%if(loginMember.getMemberId().equals(hostMember.getMemberId())
											|| loginMember.getMemberId().equals("admin@gmail.com")
											|| loginMember.getMemberId().equals(dc.getCommentWriter())) {%>
											<div class="diary_co_del_btn">삭제</div>
										<%} %>
										<div class="diary_co_com_btn">댓글</div>
										<!-- 대댓글달기 / 원글 댓글창 닫기-->									
										<div id="diary_co_comment_box" style="display:none">
											<label>대댓글</label>							
											<input type="text" class="diary_co_comment" name="diary_co_comment">				
											<button class="diary_co_comment_btn">확인</button>
										</div>
									</div>
								<%} else if(dc.getCommentLevel()==2) {%>									
									<div class="diary_reply_list">										
										<input type="hidden" name="diary_comment_ref" value="<%=dc.getCommentNo()%>">
										<div class="diary_reply_user"><%= dc.getWriterName()%></div>
										<div class="diary_reply_content"><%=dc.getCommentContent() %></div>	
										<%if(loginMember.getMemberId().equals(hostMember.getMemberId())
											|| loginMember.getMemberId().equals("admin@gmail.com")
											|| loginMember.getMemberId().equals(dc.getCommentWriter())) {%>
											<div class="diary_reply_btn">삭제</div>	
										<%} %>																		
									</div>
								<%} %>										
							<%} %>
						<%} %>
					</div>
						
					<input type="hidden" name="diary_no" value="<%=d.getDiaryNo()%>">						
						
					<!-- 대댓글달기 / 원글 댓글창 닫기-->
					<!-- <div id="diary_co_comment_box" style="display:none">
						<label>대댓글</label>							
						<input type="text" class="diary_co_comment" name="diary_co_comment">				
						<button class="diary_co_comment_btn">확인</button>
					</div> -->	
									
				</div>
			</div>	
		<%} 
	}%>	
				
	<input type="hidden" name="diaryFolderLevel" value="<%=diaryFolderLevel%>">
											
	<div id="pageBar">
		<%=pageBar %>		
	</div> 	
</div>

<script>
	<%if(msg!=null) {%>
		alert("<%=msg%>");
	<%}%>
</script>