package com.bg.www;

import java.io.IOException;
import java.util.ArrayList;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import com.bg.www.UserJson.Region;
import com.google.gson.Gson;

/**
 * Servlet implementation class UserRegisterServlet
 */
@WebServlet("/servlet/UserRegisterServlet")
public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		System.out.println(request.getContentType());

		boolean apiMode = (request.getContentType().equals("application/json")) ? true : false;
		UserJson user = new UserJson();
		Gson gson = new Gson();
	
		if(apiMode) {
			System.out.println("apiMode");
		
			String json = request.getReader().lines().collect(Collectors.joining());
			user = gson.fromJson(json, UserJson.class);
		}else {
			System.out.println("webMode");
			
			user.setEmail(request.getParameter("email"));
			user.setPassword(request.getParameter("password"));
			user.setName(request.getParameter("userName"));
			
			user.setBirth(request.getParameter("userBirth"));
			try {
				user.setHeight(Integer.parseInt(request.getParameter("height")));
				user.setWeight(Integer.parseInt(request.getParameter("weight")));
			}catch(Exception e) {
			}
			user.setJob(request.getParameter("job"));
		}
		
		System.out.println("email " + user.getEmail());
		System.out.println("password " + user.getPassword());
		System.out.println("birth " + user.getBirth());
		System.out.println("height " + user.getHeight());
		System.out.println("weight " + user.getWeight());
		
		if(user.getBirth() != null) {
//			추가 회원 정보 입력
			try {
				if(apiMode) {
					String[] position = request.getParameter("position").split(",");
					String[] mainRegion = request.getParameterValues("mainRegion[]");
					String[] subRegion = request.getParameterValues("subRegion[]");
					
					for(String pos : position) {
						user.setPosition(pos);
					}
					for(int i = 0; i < mainRegion.length; i++) {
						user.setRegion(mainRegion[i], subRegion[i]);
					}
				}
				
				System.out.println("UserInfo Process is Runned");
				user = register((String)request.getSession().getAttribute("userUID"), user.getBirth(), 
						user.getRegion(), user.getHeight(), user.getWeight(), user.getPosition(), user.getJob());
				if (!user.isError())
				{
					response.sendRedirect(request.getContextPath());
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(user.getPassword() != null) {
//			회원등록
			try {
				System.out.println("Register Process");
				user = register(user.getEmail(), user.getPassword(), user.getName());
				if (!user.isError())
				{
					if(apiMode) {
						response.getWriter().write(gson.toJson(user));
					}else {
						response.sendRedirect(request.getContextPath());
					}
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(!user.getEmail().isEmpty()) {
			try{
				System.out.println("EmailCheck Process");
				user = register(user.getEmail());
				response.getWriter().write(gson.toJson(user));
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
	
	public UserJson register(String email, String password,String name) throws Exception {
		UserDAO userDAO = new UserDAO();
		System.out.println("register servlet register function is runed");
		return userDAO.register(email, password, name);
	}
	
	public UserJson register(String email) throws Exception {
		UserDAO userDAO = new UserDAO();
		System.out.println("register servlet register function for emailCheck is runed");
		return userDAO.register(email);
	}

	public UserJson register(String user_uid,String birth, ArrayList<Region> region, int height, int weight, ArrayList<String> position,String job){
		UserDAO userDAO = new UserDAO();
		System.out.println("register servlet register function for userInfo is runed");
		return userDAO.register(user_uid, birth, region, height, weight, position, job);
	}
}
