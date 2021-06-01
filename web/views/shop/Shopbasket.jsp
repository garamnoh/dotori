<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,com.shop.model.vo.Music"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/shop/shopbasket.css">

<p>장바구니</p>

<%-- <img alt="내가고른아이템사진" src="<%=request.getContextPath()%>/upload/MINIMI/<%=%>">
	
	<%if(list==null&&list.isEmpty()){ %>
		<p>조회된 데이터가 없습니다</p>
	<%}else{%> 

	<%for(int i=0;i<list.size()/3+1;i++){ %>
	<ul>
	
		<input class="shopbasketCheck" type="checkbox">
		<li><b>[<%=list.get(3*i).getSinger()%>]</b></li>
        <li><b><%=list.get(3*i).getTitle() %></b></li>
        <li><b>도토리 <%=list.get(3*i).getPrice() %>개</b>
        </li>
	</ul> --%>
	<%} 
	}%>
	
	<img alt="한꺼번에버튼" src="">
	
	<p> 총 구매 수량 :
		내가 가진 도토리 수 :
	</p>
	
	<button>취소</button> <button>도토리 충전하기</button><button>결제하기</button>
	
	