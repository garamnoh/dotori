package com.shop.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.commit;
import static com.common.JDBCTemplate.getConnection;
import static com.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.shop.model.dao.ShopDao;
import com.shop.model.vo.Minimi;
import com.shop.model.vo.Music;
import com.shop.model.vo.ShoppingList;
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
	public List<String> searchTitle(String type,String keyword) {
		Connection conn=getConnection();
		List<String> list=dao.searchTitle(conn,type,keyword);
		close(conn);
		return list;
	}
	public int insertShoppingList(String id,List<String> itemNums,String type){
		Connection conn=getConnection();
		int result=dao.insertShoppingList(conn,id,itemNums,type);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
		
	}
//	public List<ShoppingList> shoppingList(List<String> itemNums,String type){
//		Connection conn=getConnection();
//		List<ShoppingList> list=dao.shoppingList(conn,itemNums,type);
//		close(conn);
//		return list;
//	}
	
	

}
