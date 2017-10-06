<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@page import="com.bg.www.TeamDAO" %>
<%@page import="com.bg.www.TeamJson" %>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.bg.www.UserDAO" %>
<%@page import="com.bg.www.UserJson" %>
<%@page import="com.bg.www.RegionJson" %>
<%
String userUid = (String)session.getAttribute("userUid");
String userName = (String)session.getAttribute("userName");
String teamName = (String)session.getAttribute("teamName");
UserDAO userDAO = new UserDAO();
UserJson user = userDAO.findByUserUID(userUid);
Gson gson = new Gson();
RegionJson regionA = gson.fromJson(user.getRegionA(), RegionJson.class);
RegionJson regionB = gson.fromJson(user.getRegionB(), RegionJson.class);
%>

<!DOCTYPE html>
<html>
<head>
<!--Import Google Icon Font-->
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="../../css/materialize.min.css"  media="screen,projection"/>
      <link type="text/css" rel="stylesheet" href="../../css/main.css"  media="screen,projection"/>
		
      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
      
       <!-- Compiled and minified CSS -->
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.1/css/materialize.min.css">
	
	  <!-- Compiled and minified JavaScript -->
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.1/js/materialize.min.js"></script>
	  
	   <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	   
	   <script type="text/javascript" src="../../js/materialize.min.js"></script>
	   <script type="text/javascript" src="../../js/main.js"></script>
	   
	   <!-- select2 -->

	  <script type="text/javascript" src="../../js/registerUserInfo.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Broken-glasses</title>
</head>
<body class="blue">
<%
  if (userUid == null){
%>
  <section class="container content-section center">
    <div class="container">
       <div class="row">
         <div class="col m4 offset-m4 s6 offset-s3">
           <h4>Login First</h4>
           <h3>Please</h3>
           <a href="../login/"><button class="btn waves-effect waves-light">LOGIN</button></a>
        </div>
      </div>
    </div>
  </section>
<%
}else{ %>
    <div class="container">
       <div class="row">
         <div class="col m8 offset-m2">
         	<div class="row">
						<div class="col m4 s4">
							<img alt="" src="../../img/1.png" width="100%">
						</div>
						<div class="col m8 s8">
							<h1><%= user.getName() %></h1>
							<h5><%= user.getBirth() %></h5>
							<h5><%= user.getPosition().toUpperCase() %></h5>
							<h5><%= user.getTeamName() %></h5>
							<h5><%= regionA.getGugun() %> <%= regionA.getSido() %></h5>
							<h5><%= regionB.getGugun() %> <%= regionB.getSido() %></h5>
						</div>
					</div>
        </div>
      </div>
    </div>
<%} %>
</body>   
</html>