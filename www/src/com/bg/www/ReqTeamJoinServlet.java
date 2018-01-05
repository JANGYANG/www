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
 * Servlet implementation class ReqTeamJoinServlet
 */
@WebServlet("/servlet/ReqTeamJoinServlet")
public class ReqTeamJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		String teamUID = request.getParameter("teamUID");
		HttpSession session = request.getSession();
		String userUID = session.getAttribute("userUID").toString();
		
		TeamDAO teamDAO = new TeamDAO();
		TeamJson reqTeamJoin = teamDAO.reqTeamJoin(teamUID, userUID);
		Gson gson = new Gson();
		response.getWriter().append(gson.toJson(reqTeamJoin));
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		
		String captainUID = session.getAttribute("userUID").toString();
		
		
		String teamUID = request.getParameter("teamUID");
		String userUID = request.getParameter("userUID");
		String confirm = request.getParameter("confirm");
		boolean ok;
		TeamDAO teamDAO = new TeamDAO();
		
		if(captainUID.equals(teamDAO.findByTeamUID(teamUID).getCaptainUID())) {
			response.sendRedirect(request.getContextPath());
		}
		
		if(confirm.equals("1")) {
			ok = teamDAO.reqTeamJoin(teamUID, userUID, true);	
		}else {
			ok = teamDAO.reqTeamJoin(teamUID, userUID, false);
		}
		
		if(ok) {
			response.sendRedirect(request.getContextPath() + "/notification");
		}else {
			response.sendRedirect(request.getContextPath());
		}
		
	}
	
	

}
