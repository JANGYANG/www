package com.bg.www;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

/**
 * Servlet implementation class TeamRegisterServlet
 */
@WebServlet("/TeamRegisterServlet")
public class TeamRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String teamName = request.getParameter("teamName");
		String regionA = request.getParameter("region1");
		String regionB = request.getParameter("region2");
		String teamBirth = request.getParameter("teamBirth");
		
		String json = "";
		
		if (teamName != null && regionA == null) {
			json = registerTeam(teamName);
			response.getWriter().write(json);
		}else {
			HttpSession session = request.getSession();
			String userUid = (String)session.getAttribute("userUid");
			System.out.println("userUid : " + userUid);
			json = registerTeam(teamName, regionA, regionB, teamBirth, userUid);
			TeamJson teamJson = new TeamJson();
			Gson gson = new Gson();
			teamJson = gson.fromJson(json, TeamJson.class);
			if(!teamJson.isError()) {
				request.setAttribute(teamName, teamJson.getTeamName());
				response.sendRedirect("./soccer/");
			}
			response.getWriter().write(json);
		}
	
	}
	
	public String registerTeam(String teamName) {
		TeamDAO teamDAO = new TeamDAO();
		System.out.println("TeamNameCheck Function in servlet is runned");
		return teamDAO.registerTeam(teamName);
	}
	public String registerTeam(String teamName, String regionA, String regionB, String teamBirth, String captainUid) {
		TeamDAO teamDAO = new TeamDAO();
		System.out.println("TeamNameCheck Function in servlet is runned");
		return teamDAO.registerTeam(teamName, regionA, regionB, teamBirth, captainUid);
	}
}
