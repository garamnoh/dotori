package com.minihome.diary.model.service;

import java.sql.Connection;
import java.util.List;

import static com.common.JDBCTemplate.getConnection;
import static com.common.JDBCTemplate.close;

import com.minihome.diary.model.dao.DiaryDao;
import com.minihome.diary.model.vo.Diary;

public class DiaryService {

	private DiaryDao dao=new DiaryDao();
	
	public List<Diary> getMyDiaries(String hostMemberId) {
		Connection conn=getConnection();
		List<Diary> diaryList=dao.getMyDiaries(conn,hostMemberId);
		close(conn);
		return diaryList;
	}
	
	public List<Diary> selectDiaryList(int cPage, int numPerpage){
		Connection conn=getConnection();
		List<Diary> list=dao.selectDiaryList(conn, cPage, numPerpage);
		close(conn);
		return list;
	}
	
	public int selectDiaryCount() {
		Connection conn=getConnection();
		int result=dao.selectDiaryCount(conn);
		close(conn);
		return result;
	}
	
}
