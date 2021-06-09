package com.minihome.diary.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.friend.model.service.FriendService;
import com.friend.model.vo.Friend;
import com.minihome.diary.model.service.DiaryService;
import com.minihome.diary.model.vo.DiaryFolderShare;

/**
 * Servlet implementation class DiaryFolder
 */
@WebServlet(name = "DiaryFolderServlet", urlPatterns = { "/diary/diaryFolder" })
public class DiaryFolderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiaryFolderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		
		int folderNo=Integer.parseInt(request.getParameter("folderNo"));
		String loginMemberId=request.getParameter("loginMemberId");
		String hostMemberId=request.getParameter("hostMemberId");
		String shareLevel=request.getParameter("shareLevel");	
		
		boolean flag=false;
		
		System.out.println("폴더번호 : "+folderNo+" 쉐어레벨 : "+shareLevel);
		System.out.println("미니홈피주인 : "+hostMemberId+" 로그인아이디 : "+loginMemberId);
		
		if(shareLevel.equals("PUBLIC")) { //전체공개 폴더는 다 보이게
			flag=true;			
		}else if(shareLevel.equals("FOLLOWERS")) { //일촌 공개폴더는 일촌인지 확인하고
			ArrayList<Friend> friend=new FriendService().friendsList(hostMemberId);			
			int test=friend.indexOf(loginMemberId);			
			for(Friend f : friend) {
				System.out.println(loginMemberId.equals(f.getFollower())+"이건 되나요?");
				if(loginMemberId.equals(f.getFollower())) {
					flag=true;
				}
			}
		}else if(shareLevel.equals("PRIVATE")) { //비공개폴더는 미니홈피 주인만
			if(loginMemberId.equals(hostMemberId)) {
				flag=true;
			}
		}else if(shareLevel.equals("FRIENDS")) { //멤버공개폴더는 공유하는 멤버인지 확인하기
			List<DiaryFolderShare> shareMember=new DiaryService().folderShare(folderNo);			
			for(DiaryFolderShare fs : shareMember) {
				if(loginMemberId.equals(fs.getAllowedMember())) {
					flag=true;
				}
			}
		}
		
		if(loginMemberId.equals(hostMemberId) || flag==true) {
			request.setAttribute("diaryFolderLevel", folderNo);				
			request.getRequestDispatcher("/page/minihomeRightPageToDiary.do").forward(request, response);
		}else {
			System.out.println("권한이 없습니다");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
