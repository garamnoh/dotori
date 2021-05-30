<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.shop.model.vo.Minimi, java.util.ArrayList" %>
<%
	ArrayList<Minimi> minimiList = (ArrayList<Minimi>)request.getAttribute("minimiList");
%>
    <div id="title"><p>MINIMI</p></div>
	<div id='editMinimiContainer'>
		<% for(Minimi minimi: minimiList){ %>
			<div id="item_minimi">
				<img src='<%= request.getContextPath() %>/upload/MINIMI/<%= minimi.getFilepath() %>'>
				<p><%= minimi.getTitle() %></p>
				<input type='hidden' name='updateMinimi', id='updateMinimi' value='<%= minimi.getFilepath() %>'>
				<button id='btnMinimi'>미니미 변경</button>
			</div>
		<% } %>
	</div>

<style>
	#title{
	    font-size: 20px;
	    margin-top: 20px;
	    margin-bottom: 30px;
	}
		
	#editMinimiContainer{
		display: flex;
		flex-wraP: wrap;
		padding-left: 50px;
		overflow: scroll;
	}
	
	#editMinimiContainer>#item_minimi{
		display: flex;
		flex-direction: column;
		width: auto;
		height: auto;
		margin: 10px 20px;
		border: 1px solid #eee;
		padding: 10px;
	}
	
	#editMinimiContainer>#item_minimi>img{
		padding: 4px;
		width: 200px;
		height: 200px;
		border: 1px solid #eee;
		border-radius: 50%;
	}
	
	#editMinimiContainer>#item_minimi>p{
		margin: 10px 0;
		text-align: center;
		font-size: 14px;
	}
	
	#editMinimiContainer>#item_minimi>button{
		border: none;
		background-color: #eee;
		padding: 10px;
		width: 100%;
	}
	
	#editMinimiContainer>#item_minimi>button:hover{
		opacity: .7;
	}
	
	#editMinimiContainer>#item_minimi>button:active{
		opacity: 1;
	}
	
	#editMinimiContainer>#item_minimi>button:focus{
		outline: none;
	}
</style>
<script>
	$('#editMinimiContainer button').on('click', (e)=>{
		
		const updateMinimi = $(e.target).prev().val();
		console.log(updateMinimi);
		
 		$.ajax({
			url: '<%= request.getContextPath() %>/updateMinimi',
			data: {
				'updateMinimi': updateMinimi
			},
			success: data=>{
				if(data['result'] > 0){
					$(document).find('img#minimi').attr('src','<%= request.getContextPath() %>/upload/MINIMI/'+updateMinimi);
					alert('minimi 변경 성공');
				} else{
					alert('minimi 변경 실패');
				}
			},
			error: (r, s, m)=>{
				console.log(r);
				console.log(s);
			}
		});
	});
</script>
