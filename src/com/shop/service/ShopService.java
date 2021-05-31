package com.shop.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.member.model.vo.Member;
import com.shop.model.dao.ShopDao;
import com.shop.model.vo.Minimi;
import com.shop.model.vo.Music;
import com.shop.model.vo.Skin;


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
	public List<Skin> skinList(){
		Connection conn=getConnection();
		List<Skin> list =dao.skinList(conn); 
		close(conn);
		return list;
	}
	public List<String> searchTitle(int cPage,int numPerpage,String type,String keyword) {
		Connection conn=getConnection();
		List<String> list=dao.searchTitle(conn,cPage,numPerpage,type,keyword);
		
		close(conn);
		return list;
	}
	
	

}
