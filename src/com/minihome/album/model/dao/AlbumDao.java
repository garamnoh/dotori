package com.minihome.album.model.dao;

import static com.common.JDBCTemplate.close;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.minihome.album.model.vo.Album;

public class AlbumDao {

	private Properties prop=new Properties();
	
	public AlbumDao() {
		String path=AlbumDao.class.getResource("/sql/album_sql.properties").getPath();
		File f=new File(path);
		try{
			prop.load(new FileReader(f));
		}catch(FileNotFoundException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Album> getMyPhotos(Connection conn,String hostMemberId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Album> albumList=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("getMyPhotos"));
			pstmt.setString(1,hostMemberId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Album l=new Album();
				l.setImgNo(rs.getInt("img_no"));
				l.setMemberId(rs.getString("member_id"));
				l.setTitle(rs.getString("title"));
				l.setFilepath(rs.getString("filepath"));
				l.setFolder(rs.getString("folder"));
				l.setPostDate(rs.getDate("post_date"));
				l.setHashTag(rs.getString("hash_tag"));
				l.setContent(rs.getString("content"));
				albumList.add(l);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);close(pstmt);
		}
		return albumList;
	}
	
	public List<String> getMyFolders(Connection conn,String hostMemberId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<String> folderList=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("getMyFolders"));
			pstmt.setString(1,hostMemberId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				folderList.add(rs.getString("folder"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);close(pstmt);
		}
		return folderList;
	}
	
	public List<Album> getMyPhotosOnFolder(Connection conn,String hostMemberId,String folder) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Album> albumList=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("getMyPhotosOnFolder"));
			pstmt.setString(1,hostMemberId);
			pstmt.setString(2,folder);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Album l=new Album();
				l.setImgNo(rs.getInt("img_no"));
				l.setMemberId(rs.getString("member_id"));
				l.setTitle(rs.getString("title"));
				l.setFilepath(rs.getString("filepath"));
				l.setFolder(rs.getString("folder"));
				l.setPostDate(rs.getDate("post_date"));
				l.setHashTag(rs.getString("hash_tag"));
				l.setContent(rs.getString("content"));
				albumList.add(l);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);close(pstmt);
		}
		return albumList;
	}
	
	public int changeFolder(Connection conn,String hostMemberId,String changeFolderTarget,String targetPhotoStr) {
		PreparedStatement pstmt=null;
		int changeFolderResult=0;
		String sql=prop.getProperty("changeFolder").replace("#","("+targetPhotoStr+")");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,changeFolderTarget);
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
