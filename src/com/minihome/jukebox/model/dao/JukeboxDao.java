package com.minihome.jukebox.model.dao;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.shop.model.vo.Music;
import static com.common.JDBCTemplate.close;

public class JukeboxDao {

	private Properties prop=new Properties();
	
	public JukeboxDao() {
		String path=JukeboxDao.class.getResource("/sql/jukebox_sql.properties").getPath();
		File f=new File(path);
		try{
			prop.load(new FileReader(f));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Music> getMyMusicOnJukebox(Connection conn,String hostMemberId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Music> musicList=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("getMyMusicOnJukebox"));
			pstmt.setString(1,hostMemberId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Music m=new Music();
				m.setMusicNo(rs.getInt("music_no"));
				m.setMusicTitle(rs.getString("music_title"));
				m.setSinger(rs.getString("singer"));
				m.setFilepath(rs.getString("filepath"));
				m.setPrice(rs.getInt("price"));
				m.setImgFilepath(rs.getString("img_filepath"));
				musicList.add(m);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);close(pstmt);
		}
		return musicList;
	}
	
	public List<Music> getMyMusicOnAlbum(Connection conn,String hostMemberId,String album) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Music> musicList=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("getMyMusicOnAlbum"));
			pstmt.setString(1,hostMemberId);
			pstmt.setString(2,album);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Music m=new Music();
				m.setMusicNo(rs.getInt("music_no"));
				m.setMusicTitle(rs.getString("music_title"));
				m.setSinger(rs.getString("singer"));
				m.setFilepath(rs.getString("filepath"));
				m.setPrice(rs.getInt("price"));
				m.setImgFilepath(rs.getString("img_filepath"));
				musicList.add(m);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);close(pstmt);
		}
		return musicList;
	}
	
	public List<String> getMyAlbums(Connection conn,String hostMemberId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<String> albumList=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("getMyAlbums"));
			pstmt.setString(1,hostMemberId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				albumList.add(rs.getString("album"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);close(pstmt);
		}
		return albumList;
	}
	
	public int changeFolder(Connection conn,String hostMemberId,String targetFolder,String musicNoArrayStr) {
		PreparedStatement pstmt=null;
		int changeFolderResult=0;
		String sql=prop.getProperty("changeFolder").replace("#","("+musicNoArrayStr+")");
		System.out.println("testtest "+sql);
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,targetFolder);
			pstmt.setString(2,hostMemberId);
			changeFolderResult=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return changeFolderResult;
	}
	
}
