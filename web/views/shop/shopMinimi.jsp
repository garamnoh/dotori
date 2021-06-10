<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,com.shop.model.vo.Minimi,com.member.model.vo.Member,com.shop.model.vo.MinimiLike"%>
<%
List<Minimi> list=(List<Minimi>)request.getAttribute("minimiList");
Minimi mini=(Minimi)request.getAttribute("minimi");
String id=(String)request.getAttribute("memberId"); 
String result=(String)request.getAttribute("result");
List<MinimiLike> aHeartList=(List<MinimiLike>)request.getAttribute("aheartList");
List<Integer> myHeartItemList=(List<Integer>)request.getAttribute("myHeartItemList");

%> 
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/shop/shopProductMinimi.css">

<%@ include file="/views/common/shopheader.jsp"%>

<form id="AllMinimiForm" action="<%=request.getContextPath()%>/shop/minimiTable" method="post">
	<%if(list!=null&&list.isEmpty()){ %>
		<p>조회된 데이터가 없습니다</p>
	<%}else{%> 
		<table id='MinimiTable'>
		<% for(int i=0;i<list.size()/3+1;i++){%> 
		<%if(3*i<list.size()) {%>
		<tr>
			<td>
			<div class="productMinimi">
				<div class="MinimiPicture">
					<img alt="미니미사진" src="<%=request.getContextPath()%>/upload/MINIMI/<%=list.get(3*i).getFilepath()%>"> 
				</div>
				<br>
                <div class="MinimiInfo">
                	<div class="minimiline">
		                <input class="shopMinimiCheck" type="checkbox" name="Check_YN">
		                <input type="hidden" value="<%=list.get(3*i).getItemNo() %>">
				        <%
	            		boolean likeOrNot = false;
	            		for(Integer mhl:myHeartItemList){
	            		if(mhl==list.get(3*i).getItemNo()){
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
			            <% for(MinimiLike ml:aHeartList){ %>
			            	<% if(ml.getItemNo()==list.get(3*i).getItemNo()){ %>
			            		<span><%= ml.getaHeartCount() %></span>
			            	<% break; } %>
				        <% } %>
			       		</div>
		            </div>
		            <ul>
		                <%-- <li><b>[<%=list.get(3*i).getSinger()%>]</b></li> --%>
		                <li><b><%=list.get(3*i).getTitle() %></b></li>
		                <li><b>도토리 <%=list.get(3*i).getPrice() %>개</b></li>
		            </ul>
	                <input id='test9' class="shopMinimiCheck" type="checkbox" disabled="disabled">
	                
                </div>
                
			</div>
			</td>
			<%} %>
			<%if(3*i+1<list.size()) {%>
			<td>
			<div class="productMinimi">
				<div class="MinimiPicture">
					<img alt="미니미사진" src="<%=request.getContextPath()%>/upload/MINIMI/<%=list.get(3*i+1).getFilepath()%>"> 
				</div>
				<br>
                <div class="MinimiInfo">
                	<div class="minimiline">
	                <input class="shopMinimiCheck" type="checkbox" name="Check_YN">
	                <input type="hidden" value="<%=list.get(3*i+1).getItemNo() %>">
	                	<%
	            		boolean likeOrNot = false;
	            		for(Integer mhl:myHeartItemList){
	            		if(mhl==list.get(3*i+1).getItemNo()){
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
			            <% for(MinimiLike ml:aHeartList){ %>
			            <% if(ml.getItemNo()==list.get(3*i+1).getItemNo()){ %>
			            	<span><%= ml.getaHeartCount() %></span>
			            <% break; } %>
				        <% } %>
				       	</div>
	               	</div>
		                <ul>
		                    <%-- <li><b>[<%=list.get(3*i+1).getTitle()%>]</b></li> --%>
		                    <li><b><%=list.get(3*i+1).getTitle() %></b></li>
		                    <li><b>도토리 <%=list.get(3*i+1).getPrice() %>개</b></li>
		                </ul>
	                <input id='test9' class="shopMinimiCheck" type="checkbox" disabled="disabled">
                </div>
			</div>
			</td>
			<%} %>
			<td>
			<%if(3*i+2<list.size()) {%>
			<div class="productMinimi">
				<div class="MinimiPicture">
					<img alt="미니미사진" src="<%=request.getContextPath()%>/upload/MINIMI/<%=list.get(3*i+2).getFilepath()%>"> 
				</div>
				<br>
                <div class="MinimiInfo">
                <div class="minimiline">
	                <input class="shopMinimiCheck" type="checkbox" name="Check_YN">
	                <input type="hidden" value="<%=list.get(3*i+2).getItemNo() %>">
	                	<%
	            		boolean likeOrNot = false;
	            		for(Integer mhl:myHeartItemList){
	            		if(mhl==list.get(3*i+2).getItemNo()){
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
			            <% for(MinimiLike ml:aHeartList){ %>
			            <% if(ml.getItemNo()==list.get(3*i+2).getItemNo()){ %>
			            	<span><%= ml.getaHeartCount() %></span>
			            <% break; } %>
				        <% } %>
				    </div>
		        </div>
		                <ul>
		                    <%-- <li><b>[<%=list.get(3*i+2).getSinger()%>]</b></li> --%>
		                    <li><b><%=list.get(3*i+2).getTitle() %></b></li>
		                    <li><b>도토리 <%=list.get(3*i+2).getPrice() %>개</b></li>
		                </ul>
	                <input id='test9' class="shopMinimiCheck" type="checkbox" disabled="disabled">
                </div>
			</div>
			</td>
			<%} %>
		</tr>
		
	<%} 
	}%>
	
</form>




<script>

$("#MinimiTable #likeBox>img").on("click",(e)=>{
	let like="<%= request.getContextPath() %>/images/like.png";
	let unlike="<%= request.getContextPath() %>/images/unlike.png"
	if($(e.target).attr("src")==like){
		$(e.target).attr("src",unlike);
	}else {
		$(e.target).attr("src",like);
	}   
	
	$.ajax({
		url:"<%=request.getContextPath()%>/ajax/aHeartCount",
		data:{"type":"minimi","itemNo":$(e.target).parent().prev().val(),"memberId":"<%=id%>"},
		
		success:(data)=>{
			const HeartResult= data["aHeartResult"];
			 $(e.target).prev().text(HeartResult);
		}
	}); 
});

$("#shopTopTap>span:nth-child(1)").on("click",(e)=>{
	$.ajax({
		url:"<%=request.getContextPath()%>/ajax/shopTotalTitleOrder",
		data:{"type":"minimi"},
		success:(data)=>{
			 $("#section").html(data);
		}
	});
});
$("#shopTopTap>span:nth-child(3)").on("click",(e)=>{
	$.ajax({
		url:"<%=request.getContextPath()%>/ajax/shopLikeOrder",
		data:{"type":"minimi"},
		success:(data)=>{
			 $("#section").html(data);
		}
	});
});
$("#shopTopTap>span:nth-child(5)").on("click",(e)=>{
	console.log("test");
	$.ajax({
		url:"<%=request.getContextPath()%>/ajax/shopPriceOrder",
		data:{"type":"minimi"},
		success:(data)=>{
			 $("#section").html(data);
		}
	});
});
$("#shopTopTap>span:nth-child(7)").on("click",(e)=>{
	$.ajax({
		url:"<%=request.getContextPath()%>/ajax/shopPopularOrder",
		data:{"type":"minimi"},
		success:(data)=>{
			 $("#section").html(data);
		}
	});
});
var shopSearchItem=(event)=>{
	$.ajax({
		url:"<%=request.getContextPath()%>/ajax/shopSearchItem.do",
		data:{"searchKey":$(event.target).prev().prev().val(),"type":"minimi"},
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
	document.querySelectorAll(".shopMinimiCheck").forEach((v,i)=>{
		console.dir(v);
		if($(v).prop("checked")) arr.push($(v).next().val());
	});
	
	console.log(arr.toString());
	
	$.ajax({
		url:"<%=request.getContextPath()%>/shop/shopBasketInsert.do",
		type:"get",
		data:{"memberId": "<%=id%>","itemNums":arr.toString(),"type":"minimi"},
		dataType:"html",
		success:data=>{
			
			
			$("#section").html(data);
		}
		
	});
}

<%if(result!=null){%>
alert("<%=result%>");
<%}%>

$(".shopTopTap>span")


</script>
