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
	public List<Minimi> shoppingList1(String memberId){
		Connection conn=getConnection();
		List<Minimi> a=dao.shoppingList1(conn,memberId);
		close(conn);
		return a;
	}
	public List<Skin> shoppingList2(String memberId){
		Connection conn=getConnection();
		List<Skin> b=dao.shoppingList2(conn,memberId);
		close(conn);
		return b;
	}
	public List<Music> shoppingList3(String memberId){
		Connection conn=getConnection();
		List<Music> c=dao.shoppingList3(conn,memberId);
		close(conn);
		return c;
	}
	public int aIsInThereShoppingList(String id,List<String> aitemNo) {
		Connection conn=getConnection();
		int aSearchResult=dao.aIsInThereShoppingList(conn,id,aitemNo);
		close(conn);
		return aSearchResult;
	}
	public int bIsInThereShoppingList(String id,List<String> bitemNo) {
		Connection conn=getConnection();
		int bSearchResult=dao.bIsInThereShoppingList(conn,id,bitemNo);
		close(conn);
		return bSearchResult;
	}
	public int cIsInThereShoppingList(String id,List<String> citemNo) {
		Connection conn=getConnection();
		int cSearchResult=dao.cIsInThereShoppingList(conn,id,citemNo);
		close(conn);
		return cSearchResult;
	}
	public int aGetItemShoppingList(String id,List<String> aitemNo) {
		Connection conn=getConnection();
		int aResultInput=dao.aGetItemShoppingList(conn,id,aitemNo);
		if(aResultInput>0) commit(conn);
		else rollback(conn);
		close(conn);
		return aResultInput;
	}
	public int bGetItemShoppingList(String id,List<String> bitemNo) {
		Connection conn=getConnection();
		int bResultIntput=dao.bGetItemShoppingList(conn,id,bitemNo);
		if(bResultIntput>0) commit(conn);
		else rollback(conn);
		close(conn);
		return bResultIntput;
	}
	public int cGetItemShoppingList(String id,List<String> citemNo) {
		Connection conn=getConnection();
		int cResultInput=dao.cGetItemShoppingList(conn,id,citemNo);
		if(cResultInput>0) commit(conn);
		else rollback(conn);
		close(conn);
		return cResultInput;
	}
	public int aBuyDeleteShoppingList(String id,List<String> aitemNo) {
		Connection conn=getConnection();
		int aResult=dao.aBuyDeleteShoppingList(conn,id,aitemNo);
		if(aResult>0) commit(conn);
		else rollback(conn);
		close(conn);
		return aResult;
	}
	public int bBuyDeleteShoppingList(String id,List<String> bitemNo) {
		Connection conn=getConnection();
		int bResult=dao.bBuyDeleteShoppingList(conn,id,bitemNo);
		if(bResult>0) commit(conn);
		else rollback(conn);
		close(conn);
		return bResult;
	}
	public int cBuyDeleteShoppingList(String id,List<String> citemNo) {
		Connection conn=getConnection();
		int cResult=dao.cBuyDeleteShoppingList(conn,id,citemNo);
		if(cResult>0) commit(conn);
		else rollback(conn);
		close(conn);
		return cResult;
	}
	public int dotoriMinusShoppingList(String id,int myDotoriNums,int itemDotoriNums) {
		Connection conn=getConnection();
		int dotoriResult=dao.dotoriMinusShoppingList(conn,id,myDotoriNums,itemDotoriNums);
		if(dotoriResult>0) commit(conn);
		else rollback(conn);
		close(conn);
		return dotoriResult;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
