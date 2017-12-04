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
		String teamBirth = request.getParameter("teamBirth");
		String[] mainRegion = request.getParameterValues("mainRegion[]");
		String[] subRegion = request.getParameterValues("subRegion[]");
		String[] formation = request.getParameterValues("formation[]");

		TeamJson team = new TeamJson();

		if (teamBirth == null) {
//			팀이름 중복 체크
			team = registerTeam(teamName);
			Gson gson = new Gson();
			response.getWriter().write(gson.toJson(team));
		}else {
			HttpSession session = request.getSession();
			String userUID = (String)session.getAttribute("userUID");
			System.out.println("userUid : " + userUID);
			team = registerTeam(teamName, mainRegion, subRegion, teamBirth, userUID, formation);
			Gson gson = new Gson();
			if(!team.isError()) {
				session.setAttribute("teamUID", team.getTeamUID());
				session.setAttribute("teamName", team.getTeamName());
				response.sendRedirect("/");
			}
			response.getWriter().write(gson.toJson(team));
		}
	
	}
	
	public TeamJson registerTeam(String teamName) {
		TeamDAO teamDAO = new TeamDAO();
		System.out.println("TeamNameCheck Function in servlet is runned");
		return teamDAO.registerTeam(teamName);
	}
	public TeamJson registerTeam(String teamName, String mainRegion[], String subRegion[], String teamBirth, String captainUID, String[] formation){
		TeamDAO teamDAO = new TeamDAO();
		System.out.println("TeamNameCheck Function in servlet is runned");
		return teamDAO.registerTeam(teamName, mainRegion, subRegion, teamBirth, captainUID, formation);
	}
}
