<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,com.shop.model.vo.Music"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/shop/shopProductMusic.css">

<%
List<Music> list=(List<Music>)request.getAttribute("musicList");
	Music m=(Music)request.getAttribute("music");
	String id=(String)request.getAttribute("memberId"); 
	String result=(String)request.getAttribute("result");
%> 
<%@ include file="/views/common/shopheader.jsp"%>

<form id="AllMusicForm" action="<%=request.getContextPath()%>/shop/musicTable" method="post">
	<%if(list==null&&list.isEmpty()){ %>
		<p>조회된 데이터가 없습니다</p>
	<%}else{%> 
		<table id="MusicTable">
		<% for(int i=0;i<list.size()/3+1;i++){%> 
		<tr>
		<%if(3*i<list.size()) {%>
			<td>
			<div class="productMusic">
				<div class="MusicPicture">
					<img alt="음악사진" src="<%=request.getContextPath()%>/upload/MUSIC/<%=list.get(3*i).getImgFilepath()%>"> 
				</div>
				<br>
                <div class="MusicInfo">
                <input class="shopMusicCheck" type="checkbox">
                <input type="hidden" value="<%=list.get(3*i).getMusicNo() %>">
                <ul>
                    <li><b>[<%=list.get(3*i).getSinger()%>]</b></li>
                    <li><b><%=list.get(3*i).getMusicTitle() %></b></li>
                    <li><b>도토리 <%=list.get(3*i).getPrice() %>개</b></li>
                </ul>
                <input id='test8' class="shopMusicCheck" type="checkbox" disabled="disabled">
                </div>
			</div>
			</td>
			<%} %>
			<%if(3*i+1<list.size()) {%>
			<td>
			<div class="productMusic">
				<div class="MusicPicture">
					<img alt="음악사진" src="<%=request.getContextPath()%>/upload/MUSIC/<%=list.get(3*i+1).getImgFilepath()%>"> 
				</div>
				<br>
                <div class="MusicInfo">
                <input class="shopMusicCheck" type="checkbox">
                <input type="hidden" value="<%=list.get(3*i+1).getMusicNo() %>">
                <ul>
                    <li><b>[<%=list.get(3*i+1).getSinger()%>]</b></li>
                    <li><b><%=list.get(3*i+1).getMusicTitle() %></b></li>
                    <li><b>도토리 <%=list.get(3*i+1).getPrice() %>개</b></li>
                </ul>
                <input id='test8' class="shopMusicCheck" type="checkbox" disabled="disabled">
                </div>
			</div>
			</td>
			<%} %>
			<td>
			<%if(3*i+2<list.size()) {%>
			<div class="productMusic">
				<div class="MusicPicture">
					<img alt="음악사진" src="<%=request.getContextPath()%>/upload/MUSIC/<%=list.get(3*i+2).getImgFilepath()%>"> 
				</div>
				<br>
                <div class="MusicInfo">
                <input class="shopMusicCheck" type="checkbox">
                <input type="hidden" value="<%=list.get(3*i+2).getMusicNo() %>">
                <ul>
                    <li><b>[<%=list.get(3*i+2).getSinger()%>]</b></li>
                    <li><b><%=list.get(3*i+2).getMusicTitle() %></b></li>
                    <li><b>도토리 <%=list.get(3*i+2).getPrice() %>개</b></li>
                </ul>
                <input id='test8' class="shopMusicCheck" type="checkbox" disabled="disabled">
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
	document.querySelectorAll(".shopMusicCheck").forEach((v,i)=>{
		console.dir(v);
		if($(v).prop("checked")) arr.push($(v).next().val());
	});
	
	console.log(arr.toString());
	
	$.ajax({
		url:"<%=request.getContextPath()%>/shop/shopBasketInsert.do",
		type:"get",
		data:{"memberId": "<%=id%>","itemNums":arr.toString(),"type":"music"},
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
