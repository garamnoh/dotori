<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id='titleFriend'>
	<p>Friend</p>
	<div>
		최근 <input id='date' type='text' value='3'>일
	</div>
</div>
<div id='logResultContainer'>
	<%@ include file='/views/friends/sub/logResult.jsp' %>
</div>


<style>
	#titleFriend{
		width: 100%;
		margin-top: 30px;
		margin-bottom: 30px;
		padding-bottom: 5px;
		font-weight: bold;
		border-bottom: 1px solid #eee;
		display: flex;
		justify-content: space-between;
	}
	
	#titleFriend #date{
		width: 20px;
		border: none;
		border-bottom: 2px solid gray;
		text-align: center;
	}
	
	#titleFriend>div{
		font-size: 14px;
		font-weigth: 300;
		color: gray;
	}
	
	#titleFriend #date:focus{
		outline: none;
		text-align: center;
	}
</style>

<script>
	$('#titleFriend #date').on('keyup', (e)=>{
		if(e.keyCode == 13){
			
			$('#logResultContainer').html('');
			var period = $('#date').val();
			if(period == 0) {
				period = 1;
				$('#date').val('1');
			}
			
			console.log('period', period);
			
			$.ajax({
				url: '<%=request.getContextPath() %>/friends/logPeriod',
				data: {
					'period': period
				},
				success: (data)=>{
					$('#logResultContainer').html(data);
				}
			});
		}
	});
</script>