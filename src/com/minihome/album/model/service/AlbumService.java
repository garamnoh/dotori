package com.minihome.album.model.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.commit;
import static com.common.JDBCTemplate.getConnection;
import static com.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.minihome.album.model.dao.AlbumDao;
import com.minihome.album.model.vo.Album;
import com.minihome.album.model.vo.AlbumComment;

public class AlbumService {
	
	private AlbumDao albumDao=new AlbumDao();

	public List<Album> getMyPhotos(String hostMemberId) {
		Connection conn=getConnection();
		List<Album> albumList=albumDao.getMyPhotos(conn,hostMemberId);
		close(conn);
		return albumList;	
	}
	
	public List<String> getMyFolders(String hostMemberId) {
		Connection conn=getConnection();
		List<String> folderList=albumDao.getMyFolders(conn,hostMemberId);
		close(conn);
		return folderList;
	}
	
	public List<Album> getMyPhotosOnFolder(String hostMemberId,String folder) {
		Connection conn=getConnection();
		List<Album> albumList=albumDao.getMyPhotosOnFolder(conn,hostMemberId,folder);
		close(conn);
		return albumList;
	}
	
	public int changeFolder(String hostMemberId,String changeFolderTarget,String targetPhotoStr) {
		Connection conn=getConnection();
		int changeFolderResult=albumDao.changeFolder(conn,hostMemberId,changeFolderTarget,targetPhotoStr);
		if(changeFolderResult>0) commit(conn);
		else rollback(conn);
		close(conn);
		return changeFolderResult;
	}
	
	public int addFolder(String hostMemberId,String addFolderTitle) {
		Connection conn=getConnection();
		int addFolderResult=albumDao.addFolder(conn,hostMemberId,addFolderTitle);
		if(addFolderResult>0) commit(conn);
		else rollback(conn);
		close(conn);
		return addFolderResult;
	}
	
	public int deleteFolder(String hostMemberId,String deleteFolderTarget) {
		Connection conn=getConnection();
		int deleteFolderResult=albumDao.deleteFolder(conn,hostMemberId,deleteFolderTarget);
		if(deleteFolderResult>0) commit(conn);
		else rollback(conn);
		close(conn);
		return deleteFolderResult;
	}
	
	public List<AlbumComment> getMyComments(String hostMemberId) {
		Connection conn=getConnection();
		List<AlbumComment> commentList=albumDao.getMyComments(conn,hostMemberId);
		close(conn);
		return commentList;
	}
	
	public int insertComment(String commentLevel,String loginMemberId,String commentContent,String albumRef,String albumCommentRef) {
		Connection conn=getConnection();
		int insertCommentResult=albumDao.insertComment(conn,commentLevel,loginMemberId,commentContent,albumRef,albumCommentRef);
		if(insertCommentResult>0) commit(conn);
		else rollback(conn);
		return insertCommentResult;
	}
	
	public int albumCount(String hostMemberId,String folder) {
		Connection conn=getConnection();
		int totalData=albumDao.albumCount(conn,hostMemberId,folder);
		close(conn);
		return totalData;
	}
	
	public List<Album> getMyPagingPhotosOnFolder(int cPage,int numPerPage,String hostMemberId,String folder) {
		Connection conn=getConnection();
		List<Album> albumList=albumDao.getMyPagingPhotosOnFolder(conn,cPage,numPerPage,hostMemberId,folder);
		close(conn);
		return albumList;
	}
	
	public List<Album> getMyPagingPhotos(int cPage,int numPerPage,String hostMemberId) {
		Connection conn=getConnection();
		List<Album> albumList=albumDao.getMyPagingPhotos(conn,cPage,numPerPage,hostMemberId);
		close(conn);
		return albumList;
	}
	
}
