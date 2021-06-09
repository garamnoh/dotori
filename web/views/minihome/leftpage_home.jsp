<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.minihome.model.vo.ProfileImg,com.minihome.model.vo.Minihome,java.util.List,com.shop.model.vo.Skin"%>
<%
	Minihome minihome=(Minihome)request.getAttribute("minihome");
	ProfileImg profileImg=(ProfileImg)request.getAttribute("profileImg");
	List<Skin> skinList=(List<Skin>)request.getAttribute("skinList");
	String feeling=minihome.getFeeling();
%>
<div id="feelingBox">
	<%if(feeling!=null) {%>		
		<div id="feelingImgBox">
			<%if(feeling.equals("기쁨")) {%>
				<img class="feelingImg" alt="기쁨" src="<%=request.getContextPath()%>/images/minihome/joy.png">
			<%}else if(feeling.equals("행복")){ %>
				<img class="feelingImg" alt="행복" src="<%=request.getContextPath()%>/images/minihome/happy.png">
			<%}else if(feeling.equals("즐거움")){ %>
				<img class="feelingImg" alt="즐거움" src="<%=request.getContextPath()%>/images/minihome/pleasure.png">
			<%}else if(feeling.equals("슬픔")){ %>
				<img class="feelingImg" alt="슬픔" src="<%=request.getContextPath()%>/images/minihome/sad.png">
			<%}else if(feeling.equals("사랑")){ %>
				<img class="feelingImg" alt="사랑" src="<%=request.getContextPath()%>/images/minihome/love.png">
			<%}else if(feeling.equals("분노")){ %>
				<img class="feelingImg" alt="분노" src="<%=request.getContextPath()%>/images/minihome/angry.png">
			<%}else if(feeling.equals("부끄러움")){ %>
				<img class="feelingImg" alt="부끄러움" src="<%=request.getContextPath()%>/images/minihome/shy.png">			
			<%} %>			
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

<div id="profileImgBox">
	<%if(profileImg!=null) {%>
		<img src="<%=request.getContextPath()%>/upload/photo/<%=profileImg.getFilepath()%>" width="180px">
	<%}else {%>
		<img src="<%=request.getContextPath()%>/images/minihome/profileDefault.png" width="180px">
	<%} %>
</div>
<div id="profileContentBox">
	<div class="profileContent"><%=minihome.getProfileContent()%></div>
	<textarea id="updateProfileContent" style="display:none;"><%=minihome.getProfileContent()%></textarea>
	<div class="profileContentBtnBox">
		<input type="button" id="showWriteProfileBoxBtn" value="프로필 수정">
		<input type="button" id="updateProfileContentBtn" value="작성 완료">
	</div>
</div>

<div class="changeSkinController">
	<select id="changeSkin">
		<%for(int i=0;i<skinList.size();i++) {%>
			<option value="<%=skinList.get(i).getItemNo()%>" <%=skinList.get(i).getItemNo()==minihome.getSkinItemNo()?"selected":""%>>
				<%=skinList.get(i).getSkinTitle()%>
			</option>
		<%} %>
	</select>
	<input type="button" id="changeSkinBtn" value="스킨 변경">
</div>

<script src="<%=request.getContextPath()%>/js/minihome/leftpage_home.js"></script>