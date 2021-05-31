package com.minihome.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.service.MemberService;
import com.member.model.vo.Member;
import com.minihome.diary.model.service.DiaryService;
import com.minihome.jukebox.model.service.JukeboxService;
import com.minihome.model.service.MinihomeService;
import com.minihome.model.vo.Minihome;
import com.shop.model.vo.Music;

@WebServlet("/page/minihome.do")
public class NewWindowMinihomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService=new MemberService();
	private MinihomeService minihomeService=new MinihomeService();
	private JukeboxService jukeboxService=new JukeboxService();
	private DiaryService diaryService=new DiaryService();

    public NewWindowMinihomeServlet() {
    	super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(false);
		//if(session!=null) session.invalidate();
		if(session==null||session.getAttribute("loginMember")==null) {
			request.getRequestDispatcher("/views/minihome/errorpage.jsp").forward(request,response);
			return;
		}
		Member loginMember=(Member)session.getAttribute("loginMember");
		String hostMemberId=request.getParameter("hostMemberId");
		Member hostMember=null;
		if(hostMemberId!=null) {
			hostMember=memberService.selectMemberId(hostMemberId);
		}else {
			hostMember=loginMember;
		}
		hostMemberId=hostMember.getMemberId();
		Minihome minihome=minihomeService.getMinihome(hostMemberId);
		
		boolean visitFlag=false;
		String logString="";
		Cookie[] cookies=request.getCookies();
		if(cookies!=null) {
			for(Cookie c:cookies) {
				if(c.getName().equals("minihomeVisitLog")) {
					if(c.getValue().contains("|"+hostMemberId+"|")) visitFlag=true;
					logString=c.getValue();
					break;
				}
			}
		}
		if(!visitFlag) {
			Cookie c=new Cookie("minihomeVisitLog",logString+"|"+hostMemberId+"|");
			c.setMaxAge(60*60*24);
			response.addCookie(c);
		}
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String today=sdf.format(new Date());
		int todayResult=0;
		int todayToTotalResult=0;
		if(!visitFlag) {
			if(minihome.getTodayDate().toString().equals(today)) {
				todayResult=minihomeService.addToday(hostMemberId);
			}else {
				todayToTotalResult=minihomeService.todayToTotal(hostMemberId);
				todayResult=minihomeService.addToday(hostMemberId);
			}
		}
		minihome=minihomeService.getMinihome(hostMemberId);
		List<Music> musicList=jukeboxService.getMyMusicOnAlbum(hostMemberId,"배경음악");
		
		request.setAttribute("loginMember",loginMember);
		request.setAttribute("hostMember",hostMember);
		request.setAttribute("minihome",minihome);
		request.setAttribute("musicList",musicList);
		
		request.getRequestDispatcher("/views/minihome/minihome.jsp").forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
