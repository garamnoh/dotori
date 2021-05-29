<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="container_membersList">
    <div id="title"><p>회원정보 조회</p></div>
    <div id="searchContainer">
        <span>Type</span>
        <select id="searchType">
            <option value="MEMBER_ID" id="typeId">ID</option>
            <option value="MEMBER_NAME" id="typeName">NAME</option>
        </select>
        <div id="searchTypeId">
            <form action="" method="post">
                <input type="text" name="searchKeyword" id='typeIdKeyword' placeholder="아이디 검색">
                <input type="hidden" name="searchType" id='typeId' value="MEMBER_ID">
                <button type="submit" id='submit_typeId'>search</button>
            </form>
        </div>
        <div id="searchTypeName" class="hide">
            <form action="" method="post">
                <input type="text" name="searchKeyword" id='typeNameKeyword' placeholder="이름 검색">
                <input type="hidden" name="searchType" id='typeName' value="MEMBER_NAME">
                <button type="submit" id='submit_typeName'>search</button>
            </form>
        </div>
    </div>
	<%@ include file="/views/admin/submitContainer/section_admin_searchList.jsp" %>
</div>


<style>
	#container_membersList input{
	    border: none;
	    background-color: #eee;
	    height: 22px;
	    border-radius: 2px;
	    text-align: center;
	    flex-grow: 1;
	    margin-right: 10px;
	    outline: none;
	}
	
	#container_membersList button{
	    border: none;
	    background-color: #eee;
	    height: 24px;
	    font-weight: bold;
	    border-radius: 2px;
	}
	
	#container_membersList{
	    width: 100%;
	    height: 100%;
	    text-align: center;
	    font-size: 15px;
	    font-weight: bold;
   	    margin-top: 20px;
	}
	
	#container_membersList>#title{
	    font-size: 20px;
	    margin-bottom: 30px;
	}
	
	#container_membersList>#searchContainer{
	    width: 100%;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    margin-bottom: 20px;
	}
	
	#container_membersList>#searchContainer>span{
	    width: 50px;
	    margin-right: 10px;
	}
	
	#container_membersList>#searchContainer>#searchTypeId,
	body>#container_membersList>#searchContainer>#searchTypeName{
	    width: 100%;
	    flex-grow: 1;
	}
	
	#container_membersList>#searchContainer>#searchTypeId>form,
	#container_membersList>#searchContainer>#searchTypeName>form{
	    display: flex;
	    flex-grow: 1;
	}
	
	#container_membersList>#searchContainer>#searchType{
	    margin-right: 10px;
	    width: 100px;
	    height: 24px;
	    background-color: #eee;
	    border: none;
	    border-radius: 2px;
	}
	
	#container_membersList>#searchContainer>#searchType:focus{
		outline: none;
	}
	
	#container_membersList>#membersListContainer>table{
	    width: 100%;
	    border-top: 3px solid #eee;
	    border-bottom: 3px solid #eee;
	    border-collapse: collpase;
	    margin-bottom: 20px;
	}
	
	#container_membersList>#membersListContainer>table th{
	    height: 40px;
	    border-bottom: 1px solid #eee;
	    vertical-align: middle;
	}
	
	#container_membersList>#membersListContainer>table td{
	    height: 30px;
	    border-bottom: 1px solid #eee;
	    vertical-align: middle;
	}
	
	#container_membersList>#membersListContainer>#pageBar span{
	    margin: 0 10px;
	}
	
	.hide{
		display: none;
	}
</style>

<script src='<%=request.getContextPath() %>/js/jquery-3.6.0.min.js'></script>
<script>
	$('#searchType').change((e)=>{
		const type = $(e.target).val();
		
		console.log(type);
		
		$('#searchTypeId').addClass('hide');
		$('#searchTypeName').addClass('hide');
		
		switch(type){
			case 'MEMBER_ID' : $('#searchTypeId').removeClass('hide'); break;
    		case 'MEMBER_NAME' : $('#searchTypeName').removeClass('hide'); break;
		}
		
		$('[name=searchKeyword]').val('');
	});
	
	const searchType = '<%= searchType %>';
	const searchKeyword = '<%= searchKeyword %>';
 	
 	if(searchKeyword != 'null'){
 		
	$('#typeId').attr('selected', false);
	$('#typeName').attr('selected', false);
 		
 		switch(searchType){
 			case 'MEMBER_ID' : $('#typeId').attr('selected', true); break;
 			case 'MEMBER_NAME' : $('#typeName').attr('selected', true); break;
 		}
 		
 		$('[name=searchKeyword]').val(searchKeyword);
 		
 	} else {
 		
 		$('[name=searchKeyword]').val('');
 		
 	}
 	

  	$('#submit_typeId').click(()=>{
 		
  		console.log($('#searchContainer').next());
  		$('#searchContainer').next().html('');
 		
 		console.log($('#typeId').val());
 		console.log($('#typeIdKeyword').val());
 		
 		$.ajax({
 			url: '<%= request.getContextPath() %>/admin/searchMembersList',
 			data: {
 				'searchType': $('#typeId').val(),
 				'searchKeyword': $('#typeIdKeyword').val()
			},
 			dataType: 'html',
 			success: data=>{
 				$('#searchContainer').next().append(data);
 			}
 		});
 	});
 	
 	$('#submit_typeName').click(()=>{
 		
 		$('#searchContainer').next().html('');
 		
 		$.ajax({
 			url: '<%= request.getContextPath() %>/admin/searchMembersList',
 			data: {
 				searchType: $('#typeName').val(),
 				searchKeyword: $('#typeNameKeyword').val()
			},
 			dataType: 'html',
 			success: data=>{
 				$('#searchContainer').next().append(data);
 			}
 		});
 	});
 	
 	
 </script>