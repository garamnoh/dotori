<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<p id='title'>일촌관리</p>

<div id='content1'>
	<div id='administration'>
		<form action='' method='post' id='search'>
			<select name='searchType' id='searchType'>
				<option value='memberName' id='memberName'>이름</option>
				<option value='nickName' id='nickName'>별명</option>
			</select>
			<input type='text' name='searchKeyword' id='searchKeyword'>
		</form>
		<div id='detail'>
			<img src='<%=request.getContextPath() %>/images/profile_img_default.png'>
			<div id='person'>
				<span>이름</span>
				<span>전화번호</span>
				<span>이메일</span>
			</div>
			<div id='buttons'>
				<button id='minihome'>Mini</button>
				<button id='delete'>일촌끊기</button>
			</div>
		</div>
		<div id='detail'>
			<img src='<%=request.getContextPath() %>/images/profile_img_default.png'>
			<div id='person'>
				<span>이름</span>
				<span>전화번호</span>
				<span>이메일</span>
			</div>
			<div id='buttons'>
				<button id='minihome'>Mini</button>
				<button id='delete'>일촌끊기</button>
			</div>
		</div>
		<div id='detail'>
			<img src='<%=request.getContextPath() %>/images/profile_img_default.png'>
			<div id='person'>
				<span>이름</span>
				<span>전화번호</span>
				<span>이메일</span>
			</div>
			<div id='buttons'>
				<button id='minihome'>Mini</button>
				<button id='delete'>일촌끊기</button>
			</div>
		</div>
		<div id='detail'>
			<img src='<%=request.getContextPath() %>/images/profile_img_default.png'>
			<div id='person'>
				<span>이름</span>
				<span>전화번호</span>
				<span>이메일</span>
			</div>
			<div id='buttons'>
				<button id='minihome'>Mini</button>
				<button id='delete'>일촌끊기</button>
			</div>
		</div>
		<div id='detail'>
			<img src='<%=request.getContextPath() %>/images/profile_img_default.png'>
			<div id='person'>
				<span>이름</span>
				<span>전화번호</span>
				<span>이메일</span>
			</div>
			<div id='buttons'>
				<button id='minihome'>Mini</button>
				<button id='delete'>일촌끊기</button>
			</div>
		</div>
		<div id='detail'>
			<img src='<%=request.getContextPath() %>/images/profile_img_default.png'>
			<div id='person'>
				<span>이름</span>
				<span>전화번호</span>
				<span>이메일</span>
			</div>
			<div id='buttons'>
				<button id='minihome'>Mini</button>
				<button id='delete'>일촌끊기</button>
			</div>
		</div>
		<div id='detail'>
			<img src='<%=request.getContextPath() %>/images/profile_img_default.png'>
			<div id='person'>
				<span>이름</span>
				<span>전화번호</span>
				<span>이메일</span>
			</div>
			<div id='buttons'>
				<button id='minihome'>Mini</button>
				<button id='delete'>일촌끊기</button>
			</div>
		</div>
		<div id='detail'>
			<img src='<%=request.getContextPath() %>/images/profile_img_default.png'>
			<div id='person'>
				<span>이름</span>
				<span>전화번호</span>
				<span>이메일</span>
			</div>
			<div id='buttons'>
				<button id='minihome'>Mini</button>
				<button id='delete'>일촌끊기</button>
			</div>
		</div>
		<div id='detail'>
			<img src='<%=request.getContextPath() %>/images/profile_img_default.png'>
			<div id='person'>
				<span>이름</span>
				<span>전화번호</span>
				<span>이메일</span>
			</div>
			<div id='buttons'>
				<button id='minihome'>Mini</button>
				<button id='delete'>일촌끊기</button>
			</div>
		</div>
		<div id='detail'>
			<img src='<%=request.getContextPath() %>/images/profile_img_default.png'>
			<div id='person'>
				<span>이름</span>
				<span>전화번호</span>
				<span>이메일</span>
			</div>
			<div id='buttons'>
				<button id='minihome'>Mini</button>
				<button id='delete'>일촌끊기</button>
			</div>
		</div>
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
	}
	
	#content1>#administration{
		width: 100%;
		display: flex;
		flex-direction: column;
	}
	
	#content1>#administration>form{
		width: 100%;
		margin-bottom: 20px;
		display: flex;
		border: none;
		border-radius: 2px;
		align-items: center;
	}
	
	#content1>#administration>form>select{
		width: 150px;
		height: 25px;
		border: none;
		border-radius: 2px;
	}
	
	#content1>#administration>form>input{
		flex-grow: 1;
		height: 20px;
		margin-left: 10px;
		text-align: center;
	}
	
	#content1>#administration>form>input:focus{
		outline: none;
	}
	
	#content1>#administration>#detail{
		width: auto;
		display: flex;
		align-items: center;
		justify-content: space-between;
	    border: #eee 1px solid;
	    /* backdrop-filter: saturate(80%) blur(10px); */
	    border-radius: 5px;
	    padding: 5px 10px;
	    margin-bottom: 10px;
	}
	
	#content1>#administration>#detail>img{
		width: 40px;
		border-radius: 50%
	}
	
	#content1>#administration>#detail>#person>span{
		font-size: 14px;
		font-weight: 300;
		margin: 0 50px;
	}
	
	#content1>#administration>#detail>#buttons>button{
		background-color: #eee;
		border: none;
		border-radius: 5px;
		width: 80px;
		height: 30px;
		margin-left: 10px;
		font-size: 12px;
		font-weight: 700;
	}
	
	#content1>#administration>#detail>#buttons>#delete{
		background-color: tomato;
	}
	
	#content1>#administration>#detail>#buttons>button:hover{
		opacity: .7;
	}
	
	#content1>#administration>#detail>#buttons>button:active{
		opacity: 1;
	}
	
</style>