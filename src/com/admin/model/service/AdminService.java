package com.admin.model.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.admin.model.dao.AdminDao;
import com.member.model.vo.Member;

public class AdminService {
	
	private AdminDao dao = new AdminDao();
	
	public int memberCount() {
		
		Connection conn = getConnection();
		
		int result = dao.memberCount(conn);
		
		close(conn);
		return result;
	}
	
	public ArrayList<Member> membersList(int currentPage, int linePerPage){
		
		Connection conn = getConnection();
		
		ArrayList<Member> membersList = dao.membersList(conn, currentPage, linePerPage);
		
		close(conn);
		
		return membersList;
	}
	
	public int searchMemberCount(String searchType, String searchKeyword) {
		
		Connection conn = getConnection();
		
		int result = dao.searchMemberCount(conn, searchType, searchKeyword);
		
		close(conn);
		return result;
	}
	
	public ArrayList<Member> searchMembersList(String searchType, String searchKeyword, int currentPage, int linePerPage){
		
		Connection conn = getConnection();
		
		ArrayList<Member> membersList = dao.searchMembersList(conn, searchType, searchKeyword, currentPage, linePerPage);
		
		close(conn);
		return membersList;
	}

}
