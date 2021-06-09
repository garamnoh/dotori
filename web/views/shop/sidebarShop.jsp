<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/shop/sideShop.css">
    
<div class="menuOption">
    <div id="optionTitle">SHOP</div>
    <div class='menuTitle' id="option0">상품 추천</div>
    <div class="menuSub">
    	<p id='bestItem'>인기 아이템</p>
    	<p id='saleItem'>세일 아이템</p>
    </div>
    <div class='menuTitle' id="option1">도토리</div>
    <div class="menuSub"></div>
    <div class='menuTitle' id="option2">아이템</div>
    <div class="menuSub">
        <p id='shopMinimi'>미니미</p>
        <p id='shopSkin'>스킨</p>
        <p id='shopMusic'>음악</p>
    </div>
    <div class='menuTitle' id="option3">장바구니</div>
</div>

<script src='<%=request.getContextPath()%>/js/shop/sidebarShop.jsp'></script>