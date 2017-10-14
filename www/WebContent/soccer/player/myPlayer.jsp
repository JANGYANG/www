<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="com.bg.www.*"%>
<%@page import="com.google.gson.Gson"%>
<%
String userUid = (String)session.getAttribute("userUid");
String userName = (String)session.getAttribute("userName");
String teamName = (String)session.getAttribute("teamName");
UserDAO userDAO = new UserDAO();
UserJson user = userDAO.findByUserUID(userUid);
Gson gson = new Gson();
RegionJson regionA = gson.fromJson(user.getRegionA(), RegionJson.class);
RegionJson regionB = gson.fromJson(user.getRegionB(), RegionJson.class);

MatchDAO matchDAO = new MatchDAO();
ArrayList<MatchJson> matchList = new ArrayList<MatchJson>();
if(teamName != null){
matchList = matchDAO.listMatch(teamName, userUid);
}

%>

<!DOCTYPE html>
<html>
<head>
<!--Import Google Icon Font-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!--Import materialize.css-->
<link type="text/css" rel="stylesheet"
	href="../../css/materialize.min.css" media="screen,projection" />
<link type="text/css" rel="stylesheet" href="../../css/main.css"
	media="screen,projection" />

<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- Compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.1/css/materialize.min.css">

<!-- Compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.1/js/materialize.min.js"></script>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script type="text/javascript" src="../../js/materialize.min.js"></script>
<script type="text/javascript" src="../../js/main.js"></script>

<!-- select2 -->

<script type="text/javascript" src="../../js/registerUserInfo.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Broken-glasses</title>
</head>
<body class="blue lighten-4">
<%if (userUid == null){%>
	<section class="container content-section center">
		<div class="container">
			<div class="row">
				<div class="col m4 offset-m4 s6 offset-s3">
					<h4>Login First</h4>
					<h3>Please</h3>
					<a href="../login/"><button
							class="btn waves-effect waves-light">LOGIN</button></a>
				</div>
			</div>
		</div>
	</section>
	<%
}else{ %>
	<div class="container">
		<div class="row">
			<div class="col s12 m8 offset-m2">
				<h3 class="header">Player</h3>
				<div class="card horizontal">
					<div class="card-image">
						<img class="circle responsive-img" src="../../img/player.png" style="border-radius:50%">
					</div>
					<div class="card-stacked">
						<div class="card-content">
							<h1><%= user.getName() %></h1>
							<h5><%= user.getBirth() %></h5>
							<h5><%= user.getPosition().toUpperCase() %></h5>
							<h5>
								<% if( user.getTeamName() == null ){out.print("무소속");}else{%>
								<a href="../team/teamView.jsp?teamName=<%=teamName%>"><%=teamName%></a>
								<%}%>
							</h5>
<%-- 							<h5><%= regionA.getGugun() %>
								<%= regionA.getSido() %></h5>
							<h5><%= regionB.getGugun() %>
								<%= regionB.getSido() %></h5>
 --%>						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col m3"><h3>참가 게임</h3></div>
			<div class="col m3"><h3>평균 평점</h3></div>
			<div class="col m3"><h3>득 점</h3></div>
			<div class="col m3"><h3>어시스트</h3></div>
		</div>
		<div class="row">
			<div class="col m3"><h3>37 경기</h3></div>
			<div class="col m3"><h3>7.77 점</h3></div>
			<div class="col m3"><h3>7 골</h3></div>
			<div class="col m3"><h3>7 개</h3></div>
		</div>
	
		<div class="row">
		<h3 style="text-align:center">참가 경기</h3>
		</div>
		<%for(int i = 0; i<matchList.size(); i++){%>
		<div class="row" style="text-align: center;">
			<div class="col m2 s3 offset-m2">
				<div class="valign-wrapper">
					<a href="../team/teamView.jsp?teamName=<%=matchList.get(i).getHomeTeamID()%>">
						<img src="../../img/logo_CI.png" width="80%">
						<h6><%=matchList.get(i).getHomeTeamID() %></h6>
					</a>
				</div>
			</div>
			<div class="col m4 s6">
				<h6><%= matchList.get(i).getMatchDate() %></h6>
				<h6><%= matchList.get(i).getStadium() %></h6>
				<div class="row">
					<div class="col m4 s4">
						<h4 style="margin: unset; text-align: right"><%= matchList.get(i).getHomeScore() %></h4>
					</div>
					<div class="col m4 s4">
						<h4 style="margin: unset;">vs</h4>
					</div>
					<div class="col m4 s4">
						<h4 style="margin: unset; text-align: left"><%= matchList.get(i).getAwayScore() %></h4>
					</div>
					<p><%=matchList.get(i).getMatchType() %>쿼터
						<%=matchList.get(i).getPlayingTime() %>
						분
					</p>
				</div>
			</div>
			<div class="col m2 s3">
				<div class="valign-wrapper">
					<a
						href="../team/teamView.jsp?teamName=<%=matchList.get(i).getAwayTeamID()%>">
						<img src="../../img/logo_CI.png" width="80%">
						<h6><%=matchList.get(i).getAwayTeamID() %></h6>
					</a>
				</div>
			</div>
		</div>
		<%} %>
	</div>
	
	
	
	<%} %>


</body>
</html>