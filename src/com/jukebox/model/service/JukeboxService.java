package com.jukebox.model.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.jukebox.model.dao.JukeboxDao;
import com.shop.model.vo.Music;

public class JukeboxService {
	
	private JukeboxDao jukeboxDao=new JukeboxDao();

	public List<Music> getMyMusicOnJukebox(String hostMemberId) {
		Connection conn=getConnection();
		List<Music> musicList=jukeboxDao.getMyMusicOnJukebox(conn,hostMemberId);
		close(conn);
		return musicList;
	}
	
}
