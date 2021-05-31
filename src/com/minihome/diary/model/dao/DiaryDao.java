package com.minihome.diary.model.dao;

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

import com.minihome.diary.model.vo.Diary;

public class DiaryDao {

	private Properties prop=new Properties();
	
	public DiaryDao() {
		String path=DiaryDao.class.getResource("/sql/diary_sql.properties").getPath();
		try{
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Diary> getMyDiaries(Connection conn,String hostMemberId){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Diary> diaryList=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("getMyDiaries"));
			pstmt.setString(1,hostMemberId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Diary d=new Diary();
				d.setDiaryNo(rs.getInt("diary_no"));
				d.setMemberId(rs.getString("member_id"));
				d.setWriter(rs.getString("writer"));
				d.setTitle(rs.getString("title"));
				d.setContent(rs.getString("content"));
				d.setFolderNo(rs.getInt("folder_no"));
				d.setPostDate(rs.getDate("post_date"));
				diaryList.add(d);
			}			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);close(pstmt);			
		}
		return diaryList;	
	}
	
	public List<Diary> selectDiaryList(Connection conn, int cPage, int numPerpage, int folderLevel){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Diary> list=new ArrayList();
		Diary d=null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectDiaryList"));
			pstmt.setInt(1,  folderLevel);
			pstmt.setInt(2,  (cPage-1)*numPerpage+1);
			pstmt.setInt(3,  cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				d=new Diary();
				d.setDiaryNo(rs.getInt("diary_no"));
				d.setMemberId(rs.getString("member_id"));
				d.setWriter(rs.getString("writer"));
				d.setTitle(rs.getString("title"));
				d.setContent(rs.getString("content"));
				d.setFolderNo(rs.getInt("folder_no"));
				d.setPostDate(rs.getDate("post_date"));
				list.add(d);
			}			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);			
		}
		return list;	
	}
	
	public int selectDiaryCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectDiaryCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) result=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);			
		}
		return result;		
	}
	
	public int insertDiary(Connection conn, Diary d) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertDiary"));
			pstmt.setString(1, d.getMemberId());
			pstmt.setString(2, d.getWriter());
			pstmt.setString(3, d.getTitle());
			pstmt.setInt(4,  d.getFolderNo());
			pstmt.setString(5, d.getContent());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);			
		}
		return result;	
	}
}
