<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List" import="com.shop.model.vo.Minimi,com.shop.model.vo.Skin,com.shop.model.vo.Music,com.shop.model.vo.ShoppingList,java.util.List,com.member.model.vo.Member"%>
<%
	//List<ShoppingList> list=(List<ShoppingList>)request.getAttribute("inBasket");
	String type=(String)request.getAttribute("type");
	List<Minimi> a=(List<Minimi>)request.getAttribute("a");
	List<Skin> b=(List<Skin>)request.getAttribute("b");
	List<Music> c=(List<Music>)request.getAttribute("c");
	Member id = (Member)session.getAttribute("loginMember");

%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/shop/shopbasket.css">

<form id="AllBasketForm"  method="post">

	<div class="basketheader">
		<p>장바구니</p>
		<button class="check-all">전체선택하기</button>
	</div>
	
	<div class="basketbody">
	<%if(a!=null) {%>
		<%for(int i=0;i<a.size();i++){ %> 
		<div class="basketCols">
			<div class="mybasketMinimi">
				<div class="basketCheck">
					<input class="aShopbasketCheck" type="checkbox">
					<input type="hidden" value="<%=a.get(i).getItemNo() %>">
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
				<div class="basketselectCount">
					<span>구입할 수량 :</span>
					<input class="aCount" type="number" value="1" min="1" max="10">
				</div>
			</div>
		</div>
		<%}} %>
	<%if(b!=null) { %>
		<%for(int i=0;i<b.size();i++){ %>	
		<div class="basketCols">
			<div class="mybasketSkin">
				<div class="basketCheck">
					<input class="bShopbasketCheck" type="checkbox">
					<input type="hidden" value="<%=b.get(i).getItemNo() %>">
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
				<div class="basketselectCount">
					<span>구입할 수량 :</span>
					<input class="bCount" type="number" value="1" min="1" max="10">
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
					<input class="cShopbasketCheck" type="checkbox">
					<input type="hidden" value="<%=c.get(i).getMusicNo() %>">
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
				<div class="basketselectCount">
					<span>구입할 수량 :</span>
					<input class="cCount" type="number" value="1" min="1" max="10">
				</div>
			</div>	
		</div>
	</div>
		<%}}
		%>
		
	
	
	<div class="basketfooter">
		<div class="basketCount">
		
			<p>총 도토리 구매수량 :</p>
			<p>내가 가진 도토리 수 :<%=id.getDotori() %></p>
		</div>
	
		<div class="basketButtons">
			<input type="button" id="presentItemBtn" value="선물하기"><input type="button" value="도토리 충전하기">도토리 충전하기</button><input type="button" value="결제하기" onclick="buyAll()">결제하기</button>
		</div>
	</div>
	

</form>

<input type="hidden" id="contextPath" value="<%=request.getContextPath()%>">
<input type="hidden" id="loginMemberId" value="<%=id.getMemberId()%>">

<script>
	$(documemt).ready(function() {
		$('.check-all').click(function() {
			$('.aShopbasketCheck').prop('checked',this.checked);
			$('.bShopbasketCheck').prop('checked',this.checked);
			$('.cShopbasketCheck').prop('checked',this.checked);
		});
	});
	
	function buyAll(){
		
		let aCheck=new Array();
		document.querySelectorAll(".aShopbasketCheck").forEach((v,i)=>{
			if($(v).prop("checked")) aCheck.push($(v).next().val());
		});
		
		let bCheck=new Array();
		document.querySelectorAll(".bShopbasketCheck").forEach((v,i)=>{
			if($(v).prop("checked")) bCheck.push($(v).next().val());
		});
		let cCheck=new Array();
		document.querySelectorAll(".cShopbasketCheck").forEach((v,i)=>{
			if($(v).prop("checked")) cCheck.push($(v).next().val());
		});
		
		$.ajax({
			url:"<%=request.getContextPath()%>/ajax/buyAll.do",
			traditional :true, 
			data:{"memberId": "<%=id%>","aitemNo":aCheck.toString(),"bitemNo":bCheck.toString(),"citemNo":cCheck.toString()},
			success:data=>{
				alert("구매 완료");
			}
			
		});
	}
	
	
	
	
	
	/* 사용자가 미니미 ,스킨, 뮤직에서 사고픈 개수 */
	const avalue = document.getElementsByName('aCount').value;
	const bvalue = document.getElementsByName('bCount').value;
	const cvalue = document.getElementsByName('cCount').value;
	
	
	const result1= <%=a.get(i).getPrice() %>*avalue[i];
	
	const result2= <%=b.get(i).getPrice() %>*bvalue2[2];
	
	const result3= <%=c.get(i).getPrice() %>*cvalue3[3];
	 
	  
	  else{
		  
		  const result=value*100;
	
	  document.getElementById("result").innerText = result;
	  } 


</script>



	