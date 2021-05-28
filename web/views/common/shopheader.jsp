<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/shop/shopheader.css">


<div id="shopHeader">
	<div id="searchShop">
		<form>
		    <input id="searchTap" type="text">
		    <img src="<%=request.getContextPath()%>/images/shop_search.png" alt="검색버튼" type="submit" value="검색">
		</form>
	</div>

	<div id="shopTopTap">
		<span class="TopTap">전체</span>
		<span>  |  </span>
		<span class="TopTap">추천순</span>
		<span>  |  </span>
		<span class="TopTap">가격순</span>
		<span>  |  </span>
		<span class="TopTap">인기순</span>
	</div>    
</div>
<script src='<%=request.getContextPath()%>/js/shop/contentShop.js'></script>