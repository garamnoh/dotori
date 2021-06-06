package com.minihome.jukebox.model.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.getConnection;
import static com.common.JDBCTemplate.commit;
import static com.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.minihome.jukebox.model.dao.JukeboxDao;
import com.shop.model.vo.Music;

public class JukeboxService {
	
	private JukeboxDao jukeboxDao=new JukeboxDao();

	public List<Music> getMyMusicOnJukebox(String hostMemberId) {
		Connection conn=getConnection();
		List<Music> musicList=jukeboxDao.getMyMusicOnJukebox(conn,hostMemberId);
		close(conn);
		return musicList;
	}
	
	public List<Music> getMyMusicOnAlbum(String hostMemberId,String album) {
		Connection conn=getConnection();
		List<Music> musicList=jukeboxDao.getMyMusicOnAlbum(conn,hostMemberId,album);
		close(conn);
		return musicList;
	}
	
	public List<String> getMyAlbums(String hostMemberId) {
		Connection conn=getConnection();
		List<String> albumList=jukeboxDao.getMyAlbums(conn,hostMemberId);
		close(conn);
		return albumList;
	}
	
	public int changeFolder(String hostMemberId,String targetFolder,String musicNoArrayStr) {
		Connection conn=getConnection();
		int changeFolderResult=jukeboxDao.changeFolder(conn,hostMemberId,targetFolder,musicNoArrayStr);
		if(changeFolderResult>0) commit(conn);
		else rollback(conn);
		close(conn);
		return changeFolderResult;
	}
	
	public int addAlbum(String hostMemberId,String newAlbumTitle) {
		Connection conn=getConnection();
		int addAlbumResult=jukeboxDao.addAlbum(conn,hostMemberId,newAlbumTitle);
		if(addAlbumResult>0) commit(conn);
		else rollback(conn);
		close(conn);
		return addAlbumResult;
	}
	
	public int deleteAlbum(String hostMemberId,String AlbumForDelete) {
		Connection conn=getConnection();
		int deleteAlbumResult=jukeboxDao.deleteAlbum(conn,hostMemberId,AlbumForDelete);
		if(deleteAlbumResult>0) commit(conn);
		else rollback(conn);
		close(conn);
		return deleteAlbumResult;
	}
	
	public int cleanJukeboxTable(String hostMemberId,String album) {
		Connection conn=getConnection();
		int cleanJukeboxTableResult=jukeboxDao.cleanJukeboxTable(conn,hostMemberId,album);
		if(cleanJukeboxTableResult>0) commit(conn);
		else rollback(conn);
		close(conn);
		return cleanJukeboxTableResult;
	}
	
	public int changePlaySeq(String hostMemberId,int musicNo,int playSeq) {
		Connection conn=getConnection();
		int changePlaySeqResult=jukeboxDao.changePlaySeq(conn,hostMemberId,musicNo,playSeq);
		if(changePlaySeqResult>0) commit(conn);
		else rollback(conn);
		close(conn);
		return changePlaySeqResult;
	}
	
	public int countMusicOnAlbum(String hostMemberId,String album) {
		Connection conn=getConnection();
		int countMusicOnAlbum=jukeboxDao.countMusicOnAlbum(conn,hostMemberId,album);
		close(conn);
		return countMusicOnAlbum;
	}
	
	public int countMusic(String hostMemberId) {
		Connection conn=getConnection();
		int countMusic=jukeboxDao.countMusic(conn,hostMemberId);
		close(conn);
		return countMusic;
	}
	
}
