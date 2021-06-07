package com.minihome.album.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.minihome.album.model.service.AlbumService;
import com.minihome.album.model.vo.Album;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

@WebServlet("/minihomeUploadPhoto.do")
public class MiniHomeUploadPhotoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AlbumService albumService=new AlbumService();
       
    public MiniHomeUploadPhotoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!ServletFileUpload.isMultipartContent(request)) {
			//에러 처리
			System.out.println("에러발생에러발생에러발생");
			return;
		}
		
		String hostMemberId=request.getParameter("hostMemberId");
		
		String uploadPath=getServletContext().getRealPath("/upload/photo");
		int maxSize=1024*1024*10;
		String encode="UTF-8";
		FileRenamePolicy policy=new DefaultFileRenamePolicy();
		
		MultipartRequest mr=new MultipartRequest(request,uploadPath,maxSize,encode,policy);
		
		Album l=new Album();
		l.setMemberId(mr.getParameter("upload_memberId"));
		l.setTitle(mr.getParameter("title"));
		l.setFilepath(mr.getFilesystemName("uploadFile"));
		l.setFolder(mr.getParameter("folder"));
		l.setHashTag(mr.getParameter("hashTag"));
		l.setContent(mr.getParameter("content"));
		
		if(mr.getParameter("imgNo")==null) {
			int uploadResult=albumService.uploadPhoto(l);
		}else if(mr.getParameter("uploadFile")==null) {
			l.setFilepath(mr.getParameter("existingFile"));
			int updatePhotoResult=albumService.updatePhoto(l);
		}else {
			int imgNo=Integer.parseInt(mr.getParameter("imgNo"));
			l.setImgNo(imgNo);
			int updatePhotoResult=albumService.updatePhoto(l);
		}
		
		request.setAttribute("hostMemberId",hostMemberId);
		request.getRequestDispatcher("/page/minihomeRightPageToAlbum.do").forward(request,response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
