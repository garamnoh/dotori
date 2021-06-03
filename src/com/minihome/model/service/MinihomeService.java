package com.minihome.model.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.commit;
import static com.common.JDBCTemplate.getConnection;
import static com.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.minihome.model.dao.MinihomeDao;
import com.minihome.model.vo.Minihome;
import com.minihome.model.vo.ProfileImg;

public class MinihomeService {
	
	private MinihomeDao minihomeDao=new MinihomeDao();

	public Minihome getMinihome(String hostMemberId) {
		Connection conn=getConnection();
		Minihome minihome=minihomeDao.getMinihome(conn,hostMemberId);
		close(conn);
		return minihome;
	}
	
	public int addToday(String hostMemberId) {
		Connection conn=getConnection();
		int todayResult=minihomeDao.addToday(conn,hostMemberId);
		if(todayResult>0) commit(conn);
		else rollback(conn);
		return todayResult;
	}
	
	public int todayToTotal(String hostMemberId) {
		Connection conn=getConnection();
		int todayToTotalResult=minihomeDao.todayToTotal(conn,hostMemberId);
		if(todayToTotalResult>0) commit(conn);
		else rollback(conn);
		return todayToTotalResult;
	}
	
	public ProfileImg getMyProfileImg(String hostMemberId) {
		Connection conn=getConnection();
		ProfileImg profileImg=minihomeDao.getMyProfileImg(conn,hostMemberId);
		close(conn);
		return profileImg;
	}
	
	public int updateProfileContent(String hostMemberId,String profileContent) {
		Connection conn=getConnection();
		int updateProfileContentResult=minihomeDao.updateProfileContent(conn,hostMemberId,profileContent);
		if(updateProfileContentResult>0) commit(conn);
		else rollback(conn);
		close(conn);
		return updateProfileContentResult;
	}
	
	public int changeFeeling(String hostMemberId,String changeFeeling) {
		Connection conn=getConnection();
		int changeFeelingResult=minihomeDao.changeFeeling(conn,hostMemberId,changeFeeling);
		if(changeFeelingResult>0) commit(conn);
		else rollback(conn);
		close(conn);
		return changeFeelingResult;
	}
	
}
