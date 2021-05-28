package com.diary.model.service;

import java.sql.Connection;
import java.util.List;

import static com.common.JDBCTemplate.getConnection;
import static com.common.JDBCTemplate.close;

import com.diary.model.dao.DiaryDao;
import com.diary.model.vo.Diary;

public class DiaryService {

	private DiaryDao dao=new DiaryDao();
	
	public List<Diary> selectDiaryList(){
		Connection conn=getConnection();
		List<Diary> list=dao.selectDiaryList(conn);
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
