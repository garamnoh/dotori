package com.minihome.album.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.minihome.album.model.service.AlbumService;

@WebServlet("/ajax/albumLike.do")
public class AlbumLikeAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AlbumService albumService=new AlbumService();
       
    public AlbumLikeAjaxServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;charset=utf-8");
		JSONObject jo=new JSONObject();
		
		String loginMemberId=request.getParameter("loginMemberId");
		String likeImgTarget=request.getParameter("likeImgTarget");
		String unlikeImgTarget=request.getParameter("unlikeImgTarget");
		
		int likeNum=0;
		
		if(loginMemberId!=null) {
			if(likeImgTarget!=null) {
				int likeImgNo=Integer.parseInt(likeImgTarget);
				int likeImgResult=albumService.likeImg(loginMemberId,likeImgNo);
				likeNum=albumService.countLikeNum(likeImgNo);
			}
			
			if(unlikeImgTarget!=null) {
				int unlikeImgNo=Integer.parseInt(unlikeImgTarget);
				int unlikeImgResult=albumService.unlikeImg(loginMemberId,unlikeImgNo);
				likeNum=albumService.countLikeNum(unlikeImgNo);
			}
		}
		
		System.out.println("서블릿에서 likeNum 테스트 : "+likeNum);
		
		jo.put("likeNum",likeNum);
		response.getWriter().print(jo);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
