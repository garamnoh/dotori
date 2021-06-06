package com.chat.model.dao;

import static com.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.chat.model.vo.Loged;
import com.member.model.vo.Member;

public class ChatDao {
	
	private Properties prop = new Properties();
	
	public ChatDao() {
		
		String path = ChatDao.class.getResource("/sql/chat_sql.properties").getPath();
		
		try {
			prop.load(new FileReader(path));
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public boolean isExist(Connection conn, Member m) {
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		boolean isExist = false;
		
		try {
			ps = conn.prepareStatement(prop.getProperty("isExist"));
			ps.setString(1, m.getMemberId());
			
			rs = ps.executeQuery();
			
			if(rs.next()) isExist = true;
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(ps);
		} return isExist;
	}

	public int saveLogedInInfo(Connection conn, Member m, String profilePath) {
		
		PreparedStatement ps = null;
		int result = 0;
		
		try {
			ps = conn.prepareStatement(prop.getProperty("saveLoginInfo"));
			ps.setString(1, m.getMemberId());
			ps.setString(2, m.getMemberName());
			ps.setString(3, m.getNickname());
			ps.setString(4, profilePath);
			
			result = ps.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(ps);
		} return result;
	}
	
	public int deleteLogedInInfo(Connection conn, Member m) {
		
		PreparedStatement ps = null;
		int result = 0;
		
		try {
			ps = conn.prepareStatement(prop.getProperty("deleteLogedInInfo"));
			ps.setString(1, m.getMemberId());
			
			result = ps.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(ps);
		} return result;
	}
	
	public ArrayList<Loged> logedList(Connection conn, String memberId){
		
		PreparedStatement ps = null;
		ArrayList<Loged> logedList = new ArrayList<Loged>();
		ResultSet rs = null;
		
		try {
			ps = conn.prepareStatement(prop.getProperty("logedList"));
			ps.setString(1, memberId);
			ps.setString(2, "일촌");
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Loged l = new Loged();
				
				l.setMemberId(rs.getString("FOLLOWER"));
				l.setMemberName(rs.getString("MEMBER_NAME"));
				l.setNinkname(rs.getString("NICKNAME"));
				l.setProfilePath(rs.getString("PROFILE_PATH"));
				
				logedList.add(l);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(ps);
		} return logedList;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
