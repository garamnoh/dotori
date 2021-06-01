<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<p id='title'>친구찾기</p>

<div id='content1'>
	<div id='find'>
		<form action='' method='post' id='search'>
			<label>검색년도(yyyy)</label>
			<input type='number' name='from' id='from'>&nbsp; - &nbsp;<input type='number' name='to' id='to'>
			<label>이름</label>
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
				<button id='delete'>일촌신청</button>
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
				<button id='delete'>일촌신청</button>
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
				<button id='delete'>일촌신청</button>
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
				<button id='delete'>일촌신청</button>
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
				<button id='delete'>일촌신청</button>
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
	
	#content1>#find{
		width: 100%;
		display: flex;
		flex-direction: column;
	}
	
	#content1>#find>form{
		display: flex;
		align-items: center;
		margin-bottom: 20px;
	}
	
	#content1>#find>form>label{
		font-size: 14px;
		margin-right: 10px;
	}
	
	#content1>#find>form>input#to{
		margin-right: 20px;
	}
	
	#content1>#find>form>input#from,
	#content1>#find>form>input#to{
		width: 100px;
		height: 20px;
	}
	
	#content1>#find>form>input#searchKeyword{
		flex-grow: 1;
		height: 20px;
		text-align: center;
	}
	
	#content1>#find>#detail{
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
	
	#content1>#find>#detail>img{
		width: 40px;
		border-radius: 50%
	}
	
	#content1>#find>#detail>#person>span{
		font-size: 14px;
		font-weight: 300;
		margin: 0 50px;
	}
	
	#content1>#find>#detail>#buttons>button{
		background-color: #eee;
		border: none;
		border-radius: 5px;
		width: 80px;
		height: 30px;
		margin-left: 10px;
		font-size: 12px;
		font-weight: 700;
	}
	
	#content1>#find>#detail>#buttons>#delete{
		background-color: tomato;
	}
	
	#content1>#find>#detail>#buttons>button:hover{
		opacity: .7;
	}
	
	#content1>#find>#detail>#buttons>button:active{
		opacity: 1;
	}
	
</style>