package com.admin.model.dao;

import static com.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.member.model.vo.Member;

public class AdminDao {
	
	private Properties prop = new Properties();
	
	public AdminDao() {
		
		String path = AdminDao.class.getResource("/sql/admin_sql.properties").getPath();
		
		try {
			
			prop.load(new FileReader(path));
			
		} catch(IOException e) {
			
			e.printStackTrace();
			
		}
	}
	
	public int memberCount(Connection conn) {
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			
			ps = conn.prepareStatement(prop.getProperty("memberCount"));
			
			rs = ps.executeQuery();
			
			if(rs.next()) result = rs.getInt(1);
			
		} catch(SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			
			close(rs);
			close(ps);
			
		} return result;
	}
	
	public ArrayList<Member> membersList(Connection conn, int currentPage, int linePerPage){
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<Member> membersList = new ArrayList<Member>();
		
		try {
			
			ps = conn.prepareStatement(prop.getProperty("membersList"));
			
			ps.setInt(1, (currentPage - 1) * linePerPage + 1);
			ps.setInt(2, currentPage * linePerPage);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				
				Member member = new Member();
				
				member.setMemberId(rs.getString("MEMBER_ID"));
				member.setMemberName(rs.getString("MEMBER_NAME"));
				member.setNickname(rs.getString("NICKNAME"));
				member.setBirthDate(rs.getDate("BIRTH_DATE"));
				member.setGender(rs.getString("GENDER"));
				member.setPhone(rs.getString("PHONE"));
				member.setAddress(rs.getString("ADDRESS"));
				member.setDotori(rs.getInt("DOTORI"));
				member.setEnrollDate(rs.getDate("ENROLL_DATE"));
				
				membersList.add(member);
				
			}
		} catch(SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			
			close(rs);
			close(ps);
			
		} return membersList;
	}

	public int searchMemberCount(Connection conn, String searchType, String searchKeyword) {
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		
		System.out.println("dao : " + searchType);
		
		try {
			
			ps = conn.prepareStatement(prop.getProperty("searchMembersCount").replace("val", searchType));
			
			ps.setString(1, "%" + searchKeyword + "%");
			
			rs = ps.executeQuery();
			
			if(rs.next()) result = rs.getInt(1);
			
		} catch(SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			
			close(rs);
			close(ps);
			
		} return result;
	}
	
	public ArrayList<Member> searchMembersList(Connection conn, String searchType, String searchKeyword, int currentPage, int linePerPage){
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<Member> membersList = new ArrayList<Member>();
		
		try {
			
			String a= prop.getProperty("searchMembersList").replace("val", searchType);
			
			System.out.println("2 : " + a);
			
			ps = conn.prepareStatement(prop.getProperty("searchMembersList").replace("val", searchType));
			
			ps.setString(1, "%" + searchKeyword + "%");
			ps.setInt(2, (currentPage - 1) * linePerPage + 1);
			ps.setInt(3, currentPage * linePerPage);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				
				Member member = new Member();
				
				member.setMemberId(rs.getString("MEMBER_ID"));
				member.setMemberName(rs.getString("MEMBER_NAME"));
				member.setNickname(rs.getString("NICKNAME"));
				member.setBirthDate(rs.getDate("BIRTH_DATE"));
				member.setGender(rs.getString("GENDER"));
				member.setPhone(rs.getString("PHONE"));
				member.setAddress(rs.getString("ADDRESS"));
				member.setDotori(rs.getInt("DOTORI"));
				member.setEnrollDate(rs.getDate("ENROLL_DATE"));
				
				membersList.add(member);
				
			}
		} catch(SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			
			close(rs);
			close(ps);
			
		} return membersList;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
