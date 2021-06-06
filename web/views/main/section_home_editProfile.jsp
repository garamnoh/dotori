<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.member.model.vo.Member" %>
<%
	Member member = (Member)request.getAttribute("member");
%>

    <div class="editContainer">
		<form action="" method="post" id="profileForm">
            <div class="boxTitle">
                <p>회원 정보 수정</p>
            </div>
            <div class="box">
                <div class="title"><p>아이디</p></div>
                <input type="email" name="memberId" id="memberId" placeholder="user@email.com" value="<%= member.getMemberId() %>" readonly>
                <iframe src="" id="checkId"></iframe>
            </div>
            
            <div class="box">
                <div class="title"><p>이름</p></div>
                <input type="text" name="memberName" id="memberName" value="<%= member.getMemberName() %>" required>
            </div>
            
            <div class="box">
                <div class="title"><p>별명</p></div>
                <input type="text" name="nickname" id="nickname" value="<%= member.getNickname() %>" required>
                <iframe src="" id="checkNickname"></iframe>
            </div>
            
            <div class="box">
                <div class="title"><p>생일</p></div>
                <input type="date" name="birth" id="birth" value="<%= member.getBirthDate() %>" required>
            </div>
            
            <div class="box">
                <div class="title"><p>성별</p></div>
                <input type="radio" name="gender" id="genderM" value="M" <%= member.getGender().equals("M")?"checked":"" %>>
                <label for="genderM">남</label>
                <input type="radio" name="gender" id="genderF" value="F" <%= member.getGender().equals("F")?"checked":"" %>>
                <label for="genderF">여</label>
            </div>
            
            <div class="box">
                <div class="title"><p>전화번호</p></div>
                <input type="number" name="phone" id="phone" value="<%= member.getPhone() %>" required>
            </div>

            <div class="box">
                <div class="title"><p>주소</p></div>
                <input type="text" name="address" id="address" value="<%= member.getAddress() %>" required>
            </div>
            
			<div id="buttons">
	            <input type="button" value="수정" id='editProfile'>
	            <input type="button" value="비밀번호 변경">
	            <input type="button" value="회원 탈퇴" onclick="fn_deleteProfile();" >
			</div>
        </form>
    </div>
    
    
    <style>
		.editContainer{
		   width: 100%;
		   display: flex;
		   flex-direction: column;
		   justify-content: center;
		   align-items: center;
		}
		
		.editContainer .boxTitle{
			width: 100%;
			margin-top: 30px;
			margin-bottom: 30px;
			padding-bottom: 5px;
			font-weight: bold;
			border-bottom: 1px solid #eee;
			text-align: center;
		}
		
		.editContainer .box>.title{
		    width: 150px;
		    font-size: 13px;
		    font-weight: bold;
		}
		
		.editContainer .box{
			 position: relative;
		    display: flex;
		    margin: 25px 0;
		    align-items: center;
		}
		
		.editContainer .box>#memberId{
		    margin-right: 10px;
		}
		
		.editContainer .box>#checkResultTrue{
			position: absolute;
			left: 140px;
			top: 23px;
			margin-left: 10px;
			font-size: 11px;
			font-weight: bold;
			color: teal;
		}
		
		.editContainer .box>#checkResultFalse{
		 	position: absolute;
			left: 141px;
			top: 23px;
			margin-left: 10px;
			font-size: 11px;
			font-weight: bold;
			color: tomato;
		}
		
		.editContainer .box>[type=email],
		.editContainer .box>[type=text],
		.editContainer .box>[type=password],
		.editContainer .box>[type=date],
		.editContainer .box>[type=number]{
		    width: 300px;
		}
		
		.editContainer>input{
		    margin: 20px 0;
		}
		
		iframe{
		  	position: absolute;
			left: 142px;
			top: 19px;
			margin-left: 10px;
			width: 300px;
			height: 20px;
		}
		
		.editContainer>form>#buttons{
			display: flex;
			justify-content: center;
		}
		
		.editContainer>form>#buttons>input{
			margin: 0 10px;
			width: 100px;
			height: 30px;
			font-size: 12px;
			font-weight: bold;
			border: 1px solid rgb(238, 238, 238, .3);;
		   backdrop-filter: saturate(80%) blur(10px);
		}
		
		.editContainer>form>#buttons>input:hover{
			opacity: 0.6;
		}
		
		.editContainer>form>#buttons>input:active{
			opacity: 1;
		}
    </style>
    
    <script>
    
    	$('#editProfile').on('click', ()=>{
    		
    		$.ajax({
    			url: '<%= request.getContextPath() %>/editProfile',
     			data: {
    				'memberId': $('#memberId').val(),
    				'memberName': $('#memberName').val(),
    				'nickname': $('#nickname').val(),
    				'birth': $('#birth').val(),
    				'gender': $('input[name=gender]:checked').val(),
    				'phone': $('#phone').val(),
    				'address': $('#address').val()
    			},
   				success: data=>{
    				const result = data['result'];
    				
    				if(result > 0){
    					$('#memberId').val(data['memberId']);
    					$('#memberName').val(data['memberName']);
    					$('#nickname').val(data['nickname']);
    					$('#birth').val(data['birth']);
    					if(data['gender']=='M'){
    						$('#genderM').attr('checked',true);
    					} else{
    						$('#genderF').attr('checked',true);
    					}
    					$('#phone').val(data['phone']);
    					$('#address').val(data['address']);
	    				alert("회원정보 수정 완료");
	    			} else{
	    				alert("회원정보 수정 실패");
	    			}
    			},
				error: (r,s,m)=>{
					console.log(r);
					console.log(s);
				}
    		});
    	});
    	
    	fn_deleteProfile = ()=>{
    		if(confirm("탈퇴하시겠습니까?")){
    			$('#profileForm').attr('action', '<%= request.getContextPath() %>/deleteProfile');
    			$('#profileForm').submit();
    		}
    	}
    </script>