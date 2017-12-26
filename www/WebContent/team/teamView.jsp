<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@page import="com.bg.www.*" %>
<%@page import="com.google.gson.Gson" %>
<%
String userUID = (String)session.getAttribute("userUID");
String userName = (String)session.getAttribute("userName");
String teamUID = (String)request.getParameter("teamUID");
TeamDAO teamDAO = new TeamDAO();
TeamJson team =  teamDAO.searchByTeamUID(teamUID);
UserDAO userDAO = new UserDAO();
UserJson user = userDAO.findByUserUID(userUID);
UserJson captain = userDAO.findByUserUID(team.getCaptainUID());
%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
		<title>TeamView<%=team.getTeamName() %></title>

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
		<div class="col s12 m8 offset-m2" style="text-align:center">
			<h3 class="header">TEAM</h3>
			<div class="card">
				<div class="card-content">
					<img class="circle" src="<%=request.getContextPath() %>/assets/img/logo_CI.png" style="width:50%;height:auto;padding:5%">
					<h4><%= team.getTeamName() %></h4>
					<h5>창단년도 : <%= team.getTeamBirth() %></h5>
					<h5>주장 : <%= captain.getName() %></h5>
					<%if(user.getTeamUID() == null){%>
							<button id="btnReqJoin" class="btn">가입신청</button>
						<%}else if(true){%>
							<button class="btn">신청완료</button>
						<%} %>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col m4 offset-m2">
			<div class="collection">
				<%for(int i = 0; i < team.getRegion().size(); i++){ %>
					<p class="collection-item"><%=team.getRegion().get(i).getMainRegion() %>  <%=team.getRegion().get(i).getSubRegion() %></p>
				<% }%>	
			</div>	
		</div>
		<div class="col m4">
			<div class="collection">
				<%for(int i = 0; i < team.getFormation().size(); i++){ %>
					<p class="collection-item"><%=team.getFormation().get(i)%></p>
				<% }%>	
			</div>	
		</div>
	</div>
</div>
<script>
$(function(){
	$("#btnReqJoin").click(function(){
		var form = document.createElement('form');
		var objs;
		objs = document.createElement('input');
		objs.setAttribute('type', 'hidden');
		objs.setAttribute('name', 'teamUID');
		objs.setAttribute('value', '<%=teamUID%>');
		form.appendChild(objs);
		form.setAttribute('method', 'post');
		form.setAttribute('action', "/www/ReqTeamJoinServlet");
		document.body.appendChild(form);
		form.submit();
	});
});
</script>
</body>   
</html>