<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@page import="com.bg.www.*" %>
<%@page import="com.google.gson.Gson" %>
<%
String userUid = (String)session.getAttribute("userUid");
String userName = (String)session.getAttribute("userName");
String teamName = (String)session.getAttribute("teamName");
MatchDAO matchDAO = new MatchDAO();
ArrayList<MatchJson> matchList = new ArrayList<MatchJson>();
matchList = matchDAO.listMatch(teamName);
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
<body class="blue lighten-4">
<%
  if (userUid != null){
  if (teamName != null){
		TeamDAO teamDAO = new TeamDAO();
		Gson gson = new Gson();
		TeamJson team = new TeamJson();
		team = teamDAO.viewTeam(teamName);
		UserDAO userDAO = new UserDAO();
		UserJson user = new UserJson();
		user = userDAO.findByUserUID(team.getCaptainUid());
		RegionJson regionA = gson.fromJson(user.getRegionA(), RegionJson.class);
		RegionJson regionB = gson.fromJson(user.getRegionB(), RegionJson.class);

%>
<div class="container">
	<div class="row">
		<div class="col s12 m8 offset-m2" style="text-align:center">
			<h3 class="header">TEAM</h3>
			<div class="card">
				<div class="card-content">
					<img class="circle" src="../../img/logo_CI.png" style="width:50%;height:auto;padding:5%">
					<h4><%= team.getTeamName() %></h4>
					<h5><%= team.getTeamBirth() %></h5>
					<h5><%= regionA.getGugun() %>
							<%= regionA.getSido() %></h5>
					<h5><%= regionB.getGugun() %>
							<%= regionB.getSido() %></h5>
				</div>
			</div>
		</div>
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
</div>



<!-- 희융이가 만든 부분 -->
<%-- 
<div class="container">
   <div class="row center">
   	  <h3 class="center">MY TEAM</h3>
	  <div class="col s12 m6">
	    <h2 class="header">구단 세부 정보</h2>
	    <div class="card horizontal">
	      <div class="card-image">
	        <img width='50%;' height="auto" src="<%= request.getContextPath() %>/img/1.png">
	      </div>
	      <div class="card-stacked">
	        <div class="card-content center">
	          <p>구단 이름 : <%= team.getTeamName() %></p>
	          <p>주장 : <%= user.getName() %></p>
	          <p>설립립연도 : <%= team.getTeamBirth() %></p>
	          <p>전적 : $승 $패 $무</p>
	          <p>진행중인 리그 : </p>
	          <p>선호 지역</p>
	          <div>지역 A: <%= uR1.getSido() %>-<%= uR1.getGugun() %></div>
	          <div>지역 B: <%= uR2.getSido() %>-<%= uR2.getGugun() %></div>
	        </div>
	        <div class="card-action">
	          <a href="#">지역 변경하기</a>
	        </div>
	      </div>
	    </div>
	  </div>
        <div class="col l5 m5 s12 z-depth-3">
        <div >최근 경기 결과</div>
	      <table>
	        <thead>
	          <tr>
	              <th>날짜</th>
	              <th>상대팀</th>
	              <th>스코어</th>
	              <th>결과</th>
	          </tr>
	        </thead>
	
	        <tbody>
	          <tr>
	            <td>Alvin</td>
	            <td>Eclair</td>
	            <td>$0.87</td>
	            <td></td>
	          </tr>
	          <tr>
	            <td>Alan</td>
	            <td>Jellybean</td>
	            <td>$3.76</td>
	            <td></td>
	          </tr>
	          <tr>
	            <td>Jonathan</td>
	            <td>Lollipop</td>
	            <td>$7.00</td>
	            <td></td>
	          </tr>
	        </tbody>
	      </table>
      </div>
		
  </div>
  <div>탈퇴하기</div>
</div>
 --%>

<%
  }else{
%>
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




<!-- 팀이 가입되지 않았을 떄 -->
<!-- <div class="container">
	<div class="row">
		<a href="./teamMake.jsp"><button class="btn">팀만들기</button></a>
		<a href="./teamSearch.jsp"><button class="btn">팀찾기</button></a>
	</div>
</div>
 -->
</body>   
</html>