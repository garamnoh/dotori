package com.minihome.jukebox.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.jukebox.model.service.JukeboxService;
import com.shop.model.vo.Music;

@WebServlet("/page/minihomeRightPageToJukebox.do")
public class MinihomeRightPageToJukeboxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private JukeboxService jukeboxService=new JukeboxService();
       
    public MinihomeRightPageToJukeboxServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		String hostMemberId=request.getParameter("hostMemberId");
		String album=request.getParameter("album");
		String targetFolder=request.getParameter("targetFolder");
		String musicNoArrayStr=request.getParameter("musicNoArray");
		
		if(musicNoArrayStr!=null) {
			int changeFolderResult=jukeboxService.changeFolder(hostMemberId,targetFolder,musicNoArrayStr);
		}
		
		List<String> albumList=jukeboxService.getMyAlbums(hostMemberId);
		List<Music> musicList=null;
		if(album==null||album.equals("내 모든 음악")) {
			musicList=jukeboxService.getMyMusicOnJukebox(hostMemberId);
		}else {
			musicList=jukeboxService.getMyMusicOnAlbum(hostMemberId,album);
		}
		request.setAttribute("albumList",albumList);
		request.setAttribute("album",album);
		request.setAttribute("musicList",musicList);
		
		request.getRequestDispatcher("/views/minihome/rightpage_jukebox.jsp").forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
