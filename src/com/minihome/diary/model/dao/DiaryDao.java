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
import com.minihome.diary.model.vo.DiaryComment;
import com.minihome.diary.model.vo.DiaryFolder;
import com.minihome.diary.model.vo.DiaryFolderShare;

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
	
	public List<Diary> selectDiaryList(Connection conn, int cPage, int numPerpage, int diaryFolderLevel, String hostMemberId){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Diary> list=new ArrayList();
		Diary d=null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectDiaryList"));
			pstmt.setString(1, hostMemberId);
			pstmt.setInt(2,  diaryFolderLevel);
			pstmt.setInt(3,  (cPage-1)*numPerpage+1);
			pstmt.setInt(4,  cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				d=new Diary();
				d.setDiaryNo(rs.getInt("diary_no"));
				d.setMemberId(rs.getString("member_id"));
				d.setWriter(rs.getString("writer"));
				d.setContent(rs.getString("content"));
				d.setFolderNo(rs.getInt("folder_no"));
				d.setPostDate(rs.getDate("post_date"));
				d.setMemberName(rs.getString("member_name"));
				d.setProfilePath(rs.getString("profile_path"));
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
	
	public int selectDiaryCount(Connection conn, int diaryFolderLevel) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectDiaryCount"));
			pstmt.setInt(1,  diaryFolderLevel);
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
			pstmt.setInt(3,  d.getFolderNo());
			pstmt.setString(4, d.getContent());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);			
		}
		return result;	
	}
	
	public int deleteDiary(Connection conn, Diary d) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("deleteDiary"));	
			pstmt.setInt(1,  d.getDiaryNo());
			pstmt.setString(2, d.getWriter());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);			
		}
		return result;	
	}
	
	public int updateDiary(Connection conn, Diary d) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("updateDiary"));
			pstmt.setInt(1,  d.getFolderNo());
			pstmt.setString(2, d.getContent());
			pstmt.setInt(3, d.getDiaryNo());
			
			System.out.println("디에이오 테스트 : "+d.getFolderNo()+" "+d.getDiaryNo());
			
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);			
		}
		return result;
	}
	
	public List<DiaryFolder> selectShareFolder(Connection conn, String hostMemberId){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<DiaryFolder> fList=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectShareFolder"));
			pstmt.setString(1, hostMemberId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				DiaryFolder dfs=new DiaryFolder();
				dfs.setFolderNo(rs.getInt("folder_no"));
				dfs.setMemberId(rs.getString("member_id"));
				dfs.setFolderName(rs.getString("folder_name"));
				dfs.setShareLevel(rs.getString("share_level"));				
				fList.add(dfs);
			}			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);			
		}
		return fList;
	}
	
	/////////////////////left_page_folder///////////////////////////
	
	public List<DiaryFolder> selectFolderList(Connection conn, String hostMemberId){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<DiaryFolder> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectFolderList"));
			pstmt.setString(1, hostMemberId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				DiaryFolder df=new DiaryFolder();
				df.setFolderNo(rs.getInt("folder_no"));
				df.setMemberId(rs.getString("member_id"));
				df.setFolderName(rs.getString("folder_name"));
				df.setShareLevel(rs.getString("share_level"));
				df.setDiaryCount(rs.getInt("diarycount"));
				list.add(df);
			}			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);			
		}
		return list;
	}
	
	public int selectDiaryFolderCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectDiaryFolderCount"));
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
	
	public List<DiaryFolderShare> folderShare(Connection conn, int no){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<DiaryFolderShare> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("folderShare"));
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				DiaryFolderShare dfs=new DiaryFolderShare();
				dfs.setDiaryNo(rs.getInt("folder_no"));
				dfs.setAllowedMember(rs.getString("ALLOWED_MEMBER"));				
				list.add(dfs);
			}			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);			
		}
		return list;
	}
	
	public int insertDiaryFolder(Connection conn, String MemberId, String addFolderName, String folderShareLevel) {
		PreparedStatement pstmt=null;
		int result=0;		
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertDiaryFolder"));
			pstmt.setString(1, MemberId);			
			pstmt.setString(2, addFolderName);
			pstmt.setString(3, folderShareLevel);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);			
		}
		return result;
	}
	
	public int insertShareDiaryFolder(Connection conn, int folderNo, String shareMember) {
		PreparedStatement pstmt=null;
		int result=0;		
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertShareDiaryFolder"));
			pstmt.setInt(1, folderNo);
			pstmt.setString(2, shareMember);			
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);			
		}
		return result;
	}
	
	public int insertShareFolder(Connection conn, int folderNo, String memberName, String folderName) {
		PreparedStatement pstmt=null;
		int result=0;		
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertShareFolder"));
			pstmt.setInt(1, folderNo);			
			pstmt.setString(2, memberName);
			pstmt.setString(3, folderName);
			pstmt.setString(4, "FRIENDS");
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);			
		}
		return result;
	}
	
	public int selectDiaryShareFolder(Connection conn, String addFolderName) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int folderNo=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectDiaryShareFolder"));
			pstmt.setString(1, addFolderName);
			rs=pstmt.executeQuery();
			if(rs.next()) folderNo=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);			
		}
		return folderNo;
	}
	
	public int folderDelete(Connection conn, int folderNo) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("folderDelete"));	
			pstmt.setInt(1,  folderNo);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);			
		}
		return result;	
	}
	
	
	////////////////////////////comment////////////////////
	public int insertComment(Connection conn, DiaryComment dc) {
		PreparedStatement pstmt=null;
		int result=0;
		String ref=Integer.toString(dc.getDiaryCommentRef());
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertComment"));
			pstmt.setInt(1, dc.getCommentLevel());
			pstmt.setString(2, dc.getCommentWriter());
			pstmt.setString(3,  dc.getCommentContent());
			pstmt.setInt(4, dc.getDiaryRef());
			pstmt.setString(5, ref.equals("0")?null:ref);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);			
		}
		return result;	
	}
	
	public List<DiaryComment> selectDiaryCommentList(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<DiaryComment> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectDiaryCommentList"));			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				DiaryComment dc=new DiaryComment();
				dc.setCommentNo(rs.getInt("comment_no"));
				dc.setCommentLevel(rs.getInt("comment_level"));
				dc.setCommentWriter(rs.getString("comment_writer"));
				dc.setCommentContent(rs.getString("comment_content"));
				dc.setDiaryRef(rs.getInt("diary_ref"));
				dc.setDiaryCommentRef(rs.getInt("diary_comment_ref"));
				dc.setCommentDate(rs.getDate("comment_date"));
				dc.setWriterName(rs.getString("member_name"));
				list.add(dc);
			}			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);			
		}
		return list;
	}
	
	//public int commentDelete(Connection conn, int commentNo, String commentWriter) {
	public int commentDelete(Connection conn, int commentNo) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("commentDelete"));	
			pstmt.setInt(1,  commentNo);
			//pstmt.setString(2, commentWriter);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);			
		}
		return result;	
	}
	
}
