package com.chat.model.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.commit;
import static com.common.JDBCTemplate.getConnection;
import static com.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.chat.model.dao.ChatDao;
import com.chat.model.vo.Loged;
import com.member.model.vo.Member;

public class ChatService {
	
	private ChatDao dao = new ChatDao();

	public void saveLogedInInfo(Member m, String profilePath) {
		Connection conn = getConnection();
		
		boolean isExist = dao.isExist(conn, m);
		
		if(isExist==false) {
			int result = dao.saveLogedInInfo(conn, m, profilePath);
			if(result > 0) commit(conn);
			else rollback(conn);
			close(conn);
		}
	}
	
	public void deleteLogedInInfo(Member m) {
		Connection conn = getConnection();
		
		boolean isExist = dao.isExist(conn, m);
		
		if(isExist==true) {
			int result = dao.deleteLogedInInfo(conn, m);
			if(result > 0) commit(conn);
			else rollback(conn);
			close(conn);
		}
	}
	
	public ArrayList<Loged> logedList(String memberId){
		Connection conn = getConnection();
		ArrayList<Loged> logedList = dao.logedList(conn, memberId);
		close(conn);
		return logedList;
	}
}
