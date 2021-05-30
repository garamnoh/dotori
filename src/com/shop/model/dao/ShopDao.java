package com.shop.model.dao;

import static com.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.shop.model.vo.Minimi;
import com.shop.model.vo.Music;

public class ShopDao {
private Properties prop=new Properties();
	
	public ShopDao() {
		String path=ShopDao.class.getResource("/sql/shop_sql.properties").getPath();
		try {
			prop.load(new FileReader(path));
			
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	public List<Music> musicList(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Music> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("musicList"));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Music m=new Music();
				m.setMusicNo(rs.getInt("music_no"));
				m.setMusicTitle(rs.getString("music_title"));
				m.setSinger(rs.getString("singer"));
				m.setFilepath(rs.getString("filepath"));
				m.setPrice(rs.getInt("price"));
				m.setImgFilepath(rs.getString("img_filepath"));
				list.add(m);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	public List<Minimi> minimiList(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Minimi> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("minimiList"));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Minimi mini=new Minimi();
				mini.setItemNo(rs.getInt("item_no"));
				mini.setFilepath(rs.getString("filepath"));
				mini.setPrice(rs.getInt("price"));
				mini.setTitle(rs.getString("title"));
				list.add(mini);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}

}
