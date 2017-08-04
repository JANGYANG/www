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
		System.out.println("email" + email);
		String password = request.getParameter("password");
		System.out.println("password " + password);
		String name = request.getParameter("name");
		System.out.println("name " + name);
		Gson gson = new Gson();
		String json = "";
		
		if (password == null) {
			try{
				json = register(email);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else {
			try {
				json = register(email, password, name);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		UserJson registerJson = new UserJson();
		registerJson = gson.fromJson(json, UserJson.class);
		
		response.getWriter().write(json);
		
		
	}
	
	
	public String register(String email, String password,String name) throws Exception {
		System.out.println("register servlet register function is runed");
		UserDAO userDAO = new UserDAO();
		return userDAO.register(email, password, name);
	}
	
	public String register(String email) throws Exception {
		System.out.println("register servlet register function is runed");
		UserDAO userDAO = new UserDAO();
		return userDAO.register(email);
	}


}
