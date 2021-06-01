package com.minihome.album.model.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.getConnection;
import static com.common.JDBCTemplate.commit;
import static com.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.minihome.album.model.dao.AlbumDao;
import com.minihome.album.model.vo.Album;

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
	
}
