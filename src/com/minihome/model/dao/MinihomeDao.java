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
				minihome.setSkin_item_no(rs.getInt("skin_item_no"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);close(pstmt);
		}
		return minihome;
	}
	
}
