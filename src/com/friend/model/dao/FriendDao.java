package com.friend.model.dao;

import static com.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.friend.model.vo.Friend;
import com.friend.model.vo.SearchF;
import com.member.model.vo.Member;

public class FriendDao {
	
	private Properties prop = new Properties();
	
	public FriendDao() {

		String path = FriendDao.class.getResource("/sql/friend_sql.properties").getPath();
		
		try{
			prop.load(new FileReader(path));
		} catch(IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Friend> requestedList(Connection conn, String memberList){
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<Friend> requestedList = new ArrayList<Friend>();
		
		try {
			ps = conn.prepareStatement(prop.getProperty("requestedList"));
			ps.setString(1, memberList);
			ps.setString(2, "신청");
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Friend f = new Friend();
				
				f.setFollowee(rs.getString("FOLLOWEE"));
				f.setFollower(rs.getString("FOLLOWER"));
				f.setFriendshipName(rs.getString("FRIENDSHIP_NAME"));
				f.setVisitCount(rs.getInt("VISIT_COUNT"));
				f.setFollowerProfileName(rs.getString("MEMBER_NAME"));
				f.setFollowerProfilePath(rs.getString("PROFILE_PATH"));
				f.setFollowerProfilePhone(rs.getString("PHONE"));
				
				requestedList.add(f);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(ps);
		} return requestedList;
	}
	
	public ArrayList<Friend> friendsList(Connection conn, String memberList){
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<Friend> friendsList = new ArrayList<Friend>();
		
		try {
			ps = conn.prepareStatement(prop.getProperty("requestedList"));
			ps.setString(1, memberList);
			ps.setString(2, "일촌");
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Friend f = new Friend();
				
				f.setFollowee(rs.getString("FOLLOWEE"));
				f.setFollower(rs.getString("FOLLOWER"));
				f.setFriendshipName(rs.getString("FRIENDSHIP_NAME"));
				f.setVisitCount(rs.getInt("VISIT_COUNT"));
				f.setFollowerProfileName(rs.getString("MEMBER_NAME"));
				f.setFollowerProfilePath(rs.getString("PROFILE_PATH"));
				f.setFollowerProfilePhone(rs.getString("PHONE"));
				
				friendsList.add(f);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(ps);
		} return friendsList;
	}
	
	public int deleteFriend(Connection conn, String followee, String follower) {
		
		PreparedStatement ps = null;
		int result = 0;
		
		try {
			ps = conn.prepareStatement(prop.getProperty("deleteFriend"));
			ps.setString(1, followee);
			ps.setString(2, follower);
			ps.setString(3, follower);
			ps.setString(4, followee);
			
			result = ps.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(ps);
		} return result;
	}
	
	public int acceptFriend(Connection conn, String followee, String follower) {
		
		PreparedStatement ps1 = null;
		PreparedStatement ps2 = null;
		int result = 0;
		
		try {
			ps1 = conn.prepareStatement(prop.getProperty("acceptFriend"));
			ps1.setString(1, "일촌");
			ps1.setString(2, followee);
			ps1.setString(3, follower);
			
			result = ps1.executeUpdate();
			
			if(result > 0) {
				
				ps2 = conn.prepareStatement(prop.getProperty("addFollowerRow"));
				ps2.setString(1, follower);
				ps2.setString(2, followee);
				ps2.setString(3, "일촌");
				
				result = ps2.executeUpdate();
			} else {
				result = 0;
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(ps1);
			close(ps2);
		} return result;
	}
	
	public ArrayList<SearchF> searchList(Connection conn, String myId, String searchKeyword){
		
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		PreparedStatement ps3 = null;
		ResultSet rs = null;
		ResultSet rs1 = null;
		ArrayList<SearchF> searchList = new ArrayList<SearchF>();
		ArrayList<SearchF> resultList = new ArrayList<SearchF>();
		
		try {
			
			ps = conn.prepareStatement(prop.getProperty("searchList"));
			ps.setString(1, "%"+searchKeyword+"%");
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				SearchF mId = new SearchF();
				
				mId.setMemberId(rs.getString("MEMBER_ID"));
				searchList.add(mId);
			}
			
			if(searchList != null) {
				
				ps2 = conn.prepareStatement(prop.getProperty("resultList1"));
				ps3 = conn.prepareStatement(prop.getProperty("resultList2"));
				for(SearchF list : searchList) {
					ps2.setString(1, myId);
					ps2.setString(2, list.getMemberId());
					rs = ps2.executeQuery();
					
					if(rs.next()) {
						SearchF m = new SearchF();
						
						m.setMemberId(rs.getString("MEMBER_ID"));
						m.setMemberName(rs.getString("MEMBER_NAME"));
						m.setNickname(rs.getString("NICKNAME"));
						m.setBirth(rs.getDate("BIRTH_DATE"));
						m.setGender(rs.getString("GENDER"));
						m.setAddress(rs.getString("ADDRESS"));
						m.setPhone(rs.getString("PHONE"));
						m.setProfilePath(rs.getString("PROFILE_PATH"));
						m.setFriendship(rs.getString("FRIENDSHIP_NAME"));
						
						resultList.add(m);
					} else {
						ps3.setString(1, list.getMemberId());
						rs1 = ps3.executeQuery();
						
						if(rs1.next()) {
							
							SearchF m = new SearchF();
							
							m.setMemberId(rs1.getString("MEMBER_ID"));
							m.setMemberName(rs1.getString("MEMBER_NAME"));
							m.setNickname(rs1.getString("NICKNAME"));
							m.setBirth(rs1.getDate("BIRTH_DATE"));
							m.setGender(rs1.getString("GENDER"));
							m.setAddress(rs1.getString("ADDRESS"));
							m.setPhone(rs1.getString("PHONE"));
							m.setProfilePath(rs1.getString("PROFILE_PATH"));
							m.setFriendship("");
							
							resultList.add(m);
						}
					}
				}
			}
			for(SearchF list : resultList) System.out.println("두번쨰 검색 : " + list);
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(rs1);
			close(ps);
			close(ps2);
			close(ps3);
		} return resultList;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
