package com.bg.www;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;


@WebServlet("/TeamSearchServlet")
public class TeamSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String teamName = request.getParameter("teamName");
		response.getWriter().write(searchByName(teamName));
	}
	
	public String searchByName(String teamName) {
		String json = "";
		if (teamName == null) teamName = "";
		TeamDAO teamDAO = new TeamDAO();
		Gson gson = new Gson();
		TeamJson[] teamList = gson.fromJson(teamDAO.searchByN(teamName), TeamJson[].class);
		json = gson.toJson(teamList).toString();
		System.out.println("teamJsonList = " + json);
		return json;
	}
	
}
