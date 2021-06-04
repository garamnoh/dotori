<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,com.shop.model.vo.Skin,com.minihome.model.vo.Minihome"%>
<%
	List<Skin> skinList=(List<Skin>)request.getAttribute("skinList");
	Minihome minihome=(Minihome)request.getAttribute("minihome");
%>

<select id="changeSkin">
	<%for(int i=0;i<skinList.size();i++) {%>
		<option value="<%=skinList.get(i).getItemNo()%>" <%=skinList.get(i).getItemNo()==minihome.getSkinItemNo()?"selected":""%>>
			<%=skinList.get(i).getSkinTitle()%>
		</option>
	<%} %>
</select>
<input type="button" id="changeSkinBtn" value="스킨 변경">

<script src="<%=request.getContextPath()%>/js/minihome/rightpage_settings.js"></script>