package com.bg.www;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
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
		
		String birth = request.getParameter("birth");
		String region_a = request.getParameter("region1");
		String region_b = request.getParameter("region2");
		String height = request.getParameter("height");
		String weight = request.getParameter("weight");
		String position = request.getParameter("position");
//		String team_uid = request.getParameter("team_uid");
		
//		String user_uid = request.getParameter("user_uid");
		
		
		String json = "";
//		UserJson userJson = new UserJson(email, name, birth, region_a, region_b, height, weight, position, team_uid);
		UserJson userJson = new UserJson();

		
		
		System.out.println("email " + email);
		System.out.println("password " + password);
		System.out.println("name " + name);
		System.out.println("email " + email);
		System.out.println("password " + password);
		System.out.println("name " + name);
		
		
		if (password == null && birth == null) {
//			이메일중복체크
			try{
				System.out.println("EmailCheck Process");
				json = register(email);
				response.getWriter().write(json);
//				Gson gson = new Gson();
//				userJson = gson.fromJson(json, UserJson.class);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(birth != null) {
			try {
				System.out.println("UserInfo Process is Runned");
				json = register((String)request.getParameter("user_uid"), birth, region_a, region_b, Integer.parseInt(height), Integer.parseInt(weight), position);
				response.getWriter().write(json);
				Gson gson = new Gson();
				userJson = gson.fromJson(json, UserJson.class);
				if (!userJson.getError())
				{
					response.sendRedirect("./soccer/login/");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else {
			try {
				System.out.println("Register Process");
				json = register(email, password, name);
				response.getWriter().write(json);
				Gson gson = new Gson();
				userJson = gson.fromJson(json, UserJson.class);
				if (!userJson.getError())
				{
					request.setAttribute("user_uid", userJson.getUnique_id());
					request.setAttribute("userName", name);
					RequestDispatcher dispatcher = request.getRequestDispatcher("./soccer/register/userinfo.jsp");
					dispatcher.forward(request, response);
//					response.sendRedirect("./soccer/register/userinfo.jsp");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	
	public String register(String email, String password,String name) throws Exception {
		UserDAO userDAO = new UserDAO();
		System.out.println("register servlet register function is runed");
		return userDAO.register(email, password, name);
	}
	
	public String register(String email) throws Exception {
		UserDAO userDAO = new UserDAO();
		System.out.println("register servlet register function for emailCheck is runed");
		return userDAO.register(email);
	}

	public String register(String user_uid,String birth, String region_a, String region_b, int height, int weight, String position){
		UserDAO userDAO = new UserDAO();
		System.out.println("register servlet register function for userInfo is runed");
		return userDAO.register(user_uid, birth, region_a, region_b, height, weight, position);
	}
}
