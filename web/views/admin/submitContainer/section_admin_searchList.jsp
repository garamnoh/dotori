<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.member.model.vo.Member, java.util.ArrayList" %>
<%
	ArrayList<Member> membersList = (ArrayList<Member>)request.getAttribute("membersList");
	String pageBar = (String)request.getAttribute("pageBar");
	String searchType = (String)request.getAttribute("searchType");
	String searchKeyword = (String)request.getAttribute("searchKeyword");
%>
<div id="membersListContainer">
	<div id='table'>
	    <table>
	        <tr>
	            <th>Name</th>
	            <th>NickName</th>
	            <th>ID</th>
	            <th>Gender</th>
	            <th>Phone</th>
	            <th>Dotori</th>
	        </tr>
	        <% if(membersList != null) { %>
	        	<% for(Member member : membersList) { %>
			        <tr>
			            <td><%= member.getMemberName() %></td>
			            <td><%= member.getNickname() %></td>
			            <td><%= member.getMemberId() %></td>
			            <td><%= member.getGender() %></td>
			            <td><%= member.getPhone() %></td>
			            <td><%= member.getDotori() %></td>
			        </tr>
	        	<% } %>
	        <% } else { %>
	        	<tr>
	        		<td colspan='6'>조회된 데이터가 없습니다.</td>
	        	</tr>
	        <% } %>
	    </table>
	</div>
    <div id="pageBar">
        <%= pageBar %>
    </div>
</div>

<style>
	#membersListContainer>#table{
		height: 350px;
	    margin-bottom: 20px;
	    border: 2px solid #eee;
	    padding: 10px;
	}

	#membersListContainer>#table>table{
	    width: 100%;
	    border-top: 3px solid #eee;
	    border-bottom: 3px solid #eee;
	    border-collapse: collpase;
	}
	
	#membersListContainer>#table>table th{
	    height: 40px;
	    border-bottom: 1px solid #eee;
	    vertical-align: middle;
	}
	
	#membersListContainer>#table>table td{
	    height: 30px;
	    border-bottom: 1px solid #eee;
	    vertical-align: middle;
	}
	
	#membersListContainer>#pageBar span{
	    margin: 0 10px;
	}
	
	#membersListContainer>#pageBar a{
		margin: 0 10px;
		cursor: pointer;
	}
	
	.hide{
		display: none;
	}
</style>

<script>
	$('#pageBar a').on('click', (e)=>{
		
		const searchType = $('#typeId').val();
		const searchKeyword = $('#typeIdKeyword').val();
		
		if(searchKeyword == ''){
			
			$('#section #searchResult').html('');
			
			const currentPage = e.target.id;
			$.ajax({
				url: '<%=request.getContextPath()%>/admin/membersList',
				dataType: 'html',
				data:{
					'currentPage': currentPage,
					'linPerPage': '10'
				},
				success: (data)=>{
					$('#section #searchResult').append(data);
				}
			});
			
		} else{
			
			$('#section #searchResult').html('');
			
			const currentPage = e.target.id;
			$.ajax({
				url: '<%=request.getContextPath()%>/admin/searchMembersList',
				dataType: 'html',
				data:{
					'currentPage': currentPage,
					'linPerPage': '10',
					'searchType': searchType,
					'searchKeyword': searchKeyword
				},
				success: (data)=>{
					$('#section #searchResult').append(data);
				}
			});
		}
		
	});
</script>