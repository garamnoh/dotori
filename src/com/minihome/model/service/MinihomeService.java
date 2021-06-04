package com.minihome.model.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.commit;
import static com.common.JDBCTemplate.getConnection;
import static com.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.minihome.album.model.vo.Album;
import com.minihome.diary.model.vo.Diary;
import com.minihome.model.dao.MinihomeDao;
import com.minihome.model.vo.Minihome;
import com.minihome.model.vo.ProfileImg;
import com.shop.model.vo.Skin;

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
	
	public List<Album> getLatestAlbum(String hostMemberId) {
		Connection conn=getConnection();
		List<Album> latestAlbumList=minihomeDao.getLatestAlbum(conn,hostMemberId);
		close(conn);
		return latestAlbumList;
	}
	
	public List<Diary> getLatestDiary(String hostMemberId) {
		Connection conn=getConnection();
		List<Diary> latestDiaryList=minihomeDao.getLatestDiary(conn,hostMemberId);
		close(conn);
		return latestDiaryList;
	}
	
	public Skin getMySkin(int itemNo) {
		Connection conn=getConnection();
		Skin mySkin=minihomeDao.getMySkin(conn,itemNo);
		close(conn);
		return mySkin;
	}
	
	public List<Skin> getMySkins(String hostMemberId) {
		Connection conn=getConnection();
		List<Skin> skinList=minihomeDao.getMySkins(conn,hostMemberId);
		close(conn);
		return skinList;
	}
	
	public int changeSkin(String hostMemberId,int changeSkinItemNo) {
		Connection conn=getConnection();
		int changeSkinResult=minihomeDao.changeSkin(conn,hostMemberId,changeSkinItemNo);
		if(changeSkinResult>0) commit(conn);
		else rollback(conn);
		return changeSkinResult;
	}
	
}
