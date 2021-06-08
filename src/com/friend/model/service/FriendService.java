package com.friend.model.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.commit;
import static com.common.JDBCTemplate.getConnection;
import static com.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.friend.model.dao.FriendDao;
import com.friend.model.vo.Friend;
import com.friend.model.vo.Like;
import com.friend.model.vo.SearchF;

public class FriendService {
	
	private FriendDao dao = new FriendDao();
	
	public ArrayList<Friend> requestedList(String memberId){
		Connection conn = getConnection();
		ArrayList<Friend> requestedList = dao.requestedList(conn, memberId);
		close(conn);
		return requestedList;
	}
	
	public ArrayList<Friend> requestToList(String memberId){
		Connection conn = getConnection();
		ArrayList<Friend> requestToList = dao.requestToList(conn, memberId);
		close(conn);
		return requestToList;
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
	
	public int requestTo(String memberId, String requestTo) {
		Connection conn = getConnection();
		int result = dao.requestTo(conn, memberId, requestTo);
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int reject(String memberId, String reject) {
		Connection conn = getConnection();
		int result = dao.reject(conn, memberId, reject);
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int cancel(String memberId, String cancel) {
		Connection conn = getConnection();
		int result = dao.cancel(conn, memberId, cancel);
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int requestedFromInfo(String memberId) {
		Connection conn = getConnection();
		int requestedFromCount = dao.requestedFromCount(conn, memberId);
		close(conn);
		return requestedFromCount;
	}
	
	public int feedAlbumCount() {
		Connection conn = getConnection();
		int feedAlbumCount = dao.feedAlbumCount(conn);
		close(conn);
		return feedAlbumCount;
	}
	
	public int feedDiaryCount() {
		Connection conn = getConnection();
		int feedDiaryCount = dao.feedDiaryCount(conn);
		close(conn);
		return feedDiaryCount;
	}
	
	public HashMap<String, Object> newFeed(String myId, int startNum, int endNum) {
		Connection conn = getConnection();
		HashMap<String, Object> newFeed = dao.newFeed(conn, myId, startNum, endNum);
		close(conn);
		return newFeed;
	}
	
	public void lastLogDate(String memberId) {
		Connection conn = getConnection();
		int result = dao.lastLogDate(conn, memberId);
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
	}
	
	public int newFeedCount(String memberId) {
		Connection conn = getConnection();
		int newFeedCount = dao.newFeedCount(conn, memberId);
		close(conn);
		return newFeedCount;
	}
	
	public ArrayList<Integer> like(String myId){
		Connection conn = getConnection();
		ArrayList<Integer> likeList = dao.like(conn, myId);
		close(conn);
		return likeList;
	}
	
	public ArrayList<Integer> likeAlbum(String myId){
		Connection conn = getConnection();
		ArrayList<Integer> likeListAlbum = dao.likeAlbum(conn, myId);
		close(conn);
		return likeListAlbum;
	}
	
	public ArrayList<Like> count(){
		Connection conn = getConnection();
		ArrayList<Like> countAlbum = dao.count(conn);
		close(conn);
		return countAlbum;
	}
	
	public ArrayList<Like> countAlbum(){
		Connection conn = getConnection();
		ArrayList<Like> count = dao.countAlbum(conn);
		close(conn);
		return count;
	}
	
	public void checkLike(String diaryNo, String myId) {
		Connection conn = getConnection();
		int result = dao.checkLike(conn, diaryNo, myId);
		if(result > 0 ) commit(conn);
		else rollback(conn);
		close(conn);
	}
	
	public void checkLikeAlbum(String imgNo, String myId) {
		Connection conn = getConnection();
		int result = dao.checkLikeAlbum(conn, imgNo, myId);
		if(result > 0 ) commit(conn);
		else rollback(conn);
		close(conn);
	}
	
	public int likeCount(String diaryNo, String myId) {
		Connection conn = getConnection();
		int likeCount = dao.likeCount(conn, diaryNo, myId);
		close(conn);
		return likeCount;
	}
	
	public int likeCountAlbum(String imgNo, String myId) {
		Connection conn = getConnection();
		int likeCountAlbum = dao.likeCountAlbum(conn, imgNo, myId);
		close(conn);
		return likeCountAlbum;
	}
}
