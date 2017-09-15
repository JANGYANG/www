<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@page import="com.bg.www.TeamDAO" %>
<%@page import="com.bg.www.TeamJson" %>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.bg.www.UserDAO" %>
<%@page import="com.bg.www.UserJson" %>
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
<body>
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
		
  	
%>

<div class="container">
   <div class="row">
   	  <h5 class="center">구단 세부 정보</h5>
      <div class="col l3 m3 s6">
      	<img width='100%;' height="auto" src="<%= request.getContextPath() %>/img/1.png">
      </div>
      <div class="col l3 m3 s6">
      	<div>구단 이름 : <%= team.getTeamName() %></div>
      	<div>주장 : <%= user.getName() %></div>
      	<div>설립연도 : <%= team.getTeamBirth() %></div>
      	<div>전적 : $승 $패 $무 </div>
      	<div>진행중인 리그 : </div>
      	 <div>선호 지역</div>
        <div><%= team.getRegionA() %></div>
        <div><%= team.getRegionB() %></div>
        <div>변경하기</div>
      </div>
      <div class="col l6 m6 s12">
        <div >최근 경기 결과</div>
	      <table class="bordered">
	        <thead>
	          <tr>
	              <th>Name</th>
	              <th>Item Name</th>
	              <th>Item Price</th>
	          </tr>
	        </thead>
	
	        <tbody>
	          <tr>
	            <td>Alvin</td>
	            <td>Eclair</td>
	            <td>$0.87</td>
	          </tr>
	          <tr>
	            <td>Alan</td>
	            <td>Jellybean</td>
	            <td>$3.76</td>
	          </tr>
	          <tr>
	            <td>Jonathan</td>
	            <td>Lollipop</td>
	            <td>$7.00</td>
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