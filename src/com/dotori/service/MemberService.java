package com.dotori.service;

import java.sql.Connection;

import com.dotori.model.dao.MemberDao;
import com.dotori.model.vo.Member;
import static com.dotori.common.JDBCTemplate.getConnection;
import static com.dotori.common.JDBCTemplate.commit;
import static com.dotori.common.JDBCTemplate.rollback;
import static com.dotori.common.JDBCTemplate.close;

public class MemberService {

	private MemberDao dao=new MemberDao();
	
	public Member login(String userId,String password) {
		Connection conn=getConnection();
		Member m=dao.login(conn,userId,password);
		close(conn);
		return m;
	}
	
	public Member selectMemberId(String userId) {
		Connection conn=getConnection();
		Member m=dao.selectMemberId(conn,userId);
		close(conn);
		return m;
	}
	
	public int insertMember(Member m) {
		Connection conn=getConnection();
		int result=dao.insertMember(conn,m);
		if(result>0) 
			commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	
}
