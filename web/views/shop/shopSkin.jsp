<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,com.shop.model.vo.Skin"%>
<%
List<Skin> list=(List<Skin>)request.getAttribute("skinList");
Skin s=(Skin)request.getAttribute("skin");
String id=(String)request.getAttribute("memberId"); 
String result=(String)request.getAttribute("result"); 
%>  
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/shop/shopProductSkin.css">

<%@ include file="/views/common/shopheader.jsp"%>
<form id="AllSkinForm" action="<%=request.getContextPath()%>/shop/skinTable" method="post">
	<%if(list==null&&list.isEmpty()){ %>
		<p>조회된 데이터가 없습니다</p>
	<%}else{%> 
		<table id=SkinTable>
		<% for(int i=0;i<list.size()/3+1;i++){%> 
		<tr>
			<%if(3*i<list.size()) {%>
			<td>
			<div class="productSkin">
				<div class="SkinPicture">
					<img alt="스킨사진" src="<%=request.getContextPath()%>/upload/SKIN_ITEM/<%=list.get(3*i).getPreviewImgFilepath()%>"> 
				</div>
				<br>
                <div class="SkinInfo">
                <input class="shopSkinCheck" type="checkbox">
                <input type="hidden" value="<%=list.get(3*i).getItemNo() %>">
                <ul>
                    <%-- <li><b>[<%=list.get(3*i).getSinger()%>]</b></li> --%>
                    <li><b><%=list.get(3*i).getSkinTitle() %></b></li>
                    <li><b>도토리 <%=list.get(3*i).getPrice() %>개</b></li>
                </ul>
                <input class="shopSkinCheck" type="checkbox">
                </div>
			</div>
			</td>
			<%} %>
			<%if(3*i+1<list.size()) {%>
			<td>
			<div class="productSkin">
				<div class="SkinPicture">
					<img alt="스킨사진" src="<%=request.getContextPath()%>/upload/SKIN_ITEM/<%=list.get(3*i+1).getPreviewImgFilepath()%>"> 
				</div>
				<br>
                <div class="SkinInfo">
                <input class="shopSkinCheck" type="checkbox">
                <input type="hidden" value="<%=list.get(3*i+1).getItemNo() %>">
                <ul>
                    <%-- <li><b>[<%=list.get(3*i+1).getTitle()%>]</b></li> --%>
                    <li><b><%=list.get(3*i+1).getSkinTitle() %></b></li>
                    <li><b>도토리 <%=list.get(3*i+1).getPrice() %>개</b></li>
                </ul>
                <input class="shopSkinCheck" type="checkbox">
                </div>
			</div>
			</td>
			<%} %>
			<td>
			<%if(3*i+2<list.size()) {%>
			<div class="productSkin">
				<div class="SkinPicture">
					<img alt="미니미사진" src="<%=request.getContextPath()%>/upload/SKIN_ITEM/<%=list.get(3*i+2).getPreviewImgFilepath()%>"> 
				</div>
				<br>
                <div class="SkinInfo">
                <input class="shopSkinCheck" type="checkbox">
                <input type="hidden" value="<%=list.get(3*i+2).getItemNo() %>">
                <ul>
                    <%-- <li><b>[<%=list.get(3*i+2).getSinger()%>]</b></li> --%>
                    <li><b><%=list.get(3*i+2).getSkinTitle() %></b></li>
                    <li><b>도토리 <%=list.get(3*i+2).getPrice() %>개</b></li>
                </ul>
                <input class="shopSkinCheck" type="checkbox">
                </div>
			</div>
			</td>
			<%} %>
		</tr>
		
	<%} 
	}%>
</form>
<script>
function searchKeyup(e){
	$.ajax({
		url:"<%=request.getContextPath()%>/ajax/shopSearch.do",
		data:{"keyword":$(e.target).val(),"type":"<%=request.getAttribute("type")%>"},
		success:data=>{
			$("#list").html(""); 
			console.log(data);
			const op=data.split(",");
			for(let i=0;i<op.length;i++){
				let option=$("<option>");
				option.val(op[i]); 
				option.html(op[i]); 
				$("#list").append(option);  
			}
		}
		
	});
	
};
var getbasket=()=>{
	let arr=new Array();
	document.querySelectorAll(".shopSkinCheck").forEach((v,i)=>{
		console.dir(v);
		if($(v).prop("checked")) arr.push($(v).next().val());
	});
	
	console.log(arr.toString());
	
	$.ajax({
		url:"<%=request.getContextPath()%>/shop/shopBasketInsert.do",
		type:"get",
		data:{"memberId": "<%=id%>","itemNums":arr.toString(),"type":"skin"},
		dataType:"html",
		success:data=>{
			
			
			$("#section").html(data);
		}
		
	});
}
<%if(result!=null){%>
alert("<%=result%>");
<%}%>
			

</script>
	