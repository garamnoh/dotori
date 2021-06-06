package com.minihome.jukebox.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.jukebox.model.service.JukeboxService;

@WebServlet("/page/minihomeLeftPageToJukebox.do")
public class MinihomeLeftPageToJukeboxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private JukeboxService jukeboxService=new JukeboxService();
      
    public MinihomeLeftPageToJukeboxServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		
		String hostMemberId=request.getParameter("hostMemberId");
		String newAlbumTitle=request.getParameter("newAlbumTitle");
		String albumForDelete=request.getParameter("albumForDelete");
		String currentFolder=request.getParameter("currentFolder");
		
		if(currentFolder==null) {
			currentFolder="배경음악";
		}
		
		if(newAlbumTitle!=null) {
			int addAlbumResult=jukeboxService.addAlbum(hostMemberId,newAlbumTitle);
		}
		
		if(albumForDelete!=null) {
			int deleteAlbumResult=jukeboxService.deleteAlbum(hostMemberId,albumForDelete);
		}
		
		List<String> albumList=jukeboxService.getMyAlbums(hostMemberId);
		int[] countArr=null;
		if(albumList!=null) {
			albumList.add(0,"내 모든 음악");
			if(!albumList.contains("기본앨범")) {
				int addDefaultAlbumResult=jukeboxService.addAlbum(hostMemberId,"기본앨범");
			}
			if(!albumList.contains("배경음악")) {
				int addBackgroundMusicAlbumResult=jukeboxService.addAlbum(hostMemberId,"배경음악");
			}
			albumList.remove(albumList.indexOf("배경음악"));
			albumList.add(0,"배경음악");
			albumList.remove(albumList.indexOf("기본앨범"));
			albumList.add(albumList.size(),"기본앨범");
			countArr=new int[albumList.size()];
			for(int i=0;i<albumList.size();i++) {
				if(albumList.get(i).equals("내 모든 음악")) {
					int countMusic=jukeboxService.countMusic(hostMemberId);
					countArr[i]=countMusic;
				}else {
					int countMusicOnAlbumResult=jukeboxService.countMusicOnAlbum(hostMemberId,albumList.get(i));
					countArr[i]=countMusicOnAlbumResult;
				}
			}
		}
		
		request.setAttribute("albumList",albumList);
		request.setAttribute("currentFolder",currentFolder);
		request.setAttribute("countArr",countArr);
		request.getRequestDispatcher("/views/minihome/leftpage_jukebox.jsp").forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
