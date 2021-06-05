<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List" import="com.shop.model.vo.Minimi,com.shop.model.vo.Skin,com.shop.model.vo.Music,com.shop.model.vo.ShoppingList,java.util.List"%>
<%
	//List<ShoppingList> list=(List<ShoppingList>)request.getAttribute("inBasket");
	String type=(String)request.getAttribute("type");
	List<Minimi> a=(List<Minimi>)request.getAttribute("a");
	List<Skin> b=(List<Skin>)request.getAttribute("b");
	List<Music> c=(List<Music>)request.getAttribute("c");
%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/shop/shopbasket.css">

<form id="AllBasketForm"  method="post">
<div class="Allbasket">
	<div class="basketheader">
		<p>장바구니</p>
		<button>전체선택하기</button>
	</div>
	
	<div class="basketbody">
	<%if(a!=null) {%>
		<%for(int i=0;i<a.size();i++){ %>
		<div class="basketCols">
			<div class="mybasketMinimi">
				<div class="basketCheck">
					<input class="shopbasketCheck" type="checkbox">
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
					<input type="number">
				</div>
			</div>
		</div>
		<%}} %>
	<%if(b!=null) { %>
		<%for(int i=0;i<b.size();i++){ %>	
		<div class="basketCols">
			<div class="mybasketSkin">
				<div class="basketCheck">
					<input class="shopbasketCheck" type="checkbox">
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
					<input type="number">
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
					<input class="shopbasketCheck" type="checkbox">
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
					<input type="number">
				</div>
			</div>	
		</div>
	</div>
		<%}}
		%>
		
	
	
	<div class="basketfooter">
		<div class="basketCount">
			<p>총 구매수량 :</p>
			<p>내가 가진 도토리 수 :</p>
		</div>
	
		<div class="basketButtons">
			<button>선물하기</button><button>도토리 충전하기</button><button>결제하기</button>
		</div>
	</div>
	
</div>
</form>


<script>



</script>



	