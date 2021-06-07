<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.minihome.model.vo.ProfileImg,com.minihome.model.vo.Minihome"%>
<%
	Minihome minihome=(Minihome)request.getAttribute("minihome");
	ProfileImg profileImg=(ProfileImg)request.getAttribute("profileImg");
	String feeling=minihome.getFeeling();
%>
	<div id="feelingBox">
	<%if(feeling!=null) {%>
		<%-- <p style="display:inline-block;"><%=feeling%></p> --%>
		<div id="feelingImgBox">
			<%if(feeling.equals("기쁨")) {%>
				<img id="feelingImg" alt="기쁨" src="<%=request.getContextPath()%>/images/minihome/joy.png">
			<%}else if(feeling.equals("행복")){ %>
				<img id="feelingImg" alt="행복" src="<%=request.getContextPath()%>/images/minihome/happy.png">
			<%}else if(feeling.equals("즐거움")){ %>
				<img id="feelingImg" alt="즐거움" src="<%=request.getContextPath()%>/images/minihome/pleasure.png">
			<%}else if(feeling.equals("슬픔")){ %>
				<img id="feelingImg" alt="슬픔" src="<%=request.getContextPath()%>/images/minihome/sad.png">
			<%}else if(feeling.equals("사랑")){ %>
				<img id="feelingImg" alt="사랑" src="<%=request.getContextPath()%>/images/minihome/love.png">
			<%}else if(feeling.equals("분노")){ %>
				<img id="feelingImg" alt="분노" src="<%=request.getContextPath()%>/images/minihome/angry.png">
			<%}else if(feeling.equals("부끄러움")){ %>
				<img id="feelingImg" alt="부끄러움" src="<%=request.getContextPath()%>/images/minihome/shy.png">			
			<%} %>
			<!-- <img id="feelingImg" alt="" src=""> -->
		</div>
		<div id="selectFeelingBox">
			<select id="selectFeeling">
				<option value="기쁨" <%=feeling.equals("기쁨")?"selected":""%>>기쁨</option>
				<option value="행복" <%=feeling.equals("행복")?"selected":""%>>행복</option>
				<option value="즐거움" <%=feeling.equals("즐거움")?"selected":""%>>즐거움</option>
				<option value="슬픔" <%=feeling.equals("슬픔")?"selected":""%>>슬픔</option>
				<option value="사랑" <%=feeling.equals("사랑")?"selected":""%>>사랑</option>
				<option value="분노" <%=feeling.equals("분노")?"selected":""%>>분노</option>
				<option value="부끄러움" <%=feeling.equals("부끄러움")?"selected":""%>>부끄러움</option>
			</select>
		</div>
	<%} %>
</div>

<div id="prifileImgBox">
	<%if(profileImg!=null) {%>
		<img src="<%=request.getContextPath()%>/upload/photo/<%=profileImg.getFilepath()%>" width="180px">
	<%} %>
</div>

<textarea id="profileContent" cols="20" rows="5"><%=minihome.getProfileContent()%></textarea>

<!-- <input type="button" id="updateProfileContentBtn" value="자기소개글 작성/수정"> -->
<div id="updateProfileContentBtn">프로필수정</div>

<script src="<%=request.getContextPath()%>/js/minihome/leftpage_home.js"></script>