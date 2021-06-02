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
		
		System.out.println("깃발깃발깃발");
		
		String uploadPath=getServletContext().getRealPath("/upload/photo");
		int maxSize=1024*1024*10;
		String encode="UTF-8";
		FileRenamePolicy policy=new DefaultFileRenamePolicy();
		
		MultipartRequest mr=new MultipartRequest(request,uploadPath,maxSize,encode,policy);
		
		Album l=new Album();
		l.setMemberId(mr.getParameter("upload_memberId"));
		System.out.println("멤버아이디 테스트 서블릿 : "+mr.getParameter("upload_memberId"));
		l.setTitle(mr.getParameter("title"));
		l.setFilepath(mr.getFilesystemName("uploadFile"));
		l.setFolder(mr.getParameter("folder"));
		l.setHashTag(mr.getParameter("hashTag"));
		l.setContent(mr.getParameter("content"));
		
		int uploadResult=albumService.uploadPhoto(l);
		
		
		request.getRequestDispatcher("/page/minihomeRightPageToAlbum.do").forward(request,response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
