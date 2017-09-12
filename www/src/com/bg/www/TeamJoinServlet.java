package com.bg.www;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class TeamJoinServlet
 */
@WebServlet("/TeamJoinServlet")
public class TeamJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		String teamName = (String)request.getParameter("teamName");
		String userUID = (String)session.getAttribute("userUid");
		
		UserDAO userDAO = new UserDAO();
		if ( userDAO.teamJoin(teamName, userUID) ) {
			session.setAttribute("teamName", teamName);
			response.sendRedirect("./soccer/team/myTeam.jsp");
		}else {
			response.sendRedirect("./soccer/team/teamSearch.jsp");
		}
	}

}
