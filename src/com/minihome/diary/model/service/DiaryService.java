package com.minihome.diary.model.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.commit;
import static com.common.JDBCTemplate.getConnection;
import static com.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.minihome.diary.model.dao.DiaryDao;
import com.minihome.diary.model.vo.Diary;
import com.minihome.diary.model.vo.DiaryComment;
import com.minihome.diary.model.vo.DiaryFolder;
import com.minihome.diary.model.vo.DiaryFolderShare;

public class DiaryService {

	private DiaryDao dao=new DiaryDao();
	
	///////////////////right_diary_page/////////////////////
	public List<Diary> getMyDiaries(String hostMemberId) {
		Connection conn=getConnection();
		List<Diary> diaryList=dao.getMyDiaries(conn,hostMemberId);
		close(conn);
		return diaryList;
	}
	
	public List<Diary> selectDiaryList(int cPage, int numPerpage, int diaryFolderLevel, String hostMemberId){
		Connection conn=getConnection();
		List<Diary> list=dao.selectDiaryList(conn, cPage, numPerpage, diaryFolderLevel, hostMemberId);
		close(conn);
		return list;
	}
	
	public int selectDiaryCount(int diaryFolderLevel) {
		Connection conn=getConnection();
		int result=dao.selectDiaryCount(conn, diaryFolderLevel);
		close(conn);
		return result;
	}
	
	public int insertDiary(Diary d) {
		Connection conn=getConnection();
		int result=dao.insertDiary(conn, d);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int deleteDiary(Diary d) {
		Connection conn=getConnection();
		int result=dao.deleteDiary(conn, d);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int updateDiary(Diary d) {
		Connection conn=getConnection();
		int result=dao.updateDiary(conn, d);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public List<DiaryFolder> selectShareFolder(String hostMemberId){
		Connection conn=getConnection();
		List<DiaryFolder> list=dao.selectShareFolder(conn, hostMemberId);
		close(conn);
		return list;
	}
	
	public int insertShareFolder(int folderNo, String memberName, String folderName) {
		Connection conn=getConnection();
		int result=dao.insertShareFolder(conn, folderNo, memberName, folderName);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	///////////////////////left_folder///////////////////
	
	public List<DiaryFolder> selectFolderList(String hostMemberId){
		Connection conn=getConnection();
		List<DiaryFolder> list=dao.selectFolderList(conn, hostMemberId);
		close(conn);
		return list;
	}
	
	public int selectDiaryFolderCount() {
		Connection conn=getConnection();
		int result=dao.selectDiaryFolderCount(conn);
		close(conn);
		return result;
	}
	
	public List<DiaryFolderShare> folderShare(int no){
		Connection conn=getConnection();
		List<DiaryFolderShare> list=dao.folderShare(conn, no);
		close(conn);
		return list;
	}
	
	public int insertDiaryFolder(String MemberId, String addFolderName, String folderShareLevel) {
		Connection conn=getConnection();
		int result=dao.insertDiaryFolder(conn, MemberId, addFolderName, folderShareLevel);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int insertShareDiaryFolder(int folderNo, String shareMember) {
		Connection conn=getConnection();
		int result=dao.insertShareDiaryFolder(conn, folderNo, shareMember);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int selectDiaryShareFolder(String addFolderName) {
		Connection conn=getConnection();
		int folderNo=dao.selectDiaryShareFolder(conn, addFolderName);
		close(conn);
		return folderNo;
	}
	
	public int folderDelete(int folderNo) {
		Connection conn=getConnection();
		int result=dao.folderDelete(conn, folderNo);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	////////////////////comment////////////////////////
	public int insertComment(DiaryComment dc) {
		Connection conn=getConnection();
		int result=dao.insertComment(conn, dc);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
		
	public List<DiaryComment> selectDiaryCommentList(String hostMemberId){
		Connection conn=getConnection();	
		List<DiaryComment> list=dao.selectDiaryCommentList(conn, hostMemberId);
		close(conn);
		return list;
	}
		
	public int commentDelete(int commentNo) {
		Connection conn=getConnection();
		//int result=dao.commentDelete(conn, commentNo, commentWriter);
		int result=dao.commentDelete(conn, commentNo);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
}
