package com.shop.model.dao;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.commit;
import static com.common.JDBCTemplate.getConnection;
import static com.common.JDBCTemplate.rollback;

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
	
	public List<Minimi> shoppingList1(Connection conn,String memberId){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Minimi> a=new ArrayList();
		
		try {
			pstmt=conn.prepareStatement(prop.getProperty("shoppingList1"));
			pstmt.setString(1,memberId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Minimi mini= new Minimi();
				mini.setItemNo(rs.getInt("item_no"));
				mini.setFilepath(rs.getString("filepath"));
				mini.setTitle(rs.getString("title"));
				mini.setPrice(rs.getInt("price"));
				a.add(mini);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return a;
	}
	public List<Skin> shoppingList2(Connection conn,String memberId){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Skin> b=new ArrayList();
		
		try {
			pstmt=conn.prepareStatement(prop.getProperty("shoppingList2"));
			pstmt.setString(1,memberId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Skin sk=new Skin();
				sk.setItemNo(rs.getInt("item_no"));
				sk.setSkinTitle(rs.getString("skin_title"));
				sk.setPrice(rs.getInt("price"));
				sk.setPreviewImgFilepath(rs.getString("preview_img_filepath"));
				sk.setCssFilepath(rs.getString("css_filepath"));
				b.add(sk);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return b;
	}
	public List<Music> shoppingList3(Connection conn,String memberId){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Music> c=new ArrayList();
		
		try {
			pstmt=conn.prepareStatement(prop.getProperty("shoppingList3"));
			pstmt.setString(1,memberId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Music m= new Music();
				m.setMusicNo(rs.getInt("music_no"));
				m.setMusicTitle(rs.getString("music_title"));
				m.setSinger(rs.getString("singer"));
				m.setImgFilepath(rs.getString("filepath"));
				m.setPrice(rs.getInt("price"));
				m.setImgFilepath(rs.getString("img_filepath"));
				c.add(m);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return c;
	}
	public List<Minimi> ashopSearchItem(Connection conn,String searchKey){
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		List<Minimi> minimiSearchResult= new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("ashopSearchItem"));
			pstmt.setString(1, "%"+searchKey+"%");
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Minimi mi= new Minimi();
				mi.setItemNo(rs.getInt("item_no"));
				mi.setFilepath(rs.getString("filepath"));
				mi.setPrice(rs.getInt("price"));
				mi.setTitle(rs.getString("title"));
				minimiSearchResult.add(mi);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return minimiSearchResult;
	}
	public List<Skin> bshopSearchItem(Connection conn,String searchKey){
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		List<Skin> skinSearchResult= new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("bshopSearchItem"));
			pstmt.setString(1, "%"+searchKey+"%");
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Skin sk= new Skin();
				sk.setItemNo(rs.getInt("item_no"));
				sk.setSkinTitle(rs.getString("skin_title"));
				sk.setPrice(rs.getInt("price"));
				sk.setPreviewImgFilepath(rs.getString("preview_img_filepath"));
				sk.setCssFilepath(rs.getString("css_filepath"));
				skinSearchResult.add(sk);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return skinSearchResult;
	}
	public List<Music> cshopSearchItem(Connection conn,String searchKey){
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		List<Music> musicSearchResult= new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("cshopSearchItem"));
			pstmt.setString(1, "%"+searchKey+"%");
			pstmt.setString(2, "%"+searchKey+"%");
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Music m= new Music();
				m.setMusicNo(rs.getInt("music_no"));
				m.setMusicTitle(rs.getString("music_title"));
				m.setSinger(rs.getString("singer"));
				m.setFilepath(rs.getString("filepath"));
				m.setPrice(rs.getInt("price"));
				m.setImgFilepath(rs.getString("img_filepath"));
				musicSearchResult.add(m);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return musicSearchResult;
	}
	public List<Minimi> ashopTotalOrder(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		List<Minimi> minimiTotalTitleOrder= new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("ashopTotalOrder"));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Minimi mi= new Minimi();
				mi.setItemNo(rs.getInt("item_no"));
				mi.setFilepath(rs.getString("filepath"));
				mi.setPrice(rs.getInt("price"));
				mi.setTitle(rs.getString("title"));
				minimiTotalTitleOrder.add(mi);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return minimiTotalTitleOrder;
	}
	public List<Skin> bshopTotalOrder(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		List<Skin> skinTotalTitleOrder= new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("bshopTotalOrder"));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Skin sk= new Skin();
				sk.setItemNo(rs.getInt("item_no"));
				sk.setSkinTitle(rs.getString("skin_title"));
				sk.setPrice(rs.getInt("price"));
				sk.setPreviewImgFilepath(rs.getString("preview_img_filepath"));
				sk.setCssFilepath(rs.getString("css_filepath"));
				skinTotalTitleOrder.add(sk);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return skinTotalTitleOrder;
	}
	public List<Music> cshopTotalOrder(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		List<Music> musicTotalTitleOrder= new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("cshopTotalOrder"));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Music m= new Music();
				m.setMusicNo(rs.getInt("music_no"));
				m.setMusicTitle(rs.getString("music_title"));
				m.setSinger(rs.getString("singer"));
				m.setFilepath(rs.getString("filepath"));
				m.setPrice(rs.getInt("price"));
				m.setImgFilepath(rs.getString("img_filepath"));
				musicTotalTitleOrder.add(m);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return musicTotalTitleOrder;
	}
	public List<Minimi> ashopPriceOrder(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		List<Minimi> minimiPriceOrder= new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("ashopPriceOrder"));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Minimi mi= new Minimi();
				mi.setItemNo(rs.getInt("item_no"));
				mi.setFilepath(rs.getString("filepath"));
				mi.setPrice(rs.getInt("price"));
				mi.setTitle(rs.getString("title"));
				minimiPriceOrder.add(mi);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return minimiPriceOrder;
	}
	public List<Skin> bshopPriceOrder(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		List<Skin> skinPriceOrder= new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("bshopPriceOrder"));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Skin sk= new Skin();
				sk.setItemNo(rs.getInt("item_no"));
				sk.setSkinTitle(rs.getString("skin_title"));
				sk.setPrice(rs.getInt("price"));
				sk.setPreviewImgFilepath(rs.getString("preview_img_filepath"));
				sk.setCssFilepath(rs.getString("css_filepath"));
				skinPriceOrder.add(sk);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return skinPriceOrder;
	}
	public List<Music> cshopPriceOrder(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		List<Music> musicPriceOrder= new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("cshopPriceOrder"));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Music m= new Music();
				m.setMusicNo(rs.getInt("music_no"));
				m.setMusicTitle(rs.getString("music_title"));
				m.setSinger(rs.getString("singer"));
				m.setFilepath(rs.getString("filepath"));
				m.setPrice(rs.getInt("price"));
				m.setImgFilepath(rs.getString("img_filepath"));
				musicPriceOrder.add(m);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return musicPriceOrder;
	}
	public List<Minimi> ashopPopularOrder(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		List<Minimi> minimiPopularOrder= new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("ashopPopularOrder"));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Minimi mi= new Minimi();
				mi.setItemNo(rs.getInt("item_no"));
				mi.setFilepath(rs.getString("filepath"));
				mi.setPrice(rs.getInt("price"));
				mi.setTitle(rs.getString("title"));
				minimiPopularOrder.add(mi);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return minimiPopularOrder;
	}
	public List<Skin> bshopPopularOrder(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		List<Skin> skinPopularOrder= new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("bshopPopularOrder"));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Skin sk= new Skin();
				sk.setItemNo(rs.getInt("item_no"));
				sk.setSkinTitle(rs.getString("skin_title"));
				sk.setPrice(rs.getInt("price"));
				sk.setPreviewImgFilepath(rs.getString("preview_img_filepath"));
				sk.setCssFilepath(rs.getString("css_filepath"));
				skinPopularOrder.add(sk);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return skinPopularOrder;
	}
	public List<Music> cshopPopularOrder(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		List<Music> musicPopularOrder= new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("cshopPopularOrder"));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Music m= new Music();
				m.setMusicNo(rs.getInt("music_no"));
				m.setMusicTitle(rs.getString("music_title"));
				m.setSinger(rs.getString("singer"));
				m.setFilepath(rs.getString("filepath"));
				m.setPrice(rs.getInt("price"));
				m.setImgFilepath(rs.getString("img_filepath"));
				musicPopularOrder.add(m);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return musicPopularOrder;
	}
	public int aIsInThereShoppingList(Connection conn,String id,List<String> aitemNo) {
		PreparedStatement pstmt=null;
		ResultSet rs =null;
		int aSearchResult=0;
		try {
			
			pstmt=conn.prepareStatement(prop.getProperty("aIsInThereShoppingList"));
			for(int i=0;i<aitemNo.size();i++) {
				pstmt.setString(1, id);
				pstmt.setString(2, aitemNo.get(i));
				
				System.out.println("디에이오 테스트 : "+id+"/"+aitemNo.get(i));
				
				rs=pstmt.executeQuery();
				if(rs.next()) aSearchResult+=1;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return aSearchResult;
	}
	public int bIsInThereShoppingList(Connection conn,String id,List<String> bitemNo) {
		PreparedStatement pstmt=null;
		ResultSet rs =null;
		int bSearchResult=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("bIsInThereShoppingList"));
			for(int i=0;i<bitemNo.size();i++) {
				pstmt.setString(1, id);
				pstmt.setString(2, bitemNo.get(i));
				rs=pstmt.executeQuery();
				if(rs.next()) bSearchResult+=1;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return bSearchResult;
	}
	public int cIsInThereShoppingList(Connection conn,String id,List<String> citemNo) {
		PreparedStatement pstmt=null;
		ResultSet rs =null;
		int cSearchResult=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("cIsInThereShoppingList"));
			for(int i=0;i<citemNo.size();i++) {
				pstmt.setString(1, id);
				pstmt.setString(2, citemNo.get(i));
				rs=pstmt.executeQuery();
				if(rs.next()) cSearchResult+=1;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return cSearchResult;
	}
	public int aGetItemShoppingList(Connection conn,String id,List<String> aitemNo) {
		PreparedStatement pstmt=null;
		int aResultInput=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("aGetItemShoppingList"));
			for(int i=0;i<aitemNo.size();i++) {
				pstmt.setString(1, id);
				System.out.println("dao test : "+aitemNo.get(i));
				pstmt.setString(2, aitemNo.get(i));
				aResultInput+=pstmt.executeUpdate();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return aResultInput;
	}
	public int bGetItemShoppingList(Connection conn,String id,List<String> bitemNo) {
		PreparedStatement pstmt=null;
		int bResultInput=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("bGetItemShoppingList"));
			for(int i=0;i<bitemNo.size();i++) {
				pstmt.setString(1, id);
				pstmt.setString(2, bitemNo.get(i));
				
				bResultInput+=pstmt.executeUpdate();
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return bResultInput;
	}
	public int cGetItemShoppingList(Connection conn,String id,List<String> citemNo) {
		PreparedStatement pstmt=null;
		int cResultInput=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("cGetItemShoppingList"));
			for(int i=0;i<citemNo.size();i++) {
				pstmt.setString(1, id);
				pstmt.setString(2, citemNo.get(i));
				pstmt.setString(3, "기본앨범");
				cResultInput+=pstmt.executeUpdate();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return cResultInput;
	}
	public int aBuyDeleteShoppingList(Connection conn,String id,List<String> aitemNo){
		PreparedStatement pstmt=null;
		int aResult=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("aBuyDeleteShoppingList"));
			
			for(int i=0;i<aitemNo.size();i++) {
				pstmt.setString(1, id);
				pstmt.setString(2, aitemNo.get(i));
				aResult=pstmt.executeUpdate();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return aResult;
	}
	public int bBuyDeleteShoppingList(Connection conn,String id,List<String> bitemNo){
		PreparedStatement pstmt=null;
		int bResult=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("bBuyDeleteShoppingList"));
			
			for(int i=0;i<bitemNo.size();i++) {
				pstmt.setString(1, id);
				pstmt.setString(2, bitemNo.get(i));
				bResult=pstmt.executeUpdate();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return bResult;
	}
	public int cBuyDeleteShoppingList(Connection conn,String id,List<String> citemNo){
		PreparedStatement pstmt=null;
		int cResult=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("cBuyDeleteShoppingList"));
			
			for(int i=0;i<citemNo.size();i++) {
				pstmt.setString(1, id);
				pstmt.setString(2, citemNo.get(i));
				cResult=pstmt.executeUpdate();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return cResult;
	}
	public int dotoriMinusShoppingList(Connection conn,String id,int myDotoriNums,int itemDotoriNums) {
		PreparedStatement pstmt=null;
		int dotoriResult=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("dotoriMinusShoppingList"));
			pstmt.setInt(1, myDotoriNums-itemDotoriNums);
			pstmt.setString(2, id);
			dotoriResult=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return dotoriResult;
	}
	public int aDeleteInShoppingList(Connection conn,String id,List<String> aitemNo){
		PreparedStatement pstmt=null;
		int aResultDelete=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("aBuyDeleteShoppingList"));
			for(int i=0;i<aitemNo.size();i++) {
				pstmt.setString(1, id);
				pstmt.setString(2, aitemNo.get(i));
				aResultDelete=pstmt.executeUpdate();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return aResultDelete;
	}
	public int bDeleteInShoppingList(Connection conn,String id,List<String> bitemNo){
		PreparedStatement pstmt=null;
		int bResultDelete=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("bBuyDeleteShoppingList"));
			for(int i=0;i<bitemNo.size();i++) {
				pstmt.setString(1, id);
				pstmt.setString(2, bitemNo.get(i));
				bResultDelete=pstmt.executeUpdate();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return bResultDelete;
	}
	public int cDeleteInShoppingList(Connection conn,String id,List<String> citemNo){
		PreparedStatement pstmt=null;
		int cResultDelete=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("cBuyDeleteShoppingList"));
			for(int i=0;i<citemNo.size();i++) {
				pstmt.setString(1, id);
				pstmt.setString(2, citemNo.get(i));
				cResultDelete=pstmt.executeUpdate();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return cResultDelete;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
