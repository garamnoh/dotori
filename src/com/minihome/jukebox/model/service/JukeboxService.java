package com.minihome.jukebox.model.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.getConnection;

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
	
}
