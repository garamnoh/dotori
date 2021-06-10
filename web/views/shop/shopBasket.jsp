<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List" import="com.shop.model.vo.Minimi,com.shop.model.vo.Skin,com.shop.model.vo.Music,com.shop.model.vo.ShoppingList,java.util.List,com.member.model.vo.Member"%>
<%
	//List<ShoppingList> list=(List<ShoppingList>)request.getAttribute("inBasket");
	String type=(String)request.getAttribute("type");
	List<Minimi> a=(List<Minimi>)request.getAttribute("a");
	List<Skin> b=(List<Skin>)request.getAttribute("b");
	List<Music> c=(List<Music>)request.getAttribute("c");
	Member id = (Member)session.getAttribute("loginMember");
	String msg=(String)request.getAttribute("msg");
	
%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/shop/shopbasket.css">

<form id="AllBasketForm"  method="post">

	<div class="basketheader">
		<p>장바구니</p>
		<input type="button" value="전체체크박스선택하기" class="check-all">
		<input type="button" value="장바구니에서삭제하기" onclick="deleteInBasket();">
	</div>
	
	<div class="basketbody">
	<%if(a!=null) {%>
		<%for(int i=0;i<a.size();i++){ %> 
		<div class="basketCols">
			<div class="mybasketMinimi">
				<div class="basketCheck">
					<input class="aShopbasketCheck" type="checkbox" onclick="TotalCheckbox();">
					<input type="hidden" value="<%=a.get(i).getItemNo() %>">
					<input type="hidden" value="<%=a.get(i).getPrice()%>">
				</div>
				<div class="basketImg">
					<img alt="내가고른아이템사진" src="<%=request.getContextPath()%>/upload/MINIMI/<%=a.get(i).getFilepath() %>" class="myItem">
				</div>
				<div class="basketInfo">
					<ul>
						<li><b><%=a.get(i).getTitle() %></b></li>
				        
				        <li><b>도토리<%=a.get(i).getPrice() %> 개</b>
				        </li>
					</ul>
				</div>
			</div>
		</div>
		<%}} %>
	<%if(b!=null) { %>
		<%for(int i=0;i<b.size();i++){ %>	
		<div class="basketCols">
			<div class="mybasketSkin">
				<div class="basketCheck">
					<input class="bShopbasketCheck" type="checkbox" onclick="TotalCheckbox();">
					<input type="hidden" value="<%=b.get(i).getItemNo() %>">
					<input type="hidden" value="<%=b.get(i).getPrice()%>">
				</div>
				<div class="basketImg">
					<img alt="내가고른아이템사진" src="<%=request.getContextPath() %>/upload/SKIN_ITEM/<%=b.get(i).getPreviewImgFilepath() %>" class="myItem">
				</div>
				<div class="basketInfo">
					<ul>
						<li><b><%=b.get(i).getSkinTitle() %></b></li>
				        <li><b>도토리<%=b.get(i).getPrice() %> 개</b></li>
				   </ul>
				</div>
				
			</div>	
		</div>
		
		<%}} 
		%>
	<%if(c!=null) {%>
		<%for(int i=0;i<c.size();i++){ %>
		<div class="basketCols">
			<div class="mybasketMusic">
				<div class="basketCheck">
					<input class="cShopbasketCheck" type="checkbox" onclick="TotalCheckbox();">
					<input type="hidden" value="<%=c.get(i).getMusicNo() %>">
					<input type="hidden" value="<%=c.get(i).getPrice()%>">
				</div>
				<div class="basketImg">
					<img alt="내가고른뮤직사진" src="<%=request.getContextPath() %>/upload/MUSIC/<%=c.get(i).getImgFilepath() %>" class="myItem">
				</div>
				<div class="basketInfo">
					<ul>
						<li><b><%=c.get(i).getMusicTitle() %></b></li>
				        <li><b>도토리<%=c.get(i).getPrice() %> 개</b></li>
				   </ul>
				</div>
				
			</div>	
		</div>
	</div>
		<%}}
		%>
		
	
	
	<div class="basketfooter">
		<div class="basketCount">
		
			<p>총 도토리 구매수량 :<span id="totalPrice"></span></p>
			<p>내가 가진 도토리 수 :<%=id.getDotori() %></p>
		</div>
	
		<div class="basketButtons">
			<input type="button" value="도토리 충전하기" onclick="buyDotoriGo();"><input type="button" value="결제하기" onclick="buyAll()">
		</div>
	</div>
	

</form>

<input type="hidden" id="contextPath" value="<%=request.getContextPath()%>">
<input type="hidden" id="loginMemberId" value="<%=id.getMemberId()%>">

<script>
	function deleteInBasket(){
		let aCheck=new Array();
		document.querySelectorAll(".aShopbasketCheck").forEach((v,i)=>{
			if($(v).prop("checked")) aCheck.push($(v).next().val());
			console.log("a "+$(v).next().val());
		});
		
		let bCheck=new Array();
		document.querySelectorAll(".bShopbasketCheck").forEach((v,i)=>{
			if($(v).prop("checked")) bCheck.push($(v).next().val());
			console.log("b "+$(v).next().val());
		});
		let cCheck=new Array();
		document.querySelectorAll(".cShopbasketCheck").forEach((v,i)=>{
			if($(v).prop("checked")) cCheck.push($(v).next().val());
			console.log("c "+$(v).next().val());
		});
		
		$.ajax({
			url:"<%=request.getContextPath()%>/ajax/deleteInBasket",
			
			data:{"memberId": "<%=id%>","aitemNo":aCheck.toString(),"bitemNo":bCheck.toString(),"citemNo":cCheck.toString()},
			success:data=>{
				$("#section").html(data);
			}
			
		});
	}
	
	function buyDotoriGo(){
		$.ajax({
			url:"<%=request.getContextPath()%>/ajax/goDotoriPay",
			
			data:{},
			success:data=>{
				$("#section").html(data);
			}
			
		});
	}

	$('input[type=button].check-all').click((e)=>{
		$('.aShopbasketCheck').each((i,v)=>{
			$(v).prop("checked","checked");
		});
		$(".bShopbasketCheck").each((i,v)=>{
			$(v).prop("checked","checked");
		});
		$(".cShopbasketCheck").each((i,v)=>{
			$(v).prop("checked","checked");
		});
	});

	
	function buyAll(){
		
		let aCheck=new Array();
		document.querySelectorAll(".aShopbasketCheck").forEach((v,i)=>{
			if($(v).prop("checked")) aCheck.push($(v).next().val());
			console.log("a "+$(v).next().val());
		});
		
		let bCheck=new Array();
		document.querySelectorAll(".bShopbasketCheck").forEach((v,i)=>{
			if($(v).prop("checked")) bCheck.push($(v).next().val());
			console.log("b "+$(v).next().val());
		});
		let cCheck=new Array();
		document.querySelectorAll(".cShopbasketCheck").forEach((v,i)=>{
			if($(v).prop("checked")) cCheck.push($(v).next().val());
			console.log("c "+$(v).next().val());
		});
		
		$.ajax({
			url:"<%=request.getContextPath()%>/ajax/buyAll.do",
			traditional :true, 
			data:{"memberId": "<%=id%>","aitemNo":aCheck.toString(),"bitemNo":bCheck.toString(),"citemNo":cCheck.toString(),"myDotoriNums":<%=id.getDotori() %>,"itemDotoriNums":$('#totalPrice').text()},
			success:data=>{
				$("#section").html(data);
			}
		});
	}
	
	
	 var TotalCheckbox=()=>{
		let aDotoriCount=0;
		let bDotoriCount=0;
		let cDotoriCount=0;
		
		$(".aShopbasketCheck").each((i,v)=>{
			if($(v).prop("checked")) {
				aDotoriCount+=parseInt($(v).next().next().val())
			}
		});
		$(".bShopbasketCheck").each((i,v)=>{
			if($(v).prop("checked")) {
				bDotoriCount+=parseInt($(v).next().next().val())
			}
		});
		
		$(".cShopbasketCheck").each((i,v)=>{
			if($(v).prop("checked")) {
				cDotoriCount+=parseInt($(v).next().next().val())
			}
		});
		
		let totalDotoriCount= aDotoriCount+bDotoriCount+cDotoriCount;
		
		document.getElementById("totalPrice").innerText=totalDotoriCount;
		
	}
	
	<%if(msg!=null){%>
		alert("<%=msg%>");
	<%}%>
	

	
</script>



	