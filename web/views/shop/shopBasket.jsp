<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List" import="com.shop.model.vo.ShoppingList,java.util.String"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/shop/shopbasket.css">

<%
	//List<ShoppingList> list=(List<ShoppingList>)request.getAttribute("inBasket");
	
	String type=(String)request.getAttribute("type");
%>
<form id="AllBasketForm" action="" method="post">
<div class="Allbasket">
	<div class="basketheader">
		<p>장바구니</p>
		<button>전체선택하기</button>
	</div>
	<%if(list==null&&list.isEmpty()){ %>
		<p>조회된 데이터가 없습니다</p>
	<%}else{%>
	<div class="basketbody">
		<%if(type.equals("minimi")) {%>
		<%for(int i=0;i<a.size();i++){ %>
		<div class="basketCols">
			<div class="mybasketMinimi">
				<div class="basketCheck">
					<input class="shopbasketCheck" type="checkbox">
				</div>
				<div class="basketImg">
					<img alt="내가고른아이템사진" src="<%=request.getContextPath()%>/upload/MINIMI/pooh.png" class="myItem">
				</div>
				<div class="basketInfo">
					<ul>
						<li><b>테스트</b></li>
				        <li><b>테스트</b></li>
				        <li><b>도토리 개</b>
				        </li>
					</ul>
				</div>
				<div class="basketselectCount">
					<span>구입할 수량 :</span>
					<input type="number">
				</div>
			</div>
		</div>
		<%} 
		}%>
		<%if(type.equals("skin")) { %>
		<%for(int i=0;i<b.size();i++){ %>	
		<div class="basketCols">
			<div class="mybasketSkin">
				<div class="basketCheck">
					<input class="shopbasketCheck" type="checkbox">
				</div>
				<div class="basketImg">
					<img alt="내가고른아이템사진" src="<%=request.getContextPath() %>/upload/SKIN_ITEM/skin_item03.jpg" class="myItem">
				</div>
				<div class="basketInfo">
					<ul>
						<li><b>테스트</b></li>
				        <li><b>테스트</b></li>
				        <li><b>도토리 개</b></li>
				   </ul>
				</div>
				<div class="basketselectCount">
					<span>구입할 수량 :</span>
					<input type="number">
				</div>
			</div>	
		</div>
		
		<%} 
		}%>
		<%if(type.equals("music")) { %>
		<%for(int i=0;i<c.size();i++){ %>
		<div class="basketCols">
			<div class="mybasketMusic">
				<div class="basketCheck">
					<input class="shopbasketCheck" type="checkbox">
				</div>
				<div class="basketImg">
					<img alt="내가고른뮤직사진" src="<%=request.getContextPath() %>/upload/MUSIC/music_item03.jpg" class="myItem">
				</div>
				<div class="basketInfo">
					<ul>
						<li><b>테스트</b></li>
				        <li><b>테스트</b></li>
				        <li><b>도토리 개</b></li>
				   </ul>
				</div>
				<div class="basketselectCount">
					<span>구입할 수량 :</span>
					<input type="number">
				</div>
			</div>	
		</div>
	</div>
		<%} 
		}%>
		
	<%} %>
	
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



	