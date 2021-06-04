<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,com.shop.model.vo.Skin"%>
<%
	List<Skin> skinList=(List<Skin>)request.getAttribute("skinList");
%>

<select id="changeSkin">
	<%for(int i=0;i<skinList.size();i++) {%>
		<option value="<%=skinList.get(i).getItemNo()%>"><%=skinList.get(i).getSkinTitle()%></option>
	<%} %>
</select>
<input type="button" id="changeSkinBtn" value="스킨 변경">

<script src="<%=request.getContextPath()%>/js/minihome/rightpage_settings.js"></script>