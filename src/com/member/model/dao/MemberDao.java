package com.member.model.dao;

import static com.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.member.model.vo.Member;
import com.minihome.model.vo.Minihome;
import com.shop.model.vo.Minimi;


public class MemberDao {

	private Properties prop=new Properties();
	
	{
		String path=MemberDao.class.getResource("/sql/member_sql.properties").getPath();
		
		try{
			prop.load(new FileReader(path));
		}catch(FileNotFoundException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public Member login(Connection conn,String userId,String password) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("login"));
			pstmt.setString(1,userId);
			pstmt.setString(2,password);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=new Member();
				m.setMemberId(rs.getString("member_id"));
				m.setMemberPwd(rs.getString("member_pwd"));
				m.setMemberName(rs.getString("member_name"));
				m.setNickname(rs.getString("nickname"));
				m.setBirthDate(rs.getDate("birth_date"));
				m.setGender(rs.getString("gender"));
				m.setPhone(rs.getString("phone"));
				m.setAddress(rs.getString("address"));
				m.setDotori(rs.getInt("dotori"));
				m.setEnrollDate(rs.getDate("enroll_date"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);close(pstmt);
		}
		return m;
	}
	
	public String profilePath(Connection conn, String memberId) {
		PreparedStatement ps = null;
		ResultSet rs = null;
		String profilePath = null;
		
		try {
			ps = conn.prepareStatement(prop.getProperty("profilePath"));
			ps.setString(1, memberId);
			
			rs = ps.executeQuery();
			if(rs.next()) profilePath = rs.getString(2);
		
		} catch(SQLException e){
			e.printStackTrace();
		} finally {
			close(rs);
			close(ps);
		} return profilePath;
	}
	
	
	public Member selectMemberId(Connection conn, String userId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectMemberId"));
			pstmt.setString(1, userId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=new Member();
				m.setMemberId(rs.getString("member_id"));
				m.setMemberPwd(rs.getString("member_pwd"));
				m.setMemberName(rs.getString("member_name"));
				m.setNickname(rs.getString("nickname"));
				m.setBirthDate(rs.getDate("birth_date"));
				m.setGender(rs.getString("gender"));
				m.setPhone(rs.getString("phone"));
				m.setAddress(rs.getString("address"));
				m.setDotori(rs.getInt("dotori"));
				m.setEnrollDate(rs.getDate("enroll_date"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}
	
	
	public Member selectNickname(Connection conn, String nickname) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectNickname"));
			pstmt.setString(1, nickname);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=new Member();
				m.setNickname(rs.getString("nickname"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}
	
	
	public int insertMember(Connection conn, Member m) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertMember"));
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPwd());
			pstmt.setString(3, m.getMemberName());
			pstmt.setString(4, m.getNickname());
			pstmt.setDate(5, m.getBirthDate());
			pstmt.setString(6, m.getGender());
			pstmt.setString(7, m.getPhone());
			pstmt.setString(8, m.getAddress());
			//pstmt.setInt(9, m.getDotori());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public int enrollDefaultMinimi(Connection conn, String memberId) {
		
		PreparedStatement ps = null;
		int result = 0;
		
		try {
			ps = conn.prepareStatement(prop.getProperty("enrollDefaultMinimi"));
			ps.setString(1, memberId);
			
			result = ps.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(ps);
		} return result;
	}
	
	public int editProfile(Connection conn, Member member) {
		
		PreparedStatement ps = null;
		int result = 0;
		
		try {
			
			ps = conn.prepareStatement(prop.getProperty("editProfile"));
			
			ps.setString(1, member.getMemberName());
			ps.setString(2, member.getNickname());
			ps.setString(3, member.getGender());
			ps.setString(4, member.getPhone());
			ps.setDate(5, member.getBirthDate());
			ps.setString(6, member.getAddress());
			ps.setString(7, member.getMemberId());

			result = ps.executeUpdate();
			
		} catch(SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			
			close(ps);
			
		} return result;
	}
	
	public ArrayList<Minimi> minimiList(Connection conn, String memberId){
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<Minimi> minimiList = new ArrayList<Minimi>();
		
		try {
			
			ps = conn.prepareStatement(prop.getProperty("minimiList"));
			ps.setString(1, memberId);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				
				Minimi minimi = new Minimi();
				
				minimi.setItemNo(rs.getInt("ITEM_NO"));
				minimi.setFilepath(rs.getString("FILEPATH"));
				minimi.setPrice(rs.getInt("PRICE"));
				minimi.setTitle(rs.getString("TITLE"));
				
				minimiList.add(minimi);
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(ps);
		} return minimiList;
	}
	
	public int updateMinimi(Connection conn, String memberId, String updateMinimi) {
		
		PreparedStatement ps = null;
		int result = 0;
		
		try {
			
			ps = conn.prepareStatement(prop.getProperty("updateMinimi"));
			ps.setString(1, updateMinimi);
			ps.setString(2, memberId);
			
			result = ps.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(ps);
		} return result;
	}
	
	public Minihome refreshInfo(Connection conn, String memberId) {
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		Minihome info = null;
		
		try {
			
			ps = conn.prepareStatement(prop.getProperty("refreshInfo"));
			ps.setString(1, memberId);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				
				info = new Minihome();
				
				info.setToday(rs.getInt("TODAY"));
				info.setTotal(rs.getInt("TOTAL"));
				
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(ps);
		} return info;
	}
	
	
}
