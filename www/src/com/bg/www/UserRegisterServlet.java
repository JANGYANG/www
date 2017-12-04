package com.bg.www;

import java.io.IOException;

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
		String height = request.getParameter("height");
		String weight = request.getParameter("weight");
		String job = request.getParameter("job");
		
		
		UserJson user = new UserJson();

		
		
		System.out.println("email " + email);
		System.out.println("password " + password);
		System.out.println("birth " + birth);
		System.out.println("height " + height);
		System.out.println("weight " + weight);
		
		
		if (password == null && birth == null) {
//			이메일중복체크
			try{
				System.out.println("EmailCheck Process");
				user = register(email);
				Gson gson = new Gson();
				System.out.println(gson.toJson(user));
				response.getWriter().write(gson.toJson(user));
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(birth != null) {
			try {
				String[] position = request.getParameter("position").split(",");
				String[] mainRegion = request.getParameterValues("mainRegion[]");
				String[] subRegion = request.getParameterValues("subRegion[]");

				System.out.println("UserInfo Process is Runned");
				user = register((String)request.getSession().getAttribute("userUID"), birth, 
						mainRegion, subRegion, Integer.parseInt(height), Integer.parseInt(weight), position, job);
				if (!user.isError())
				{
					response.sendRedirect("./soccer/");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else {
//			회원등록
			try {
				System.out.println("Register Process");
				user = register(email, password, name);
//				Gson gson = new Gson();
//				response.getWriter().write();
//				userJson = gson.fromJson(json, UserJson.class);
				if (!user.isError())
				{
//					request.setAttribute("user_uid", user.getUserUID());
//					request.setAttribute("userName", name);
//					RequestDispatcher dispatcher = request.getRequestDispatcher("./soccer/register/userinfo.jsp");
//					dispatcher.forward(request, response);
					response.sendRedirect("./soccer/index.jsp");
				}
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

	public UserJson register(String user_uid,String birth, String[] mainRegion, String[] subRegion, int height, int weight, String[] position,String job){
		UserDAO userDAO = new UserDAO();
		System.out.println("register servlet register function for userInfo is runed");
		return userDAO.register(user_uid, birth, mainRegion, subRegion, height, weight, position, job);
	}
}
