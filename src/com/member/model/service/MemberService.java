package com.member.model.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.commit;
import static com.common.JDBCTemplate.getConnection;
import static com.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.member.model.dao.MemberDao;
import com.member.model.vo.Member;
import com.minihome.model.vo.Minihome;
import com.shop.model.vo.Minimi;


public class MemberService {

	private MemberDao dao=new MemberDao();
	
	public Member login(String userId,String password) {
		Connection conn=getConnection();
		Member m=dao.login(conn,userId,password);
		close(conn);
		return m;
	}
	
	public String profilePath(String memberId) {
		Connection conn = getConnection();
		String profilePath = dao.profilePath(conn, memberId);
		close(conn);
		return profilePath;
	}
	//id조회
	public Member selectMemberId(String userId) {
		Connection conn=getConnection();
		Member m=dao.selectMemberId(conn,userId);
		close(conn);
		return m;
	}
	
	
	public Member selectNickname(String nickname) {
		Connection conn=getConnection();
		Member m=dao.selectNickname(conn,nickname);
		close(conn);
		return m;
	}
	
	//아이디 찾기
	public Member idSearch(String memberName,String phone) {
		Connection conn=getConnection();
		Member m=dao.idSearch(conn,memberName,phone);
		close(conn);
		return m;
	}
	
	//비밀번호 찾기
	public Member pwSearch(String memberId,String memberName,String phone) {
		Connection conn=getConnection();
		Member m=dao.pwSearch(conn,memberId,memberName,phone);
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
	
	public int enrollDefaultMinimi(String memberId) {
		Connection conn=getConnection();
		int result = dao.enrollDefaultMinimi(conn, memberId);
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int editProfile(Member member) {
		Connection conn = getConnection();
		int result = dao.editProfile(conn, member);
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public ArrayList<Minimi> minimiList(String memberId){
		Connection conn = getConnection();
		ArrayList<Minimi> minimiList = dao.minimiList(conn, memberId);
		close(conn);
		return minimiList;
	}
	
	public int updateMinimi(String memberId, String updateMinimi) {
		Connection conn = getConnection();
		int result = dao.updateMinimi(conn, memberId, updateMinimi);
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public Minihome refreshInfo(String memberId) {
		Connection conn = getConnection();
		Minihome info = dao.refreshInfo(conn, memberId);
		close(conn);
		return info;
	}
	
	public String getProfilePath(String myId) {
		Connection conn = getConnection();
		String profilePath = dao.getProfilePath(conn, myId);
		close(conn);
		return profilePath;
	}
	
	public int updateDotori(String memberId, int dotori) {
		Connection conn = getConnection();
		int result = dao.updateDotori(conn, memberId, dotori);
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int deleteProfile(String memberId) {
		Connection conn = getConnection();
		int result = dao.deleteProfile(conn, memberId);
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

}
