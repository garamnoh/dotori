package com.shop.model.dao;

import static com.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.shop.model.vo.Minimi;
import com.shop.model.vo.Music;
import com.shop.model.vo.ShoppingList;
import com.shop.model.vo.Skin;

public class ShopDao {
private Properties prop=new Properties();
	
	public ShopDao() {
		String path=ShopDao.class.getResource("/sql/shop_sql.properties").getPath();
		try {
			prop.load(new FileReader(path));
			
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	public List<Music> musicList(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Music> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("musicList"));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Music m=new Music();
				m.setMusicNo(rs.getInt("music_no"));
				m.setMusicTitle(rs.getString("music_title"));
				m.setSinger(rs.getString("singer"));
				m.setFilepath(rs.getString("filepath"));
				m.setPrice(rs.getInt("price"));
				m.setImgFilepath(rs.getString("img_filepath"));
				list.add(m);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	public List<Minimi> minimiList(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Minimi> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("minimiList"));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Minimi mini=new Minimi();
				mini.setItemNo(rs.getInt("item_no"));
				mini.setFilepath(rs.getString("filepath"));
				mini.setPrice(rs.getInt("price"));
				mini.setTitle(rs.getString("title"));
				list.add(mini);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	public List<Skin> skinList(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Skin> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("skinList"));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Skin sk=new Skin();
				sk.setItemNo(rs.getInt("item_no"));
				sk.setSkinTitle(rs.getString("skin_title"));
				sk.setPrice(rs.getInt("price"));
				sk.setPreviewImgFilepath(rs.getString("preview_img_filepath"));
				sk.setCssFilepath(rs.getString("css_filepath"));
				list.add(sk);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	public List<String> searchTitle(Connection conn,String type,String keyword){
		PreparedStatement pstmt=null;
		ResultSet rs =null;
		List<String> list =new ArrayList();
//		if(type=="skin") {
//			String sql=prop.getProperty("searchSkinList");
//		}else if(type=="mini") {
//			String sql=prop.getProperty("searchMiniList");	
//		}else if(type=="music") {
//			String sql=prop.getProperty("searchMusicList");
//		}
		String sql=prop.getProperty("searchList");
		try {
			if(type.equals("skin")) {
				//pstmt=conn.prepareStatement(sql.replace("#", type));
				sql=sql.replace("#table", "skin");
				sql=sql.replace("#col1", "skin_title as title");
				sql=sql.replace("#col", "skin_title");
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, "%"+keyword+"%");
				
					
			}else if(type.equals("mini")) {
				sql=sql.replace("#table", "minimi");
				sql=sql.replace("#col1", "title as title");
				sql=sql.replace("#col", "title");
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, "%"+keyword+"%");
				
				
			}else if(type.equals("music")) {
				
				sql=sql.replace("#table", "music");
				sql=sql.replace("#col1", "music_title as title");
				sql=sql.replace("#col", "music_title");
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, "%"+keyword+"%");
			}
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				String s=rs.getString("title");
				list.add(s);
			}
		
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		
		return list;
	}
	public int insertShoppingList(Connection conn,String id,List<String> itemNums,String type){
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertShoppingList"));
			//pstmt.setString(1, m.getPassword());
			//아이템 타입마다 들어갈 ? 가 다르다
			System.out.println("멤버아이디 : "+id);
			System.out.println("dao테스트 타입: "+type);
			for(int i=0;i<itemNums.size();i++) {
				pstmt.setString(1, id);
				pstmt.setString(2, (type.equals("music")? itemNums.get(i):null));
				pstmt.setString(3, (type.equals("minimi")? itemNums.get(i):null));
				pstmt.setString(4, (type.equals("skin")? itemNums.get(i):null));
				result=pstmt.executeUpdate();
			}
			
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
//	public List<ShoppingList> shoppingList(Connection conn,List<String> itemNums,String type){
//		PreparedStatement pstmt=null;
//		ResultSet rs =null;
//		List<String> list =new ArrayList();
//		//ArrayList<Object> inBasket=new ArrayList();
//		
//		String sql=prop.getProperty("shoppingList");
//		try {
//			 String t=null;
//			 for(int i =0; i <itemNums.size(); i++){
//				 if(itemNums.size()==1) {
//					 //사용자가 아이템을 하나만 선택시
//					 t= (String)itemNums.get(i);
//				 }else {
//					 //사용자가 아이템을 다중선택
//					if(i<itemNums.size()) {
//							 t = itemNums.get(i)+","+"";  
//					}else if(i==itemNums.size()) {
//							 t= itemNums.get(i);
//					}
//				 }
//			}
//
//			if(type.equals("skin")) {
//				
//				sql=sql.replace("#table", "skin");
//				sql=sql.replace("#col", "item_no");
//				sql=sql.replace("#itemNums", t);
//				
//				pstmt=conn.prepareStatement(sql);
//			}else if(type.equals("minimi")) {
//				sql=sql.replace("#table", "minimi");
//				sql=sql.replace("#col", "item_no");
//				sql=sql.replace("#itemNums", t);
//				pstmt=conn.prepareStatement(sql);
//				
//			}else if(type.equals("music")) {
//				
//				sql=sql.replace("#table", "music");
//				sql=sql.replace("#col", "music_no");
//				sql=sql.replace("#itemNums", t);
//				pstmt=conn.prepareStatement(sql);
//			}
//			rs=pstmt.executeQuery();
//			
//		while(rs.next()) {
//				//장바구니에 타입(카테고리)마다 가져와야할 데이터가 다르다
//			if(type.equals("skin")) {
//				//String[] inBasket="";
//				inBasket.add(rs.getInt("item_no"));
//				inBasket.add(rs.getString("skin_title"));
//				inBasket.add(rs.getInt("price"));
//				inBasket.add(rs.getString("filepath"));
//				inBasket.add(rs.getString("css_filepath"));
//			}else if(type.equals("minimi")) {
//				inBasket.add(rs.getInt("item_no"));
//				inBasket.add(rs.getString("filepath"));
//				inBasket.add(rs.getInt("price"));
//				inBasket.add(rs.getString("title"));
//			}else if(type.equals("music")) {
//				inBasket.add(rs.getInt("music_no"));
//				inBasket.add(rs.getString("music_title"));
//				inBasket.add(rs.getString("singer"));
//				inBasket.add(rs.getString("filepath"));
//				inBasket.add(rs.getInt("price"));
//				inBasket.add(rs.getString("img_filepath"));
//			}
//		}
//		
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(rs);
//			close(pstmt);
//		}
//		return inBasket;
//	}
	

}
