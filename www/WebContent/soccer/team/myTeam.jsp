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
  if (userUid != null){
  if (teamName != null){
		TeamDAO teamDAO = new TeamDAO();
		Gson gson = new Gson();
		TeamJson team = new TeamJson();
		team = teamDAO.viewTeam(teamName);
		UserDAO userDAO = new UserDAO();
		UserJson user = new UserJson();
		user = userDAO.findByUserUID(team.getCaptainUid());
		RegionJson uR1 = gson.fromJson(user.getRegionA(), RegionJson.class);
		RegionJson uR2 = gson.fromJson(user.getRegionB(), RegionJson.class);

%>

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