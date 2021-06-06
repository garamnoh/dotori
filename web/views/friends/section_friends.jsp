<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 


<p id='title'>일촌관리</p>

<div id='content1'>
	<div id='administration'>
		<div id='searchBar'>
			<select name='searchType' id='searchType'>
				<option value='memberName' id='memberName'>이름</option>
				<option value='nickName' id='nickName'>별명</option>
			</select>
			<input type='text' name='searchKeyword' id='searchKeyword'>
			
<!-- 			<div id="byName">
			    <div>
			        <input type="text" name="searchKeyword" id='typeIdKeyword' placeholder="아이디 검색">
			        <input type="hidden" name="searchType" id='typeId' value="MEMBER_ID">
			        <button type="submit" id='submit_typeId'>id</button>
			    </div>
			</div>
			<div id="byName" class="hide">
			    <div>
			        <input type="text" name="searchKeyword" id='typeNameKeyword' placeholder="이름 검색">
			        <input type="hidden" name="searchType" id='typeName' value="MEMBER_NAME">
			        <button type="submit" id='submit_typeName'>name</button>
			    </div>
			</div> -->
			
		</div>
		<div id='searchResult'>
			<%@ include file='/views/friends/sub/searchResult.jsp' %>
		</div>
	</div>
</div>


<style>
	#title{
		width: 100%;
		margin-top: 30px;
		margin-bottom: 30px;
		padding-bottom: 5px;
		font-weight: bold;
		border-bottom: 1px solid #eee;
	}
	
	#content1{
		width: 100%;
		height: 100%;
	}
	
	#content1>#administration{
		width: 100%;
		height: 100%;
		display: flex;
		flex-direction: column;
	}
	
	#content1>#administration#searchResult{
		width: 80%;
		overflow: scroll;
	}
	
	#content1>#administration>#searchBar{
		width: 100%;
		margin-bottom: 20px;
		display: flex;
		border: none;
		border-radius: 2px;
		align-items: center;
	}
	
	#content1>#administration>#searchBar>select{
		width: 150px;
		height: 25px;
		border-radius: 2px;
	}
	
	#content1>#administration>#searchBar>input{
		flex-grow: 1;
		height: 20px;
		margin-left: 10px;
		text-align: center;
	}
	
	#content1>#administration>#searchBar>input:focus{
		outline: none;
	}
</style>


<script>
	$('')
</script>