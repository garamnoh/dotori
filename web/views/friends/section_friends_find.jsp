<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<p id='title'>친구찾기</p>

<div id='content1'>
	<div id='find'>
		<div id='find_'>
			<label>검색년도(yyyy)</label>
			<input type='number' name='from' id='from'>&nbsp; - &nbsp;<input type='number' name='to' id='to'>
			<label>이름</label>
			<input type='text' name='searchKeyword' id='searchKeyword'>
			<input type="submit" name='searchBtn' id='searchBtn' value='찾기'>
		</div>
	</div>
	<div id='findResult'>
		<%@ include file='/views/friends/sub/searchSomeone.jsp' %>
	</div>
</div>

<style>
	#title{
		width: 100%;
		font-size: 16px;
		font-weight: 500;
		margin: 20px 0;
	}
	
	#content1{
		width: 100%;
		height: 91%;
		display: flex;
		flex-direction: column;
	}
	
	#content1>#find{
		width: 100%;
	}
	
	#content1>#find>#find_{
		display: flex;
		align-items: center;
		margin-bottom: 20px;
	}
	
	#content1>#find>#find_>label{
		font-size: 14px;
		margin-right: 10px;
	}
	
	#content1>#find>#find_>input#to{
		margin-right: 20px;
	}
	
	#content1>#find>#find_>input#from,
	#content1>#find>#find_>input#to{
		width: 100px;
		height: 20px;
	}
	
	#content1>#find>#find_>input#searchKeyword{
		flex-grow: 1;
		height: 20px;
		text-align: center;
	}
	
	#content1>#find>#find_>input#searchBtn{
		margin-left: 10px;
		border: none;
		height: 26px;
		width: 50px;
		font-size: 12px;
	}
	
	#content1>#findResult{
		flex-grow: 1;
		overflow: scroll;
	}
</style>

<script>
	$('#find #searchBtn').on('click', ()=>{
		const searchKeyword = $('#searchKeyword').val();
		$('#findResult').html('');
		
		$.ajax({
			url: '<%=request.getContextPath() %>/friends/searchSomeone',
			data: {
				'searchKeyword': searchKeyword
			},
			success: data=>{
				$('#content1 #findResult').append(data);
			}
		});
	});
</script>