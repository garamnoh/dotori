package com.friend.model.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.commit;
import static com.common.JDBCTemplate.getConnection;
import static com.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.friend.model.dao.FriendDao;
import com.friend.model.vo.Friend;
import com.friend.model.vo.SearchF;

public class FriendService {
	
	private FriendDao dao = new FriendDao();
	
	public ArrayList<Friend> requestedList(String memberId){
		Connection conn = getConnection();
		ArrayList<Friend> requestedList = dao.requestedList(conn, memberId);
		close(conn);
		return requestedList;
	}
	
	public ArrayList<Friend> friendsList(String memberId){
		Connection conn = getConnection();
		ArrayList<Friend> friendsList = dao.friendsList(conn, memberId);
		close(conn);
		return friendsList;
	}
	
	public int deleteFriend(String followee, String follower) {
		Connection conn = getConnection();
		int result = dao.deleteFriend(conn, followee, follower);
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int acceptFriend(String followee, String follower) {
		Connection conn = getConnection();
		int result = dao.acceptFriend(conn, followee, follower);
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public ArrayList<SearchF> searchList(String myId, String searchKeyword){
		Connection conn = getConnection();
		ArrayList<SearchF> resultList = dao.searchList(conn, myId, searchKeyword);
		close(conn);
		return resultList;
	}
	
}
