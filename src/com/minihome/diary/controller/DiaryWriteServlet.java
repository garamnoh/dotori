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
import com.member.model.service.MemberService;
import com.minihome.diary.model.service.DiaryService;
import com.minihome.diary.model.vo.Diary;
import com.minihome.diary.model.vo.DiaryFolder;
import com.minihome.diary.model.vo.DiaryFolderShare;
import com.minihome.model.service.MinihomeService;

/**
 * Servlet implementation class DiaryWriteServlet
 */
@WebServlet("/diary/diaryWrite")
public class DiaryWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    	
	private MemberService memberService=new MemberService();
	private MinihomeService minihomeService=new MinihomeService();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiaryWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		boolean flag=false;

		Diary d=new Diary();
		String hostId=request.getParameter("hostMemberId");		
		String loginId=request.getParameter("loginMemberId");		
		int folder=Integer.parseInt(request.getParameter("diary_folder"));		
		String content=request.getParameter("diary_content_input");
		
		List<DiaryFolder> fList=new DiaryService().selectFolderList(loginId);
		List<DiaryFolderShare> fsList=new DiaryService().folderShare(folder);
		
		for(DiaryFolder df : fList) {
			if(folder==df.getFolderNo() && df.getShareLevel().equals("PUBLIC")) {
				flag=true;
			}else if(folder==df.getFolderNo() && df.getShareLevel().equals("FOLLOWERS")) {
				ArrayList<Friend> friend=new FriendService().friendsList(hostId);			
				int test=friend.indexOf(loginId);			
				for(Friend f : friend) {				
					if(loginId.equals(f.getFollower())) {
						flag=true;
					}
				}
			}else if(folder==df.getFolderNo() && df.getShareLevel().equals("FRIENDS")) {
				List<DiaryFolderShare> shareMember=new DiaryService().folderShare(folder);			
				for(DiaryFolderShare fs : shareMember) {
					if(loginId.equals(fs.getAllowedMember())) {
						flag=true;
					}
				}
			}						
		}	
		
		if(loginId.equals(hostId) || flag==true) {
			d.setWriter(loginId);
			d.setMemberId(hostId);
			d.setFolderNo(folder);
			d.setContent(content);
			int result=new DiaryService().insertDiary(d);
			if(result>0) {
				request.getRequestDispatcher("/page/minihomeRightPageToDiary.do").forward(request, response);
			}
		}else {
			request.setAttribute("msg", "권한이 없습니다.");
			request.getRequestDispatcher("/page/minihomeRightPageToDiary.do").forward(request, response);
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
