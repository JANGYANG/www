<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<aside>
<div class="fixed-action-btn toolbar">
	<a class="btn-floating btn-large red" >
	  <i class="large material-icons">mode_edit</i>
	</a>
	<ul>
	<%if(session.getAttribute("userUID") != null){%>
		<li><a href="<%= request.getContextPath() %>/player/myPlayer.jsp">PLAYER</a></li>
		<li><a href="<%= request.getContextPath() %>/team/">TEAM</a></li>
		<li><a href="<%= request.getContextPath() %>/notification/">NOTICE</a></li>
		<li><a href="<%= request.getContextPath() %>/UserLogoutServlet">LOGOUT</a></li>
	<%} 
	else{%>
		<li><a href="<%= request.getContextPath() %>/login/index.jsp">LOGIN</a></li>
		<li><a href="<%= request.getContextPath() %>/register/signup.jsp">SIGN UP</a></li>
	<%} %>
	</ul>
</div>
</aside>