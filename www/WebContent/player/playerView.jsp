<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@page import="com.bg.www.*" %>
<%@page import="com.google.gson.Gson" %>
<%
String userUID = (String)session.getAttribute("userUID");
String userName = (String)session.getAttribute("userName");
String playerUID = (String)request.getParameter("playerUID");
TeamDAO teamDAO = new TeamDAO();
UserDAO userDAO = new UserDAO();
UserJson user = userDAO.findByUserUID(playerUID);
TeamJson team =  teamDAO.findByTeamUID(user.getTeamUID());
%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
		<title>Player View<%=user.getName() %></title>

    	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  	  <!--Import materialize.css-->
  		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/materialize.css"  media="screen,projection"/>
    	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/main.css"  media="screen,projection"/>

	   <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	   
	   <script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/materialize.min.js"></script>
	   <script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/main.js"></script>
	</head>
<body class="blue lighten-4">
<div class="container">

	<div class="row">
		<div class="col m3 offset-m3">
			<div class="card" style="border-radius:10%;text-align:center;">
				<img src="<%=request.getContextPath() %>/assets/img/player.png" style="width:90%;border-radius:10%"></img>
			</div>
		</div>
		<div class="col m3">
			<div class="card" style="height:100%;border-radius:10%">
				NAME <%=user.getName() %>
				<p>BIRTH <%=user.getBirth() %></p>
				<p>JOB <%=user.getJob() %></p>
				<p>HEIGHT <%=user.getHeight() %></p>
				<p>WEIGHT <%=user.getWeight() %></p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col m4 offset-m2">
		  <p>소속 팀 : <% if (team.getTeamName() != null){
			  out.println(team.getTeamName());}else{
				  out.println("없음");
			  }%></p>
			  팀 아이디
			  <%=user.getTeamUID() %>
			  <%=teamDAO.findByTeamUID(user.getTeamUID()).getTeamName() %>
		</div>
	</div>
	<div class="row">
		<div class="col m4 offset-m2">
			<div class="collection">
				<%for(int i = 0; i < user.getRegion().size(); i++){ %>
					<p class="collection-item"><%=user.getRegion().get(i).getMainRegion() %>  <%=user.getRegion().get(i).getSubRegion() %></p>
				<% }%>	
			</div>	
		</div>
		<div class="col m4">
			<div class="collection">
				<%for(int i = 0; i < user.getPosition().size(); i++){ %>
					<p class="collection-item"><%=user.getPosition().get(i)%></p>
				<% }%>	
			</div>	
		</div>
	</div>
</div>
<%out.println(userUID); %>
<%=user.getName() %>
<%=user.getBirth() %>
<%=user.getJob() %>
</body>   
</html>