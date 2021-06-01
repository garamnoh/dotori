package com.minihome.album.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.album.model.service.AlbumService;
import com.minihome.album.model.vo.Album;

@WebServlet("/page/minihomeRightPageToAlbum.do")
public class MinihomeRightPageToAlbumServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AlbumService albumService=new AlbumService();
       
    public MinihomeRightPageToAlbumServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		String hostMemberId=request.getParameter("hostMemberId");
		String folder=request.getParameter("folder");
		String changeFolderTarget=request.getParameter("changeFolderTarget");
		String targetPhotoStr=request.getParameter("targetPhotoStr");
		
		if(changeFolderTarget!=null&&targetPhotoStr!=null) {
			int changeFolderResult=albumService.changeFolder(hostMemberId,changeFolderTarget,targetPhotoStr);
		}
		
		List<Album> albumList=null;
		if(folder==null) {
			albumList=albumService.getMyPhotos(hostMemberId);
		}else {
			albumList=albumService.getMyPhotosOnFolder(hostMemberId,folder);
		}
		List<String> folderList=albumService.getMyFolders(hostMemberId);
		

		request.setAttribute("folderList",folderList);
		request.setAttribute("albumList",albumList);
		request.setAttribute("folder",folder);
		
		
		request.getRequestDispatcher("/views/minihome/rightpage_album.jsp").forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
