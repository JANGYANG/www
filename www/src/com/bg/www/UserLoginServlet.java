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
 * Servlet implementation class UsreLoginServlet
 */
@WebServlet("/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		
		UserJson loginJson = login(email, password);
		

		Gson gson = new Gson();
		if (loginJson.isError()) {
			response.getWriter().write(gson.toJson(loginJson));
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("userUID", loginJson.getUserUID());
			session.setAttribute("userName", loginJson.getName());
			session.setAttribute("teamUID", loginJson.getTeamUID());
			System.out.println("session user UID : " + loginJson.getUserUID());
			response.getWriter().write(gson.toJson(loginJson));
//			response.sendRedirect("./soccer");
		}
	}
	
	
	public UserJson login(String email, String password) {
		UserDAO userDAO = new UserDAO();
		return userDAO.login(email, password);
	}

}
