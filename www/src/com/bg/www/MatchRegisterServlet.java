package com.bg.www;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MatchRegisterServlet
 */
@WebServlet("/MatchRegisterServlet")
public class MatchRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String homeOrAway = request.getParameter("homeOrAway");
		String opponentTeam = request.getParameter("opponentTeam"); 
		String stadium = request.getParameter("stadium");
		int homeScore = Integer.parseInt(request.getParameter("homeScore").toString()); 
		int awayScore = Integer.parseInt(request.getParameter("awayScore").toString()); 
		String matchType = request.getParameter("matchType"); 
		String matchDateYear = request.getParameter("matchDateYear");
		String matchDateMonth = request.getParameter("matchDateMonth");
		String matchDateDay = request.getParameter("matchDateDay");
		String matchDateHour = request.getParameter("matchDateHour");
		String matchDateMinute = request.getParameter("matchDateMinute");
		String matchDate = String.format("%s-%s-%s %s:%s:00", matchDateYear, matchDateMonth, matchDateDay,
				matchDateHour, matchDateMinute);
		int playingTime = Integer.parseInt(request.getParameter("playingTime").toString());
		String player = Arrays.toString(request.getParameterValues("player"));
		HttpSession session = request.getSession();
		MatchDAO matchDAO = new MatchDAO();
		
		String homeTeamID = new String();
		String awayTeamID = new String();

		if (Integer.parseInt(homeOrAway) == 1) {
			homeTeamID = session.getAttribute("teamName").toString();
			awayTeamID = opponentTeam;
		}else {
			awayTeamID = session.getAttribute("teamName").toString();
			homeTeamID = opponentTeam;
		}
		
		
		if(matchDAO.registerMatch(homeTeamID, awayTeamID, stadium, homeScore, awayScore, matchType, matchDate, playingTime, homeOrAway, player)) {
			response.sendRedirect("./soccer/match/");
		}else {
			response.sendRedirect("./soccer/match/registerMatch.jsp");
		}
	}

}
