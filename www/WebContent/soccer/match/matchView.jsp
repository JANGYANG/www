<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.bg.www.*" %>

<%
MatchDAO matchDAO = new MatchDAO();
MatchJson match = new MatchJson();
match = matchDAO.findByMatchID(request.getParameter("matchID").toString());
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
<body>
	<div class="container">
		<div	 class="row" style="text-align:center">
			<div class="col m4 offset-m4 s12">
				<img width="50%" src="../../img/logo_CI.png"/>
				<h2 class="center-align">MATCH<h2>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row" style="text-align:center;">
			<div class="col m8 offset-m2 s12">
				<div class="card">
					<div class="card-content">
					
					<div class="row valign-wrapper" style="margin-bottom:0px;">

								<div class="col m3 s3">
									<div class="valign-wrapper">
										<a href="../team/teamView.jsp?teamName=<%=match.getHomeTeamID()%>">
											<img src="../../img/logo_CI.png" width="80%">
											<h6><%=match.getHomeTeamID() %></h6>
										</a>
									</div>
								</div>
								<div class="col m6 s6">
									<h6><%= match.getMatchDate() %></h6>
									<div class="row">
										<div class="col m4 s4" ><h4 style="margin:unset;text-align:right"><%= match.getHomeScore() %></h4></div>
										<div class="col m4 s4" ><h4 style="margin:unset;">vs</h4></div>
										<div class="col m4 s4" ><h4 style="margin:unset;text-align:left"><%= match.getAwayScore() %></h4></div>					
										<p><%=match.getMatchType() %>쿼터 <%=match.getPlayingTime() %> 분
										<br><%= match.getStadium() %>
										</p>
									</div>
								</div>
								<div class="col m3 s3">
									<div class="valign-wrapper">
										<a href="../team/teamView.jsp?teamName=<%=match.getAwayTeamID()%>">
											<img src="../../img/logo_CI.png" width="80%">
											<h6><%=match.getAwayTeamID() %></h6>
										</a>
									</div>
								</div>
							
							</div>
					
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col m6 s12">
				<div class="card">
					<div class="card-content">
					</div>
				</div>
			</div>
			<div class="col m6 s12">
				<div class="card">
					<div class="card-content">
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>