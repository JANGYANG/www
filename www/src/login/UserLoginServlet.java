package login;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import teamSearch.TeamDAO;
import teamSearch.Teams;

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
		
		response.getWriter().write(getJSON(email,password));
	}
	
	
	public String getJSON(String email, String password) {
		if (email == null) email = "";
		StringBuffer result = new StringBuffer("");
		UserDAO userDAO = new UserDAO();
		
		return result.toString();
	}

}
