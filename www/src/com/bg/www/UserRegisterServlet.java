package com.bg.www;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class UserRegisterServlet
 */
@WebServlet("/UserRegisterServlet")
public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		Gson gson = new Gson();
		String json = "";
		
		try {
			json = register(email, password, name);
		}catch(Exception e) {
			e.printStackTrace();
		}
		UserJson registerJson = gson.fromJson(json, UserJson.class);
		if (registerJson.getError() == false) {
			response.sendRedirect("/soccer");
		}else {
			response.getWriter().write(json);
		}
	}
	
	
	public String register(String email, String password,String name) throws Exception {
		System.out.println("register servlet register function is runed");
		UserDAO userDAO = new UserDAO();
		return userDAO.register(email, password, name);
	}


}
