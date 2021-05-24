<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/shop/sideShop.css">
    
<div class="menuOption">
    <div id="optionTitle">SHOP</div>
    <div class='menuTitle' id="option1">도토리</div>
    <div class="menuSub">
        <p id='charge'>충전하기</p>
        <p id='gift'>선물하기</p>
    </div>
    <div class='menuTitle' id="option2">아이템</div>
    <div class="menuSub">
        <p id='minime'>미니미</p>
        <p id='skin'>스킨</p>
        <p id='music'>음악</p>
    </div>
    <div class='menuTitle' id="option3">장바구니</div>
</div>

<script src='<%=request.getContextPath()%>/js/shop/sidebarShop.js'></script>