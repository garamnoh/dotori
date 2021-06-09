<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,com.shop.model.vo.Music,com.shop.model.vo.MusicLike"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/shop/shopProductMusic.css">

<%
List<Music> list=(List<Music>)request.getAttribute("musicList");
	Music m=(Music)request.getAttribute("music");
	String id=(String)request.getAttribute("memberId"); 
	String result=(String)request.getAttribute("result");
	List<MusicLike> cHeartList=(List<MusicLike>)request.getAttribute("cheartList");
	List<Integer> myHeartItemList=(List<Integer>)request.getAttribute("myHeartItemList");
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
                <div class="musicline">
	                <input class="shopMusicCheck" type="checkbox">
	                <input type="hidden" value="<%=list.get(3*i).getMusicNo() %>">
                	<%
	            		boolean likeOrNot = false;
	            		for(Integer mhl:myHeartItemList){
	            		if(mhl==list.get(3*i).getMusicNo()){
	            			likeOrNot = true;
	            			break;
	            			}
	            	}
	            	%>
			        <div id="likeBox">
			            
			        <% if(likeOrNot == true) { %>
			            <img src="<%= request.getContextPath() %>/images/like.png" alt="" class="like">
			        <% } else {%>
			            <img src="<%= request.getContextPath() %>/images/unlike.png" alt="" class="like">
			        <% } %>
			        <% for(MusicLike ml:cHeartList){ %>
			            <% if(ml.getMusicNo()==list.get(3*i).getMusicNo()){ %>
			            	<span><%= ml.getcHeartCount() %></span>
			            <% break; } %>
				    <% } %>
			       	</div>
                </div>
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
                <div class="musicline">
	                <input class="shopMusicCheck" type="checkbox">
	                <input type="hidden" value="<%=list.get(3*i+1).getMusicNo() %>">
                	<%
	            		boolean likeOrNot = false;
	            		for(Integer mhl:myHeartItemList){
	            		if(mhl==list.get(3*i+1).getMusicNo()){
	            			likeOrNot = true;
	            			break;
	            			}
	            	}
	            	%>
			        <div id="likeBox">
			            
			        <% if(likeOrNot == true) { %>
			            <img src="<%= request.getContextPath() %>/images/like.png" alt="" class="like">
			        <% } else {%>
			            <img src="<%= request.getContextPath() %>/images/unlike.png" alt="" class="like">
			        <% } %>
			        <% for(MusicLike ml:cHeartList){ %>
			            <% if(ml.getMusicNo()==list.get(3*i+1).getMusicNo()){ %>
			            	<span><%= ml.getcHeartCount() %></span>
			            <% break; } %>
				    <% } %>
			       	</div>
                </div>
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
                <div class="musicline">
	                <input class="shopMusicCheck" type="checkbox">
	                <input type="hidden" value="<%=list.get(3*i+2).getMusicNo() %>">
	                <%
	            		boolean likeOrNot = false;
	            		for(Integer mhl:myHeartItemList){
	            		if(mhl==list.get(3*i+2).getMusicNo()){
	            			likeOrNot = true;
	            			break;
	            			}
	            	}
	            	%>
			        <div id="likeBox">
			            
			        <% if(likeOrNot == true) { %>
			            <img src="<%= request.getContextPath() %>/images/like.png" alt="" class="like">
			        <% } else {%>
			            <img src="<%= request.getContextPath() %>/images/unlike.png" alt="" class="like">
			        <% } %>
			        <% for(MusicLike ml:cHeartList){ %>
			            <% if(ml.getMusicNo()==list.get(3*i+2).getMusicNo()){ %>
			            	<span><%= ml.getcHeartCount() %></span>
			            <% break; } %>
				    <% } %>
			       	</div>
                </div>
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
$("#MusicTable #likeBox>img").on("click",(e)=>{
	let like="<%= request.getContextPath() %>/images/like.png";
	let unlike="<%= request.getContextPath() %>/images/unlike.png"
	if($(e.target).attr("src")==like){
		$(e.target).attr("src",unlike);
	}else {
		$(e.target).attr("src",like);
	}   
	
	$.ajax({
		url:"<%=request.getContextPath()%>/ajax/aHeartCount",
		data:{"type":"music","itemNo":$(e.target).parent().prev().val(),"memberId":"<%=id%>"},
		
		success:(data)=>{
			const HeartResult= data["cHeartResult"];
			 $(e.target).prev().text(HeartResult);
		}
	}); 
});

$("#shopTopTap>span:nth-child(1)").on("click",(e)=>{
	$.ajax({
		url:"<%=request.getContextPath()%>/ajax/shopTotalTitleOrder",
		data:{"type":"music"},
		success:(data)=>{
			 $("#section").html(data);
		}
	});
});
$("#shopTopTap>span:nth-child(3)").on("click",(e)=>{
	$.ajax({
		url:"<%=request.getContextPath()%>/ajax/shopLikeOrder",
		data:{"type":"music"},
		success:(data)=>{
			 $("#section").html(data);
		}
	});
});
$("#shopTopTap>span:nth-child(5)").on("click",(e)=>{
	$.ajax({
		url:"<%=request.getContextPath()%>/ajax/shopPriceOrder",
		data:{"type":"music"},
		success:(data)=>{
			 $("#section").html(data);
		}
	});
});
$("#shopTopTap>span:nth-child(7)").on("click",(e)=>{
	$.ajax({
		url:"<%=request.getContextPath()%>/ajax/shopPopularOrder",
		data:{"type":"music"},
		success:(data)=>{
			 $("#section").html(data);
		}
	});
});
var shopSearchItem=(event)=>{
	$.ajax({
		url:"<%=request.getContextPath()%>/ajax/shopSearchItem.do",
		data:{"searchKey":$(event.target).prev().prev().val(),"type":"music"},
		success:data=>{
			$("#section").html(data);
		}
	});
	
};
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
