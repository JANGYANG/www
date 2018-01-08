package com.bg.www;

import java.io.IOException;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/servlet/TestServlet")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		System.out.println(request.getContentType());

		boolean apiMode = (request.getContentType().equals("application/json")) ? true : false;
		UserJson user = new UserJson();
		Gson gson = new Gson();
	
		if(apiMode) {
			System.out.println("apiMode");
		
			String json = request.getReader().lines().collect(Collectors.joining());
			user = gson.fromJson(json, UserJson.class);
		}
		
		
		response.getWriter().write(gson.toJson(user));
		
	}

}
