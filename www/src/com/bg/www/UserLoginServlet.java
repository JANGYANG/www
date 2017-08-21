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
		
		
		Gson gson = new Gson();
		String json = login(email, password);
		UserJson loginJson = gson.fromJson(json, UserJson.class);
		
		if (loginJson.getError()) {
			response.getWriter().write(json);
		}else {
			response.getWriter().write(json);
			HttpSession session = request.getSession();
			session.setAttribute("userUid", loginJson.getUnique_id());
			session.setAttribute("userName", loginJson.getName());
			System.out.println("session user UID : " + loginJson.getUnique_id());
			response.sendRedirect("./soccer");
		}
	}
	
	
	public String login(String email, String password) {
		UserDAO userDAO = new UserDAO();
		return userDAO.login(email, password);
	}

}
