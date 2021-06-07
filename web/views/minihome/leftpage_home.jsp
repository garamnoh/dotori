<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.minihome.model.vo.ProfileImg,com.minihome.model.vo.Minihome"%>
<%
	Minihome minihome=(Minihome)request.getAttribute("minihome");
	ProfileImg profileImg=(ProfileImg)request.getAttribute("profileImg");
	String feeling=minihome.getFeeling();
%>
<%if(feeling!=null) {%>
	<p style="display:inline-block;"><%=feeling%></p>
	<select id="selectFeeling">
		<option value="기쁨" <%=feeling.equals("기쁨")?"selected":""%>>기쁨</option>
		<option value="행복" <%=feeling.equals("행복")?"selected":""%>>행복</option>
		<option value="즐거움" <%=feeling.equals("즐거움")?"selected":""%>>즐거움</option>
		<option value="슬픔" <%=feeling.equals("슬픔")?"selected":""%>>슬픔</option>
		<option value="사랑" <%=feeling.equals("사랑")?"selected":""%>>사랑</option>
		<option value="분노" <%=feeling.equals("분노")?"selected":""%>>분노</option>
		<option value="부끄러움" <%=feeling.equals("부끄러움")?"selected":""%>>부끄러움</option>
	</select>
<%} %>

<%if(profileImg!=null) {%>
	<img src="<%=request.getContextPath()%>/upload/photo/<%=profileImg.getFilepath()%>" width="180px">
<%} %>

<textarea id="profileContent" cols="20" rows="5"><%=minihome.getProfileContent()%></textarea>

<input type="button" id="updateProfileContentBtn" value="자기소개글 작성/수정">

<script src="<%=request.getContextPath()%>/js/minihome/leftpage_home.js"></script>