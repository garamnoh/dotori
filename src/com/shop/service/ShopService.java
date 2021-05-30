package com.shop.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.shop.model.dao.ShopDao;
import com.shop.model.vo.Minimi;
import com.shop.model.vo.Music;


public class ShopService {
	
private ShopDao dao= new ShopDao();
	
	public List<Music> musicList(){
		Connection conn=getConnection();
		List<Music> list =dao.musicList(conn); 
		close(conn);
		return list;
	}
	public List<Minimi> minimiList(){
		Connection conn=getConnection();
		List<Minimi> list =dao.minimiList(conn); 
		close(conn);
		return list;
	}

}
