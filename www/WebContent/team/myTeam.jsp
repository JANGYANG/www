<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@page import="com.bg.www.*" %>
<%@page import="com.google.gson.Gson" %>
<%
String userUID = (String)session.getAttribute("userUID");
UserDAO userDAO = new UserDAO();
UserJson user = userDAO.findByUserUID(userUID);
TeamJson team = new TeamJson();
UserJson captain = new UserJson();
ArrayList<UserJson> userList = new ArrayList<UserJson>();

if(user.getTeamUID() != null){
	TeamDAO teamDAO = new TeamDAO();
	team = teamDAO.searchByTeamUID(user.getTeamUID());
	captain = userDAO.findByUserUID(team.getCaptainUID());
	userList = userDAO.findByTeamUID(team.getTeamUID());
}
%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<title>My TEAM - <%=team.getTeamName() %></title>
	
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/materialize.css"  media="screen,projection"/>
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/main.css"  media="screen,projection"/>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/materialize.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/main.js"></script>
</head>
<body class="blue lighten-4">
<%
if (userUID != null){
	if (user.getTeamUID() != null){
%>
<!-- 팀이 있을경우 -->
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
	
		<div class="row">
		<div class="col m4 offset-m2">
			<div class="collection">
				<%for(int i = 0; i < userList.size(); i++){ %>
					<p class="collection-item"><%=userList.get(i).getName() %></p>
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
<%
  }else{
%>
<!-- 팀가입이 되어 있지 않은경우 -->
  <section class="container">
    <div class="container">
       <div class="row">
         <div class="col-lg-4 col-lg-offset-4 col-sm-6 col-sm-3">
           <h4>YOU HAVE NO TEAM</h4>
           <a href="./teamMake.jsp"><button type="submit" class="btn waves-effect waves-light" style="width:100%;">Make Team</button></a>
           <h3 style="margin-top:5%;margin-bottom:5%;">Or</h3>
           <a href="./teamSearch.jsp"><button class="btn waves-effect waves-light" style="width:100%;">Search your Team</button></a>
        </div>
      </div>
    </div>
  </section>
<%
  }
}else{
%>
<!-- 로그인이 되어 있지 않은 경우 -->
  <section class="container content-section center">
    <div class="container">
       <div class="row">
         <div class="col-lg-4 col-lg-offset-4 col-sm-6 col-sm-3">
           <h4>Login First</h4>
           <h3>Please</h3>
           <a href="../login/"><button class="btn waves-effect waves-light">LOGIN</button></a>
        </div>
      </div>
    </div>
  </section>
<%
} %>
</body>   
</html>