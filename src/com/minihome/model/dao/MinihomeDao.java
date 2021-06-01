package com.minihome.model.dao;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.minihome.model.vo.Minihome;
import static com.common.JDBCTemplate.close;

public class MinihomeDao {

	private Properties prop=new Properties();
	
	public MinihomeDao() {
		String path=MinihomeDao.class.getResource("/sql/minihome_sql.properties").getPath();
		File f=new File(path);
		try{
			prop.load(new FileReader(f));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public Minihome getMinihome(Connection conn,String hostMemberId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Minihome minihome=null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("getMinihome"));
			pstmt.setString(1,hostMemberId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				minihome=new Minihome();
				minihome.setMemberId(rs.getString("member_id"));
				minihome.setToday(rs.getInt("today"));
				minihome.setTotal(rs.getInt("total"));
				minihome.setSkinItemNo(rs.getInt("skin_item_no"));
				minihome.setTodayDate(rs.getDate("today_date"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);close(pstmt);
		}
		return minihome;
	}
	
	public int addToday(Connection conn,String hostMemberId) {
		PreparedStatement pstmt=null;
		int todayResult=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("addToday"));
			pstmt.setString(1,hostMemberId);
			todayResult=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return todayResult;
	}
	
	public int todayToTotal(Connection conn,String hostMemberId) {
		PreparedStatement pstmt=null;
		int todayToTotalResult=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("todayToTotal"));
			pstmt.setString(1,hostMemberId);
			todayToTotalResult=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return todayToTotalResult;
	}
	
}
