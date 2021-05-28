package com.shop.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.shop.model.dao.ShopDao;
import com.shop.model.vo.MusicItem;


public class ShopService {
	
private ShopDao dao= new ShopDao();
	
	public List<MusicItem> musicList(){
		Connection conn=getConnection();
		List<MusicItem> list =dao.musicList(conn); 
		close(conn);
		return list;
	}

}
