package com.minihome.album.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.minihome.album.model.service.AlbumService;
import com.minihome.album.model.vo.Album;
import com.minihome.album.model.vo.AlbumComment;

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
		
		String loginMemberId=request.getParameter("loginMemberId");
		String albumRef=request.getParameter("albumRef");
		String albumCommentRef=request.getParameter("albumCommentRef");
		String commentLevel=request.getParameter("commentLevel");
		String commentContent=request.getParameter("commentContent");
		
		if(folder==null) System.out.println("폴더는 널입니다!!!!");
		else System.out.println("폴더는 널이 아닙니다!!!!");
		
		
		int cPage;
		int numPerPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		try{
			numPerPage=Integer.parseInt(request.getParameter("numPerPage"));
		}catch(NumberFormatException e) {
			numPerPage=2;
		}
		
		int totalData=0;
		if(folder==null||folder.equals("null")) {
			totalData=albumService.albumCount(hostMemberId);
		}else {
			totalData=albumService.albumCountOnFolder(hostMemberId,folder);
		}
		int totalPage=(int)Math.ceil((double)totalData/numPerPage);
		
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		String pageBar="";
		if(pageNo==1) {
			pageBar+="<span>[이전]</span>";
		}else {
			pageBar+="<a id='"+(pageNo-1)+"/"+numPerPage+"'>[이전]</a>";
			//pageBar+="<a href='"+request.getContextPath()+"/page/minihomeRightPageToAlbum.do?cPage="+(pageNo-1)+"&numPerPage="+numPerPage+"'>[이전]</a>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {	
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a id='"+pageNo+"/"+numPerPage+"'>"+pageNo+"</a>";
				//pageBar+="<a href='"+request.getContextPath()+"/page/minihomeRightPageToAlbum.do?cPage="+pageNo+"&numPerPage="+numPerPage+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<span>[다음]</span>";
		}else {
			pageBar+="<a id='"+pageNo+"/"+numPerPage+"'>[다음]</a>";
			//pageBar+="<a href='"+request.getContextPath()+"/page/minihomeRightPageToAlbum.do?cPage="+pageNo+"&numPerPage="+numPerPage+"'>[다음]</a>";
		}
		
		
		
		if(albumRef!=null&&albumCommentRef!=null&&commentLevel!=null) {
			int insertCommentResult=albumService.insertComment(commentLevel,loginMemberId,commentContent,albumRef,albumCommentRef);
		}
		
		if(changeFolderTarget!=null&&targetPhotoStr!=null) {
			int changeFolderResult=albumService.changeFolder(hostMemberId,changeFolderTarget,targetPhotoStr);
		}
		
		List<Album> albumList=null;
		if(folder==null||folder.equals("null")) {
			albumList=albumService.getMyPagingPhotos(cPage,numPerPage,hostMemberId);
		}else {
			albumList=albumService.getMyPagingPhotosOnFolder(cPage,numPerPage,hostMemberId,folder);
		}
		List<String> folderList=albumService.getMyFolders(hostMemberId);
		
		List<AlbumComment> commentList=albumService.getMyComments(hostMemberId);

		request.setAttribute("folderList",folderList);
		request.setAttribute("albumList",albumList);
		request.setAttribute("folder",folder);
		request.setAttribute("commentList",commentList);
		request.setAttribute("pageBar",pageBar);
		
		request.getRequestDispatcher("/views/minihome/rightpage_album.jsp").forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
