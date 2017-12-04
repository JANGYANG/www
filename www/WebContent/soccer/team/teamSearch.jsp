<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="com.bg.www.*" %>
<%@page import="com.google.gson.Gson" %>
<%
	TeamDAO teamDAO = new TeamDAO();
	ArrayList<TeamJson> teamList = teamDAO.searchByN(request.getParameter("teamName"));
%>
<!DOCTYPE html>
<html lang="kor">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Broken-glasses</title>

	<!--Import Google Icon Font-->
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<!--Import materialize.css-->
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/css/materialize.min.css" media="screen,projection" />
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/css/main.css" media="screen,projection" />
	
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/materialize.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/main.js"></script>
	<!-- select2 -->
	<script type="text/javascript" src="../../js/registerTeam.js"></script>
	<style>
		select {
			display: inherit;
		}
	</style>
</head>

<body>
  <div class="container">
    <div class="row">
      <div class="center">
        <img src="<%=request.getContextPath() %>/img/logo_CI.png" alt="LOGIN" title="BG" style="width:20%"></img>
        <h4 style="text-align:center">SEARCH TEAM</h4>
      </div>
    </div>
  </div>
	<div class="container">
		<div class="row">
			<form action="">
	  			<div class="col m8 offset-m2 input-field">
					<i class="material-icons prefix dropdown-button" data-activates="dropdown2">person</i>
	         <input id="icon_prefix" name="teamName"type="text" class="validate">
	         <label for="icon_prefix">Search</label>
	         <ul id='dropdown2' class='dropdown-content'>
				    <li><a href=""><i class="material-icons">person</i>Name</a></li>
				    <li><a href=""><i class="material-icons">people</i>Region</a></li>
				  </ul>
	  			</div>
  			</form>
  		</div>
	</div>
	
<%
for(int i = 0; i<teamList.size(); i++){ %>
	<a href="<%=request.getContextPath()%>/soccer/team/teamView.jsp?teamUID=<%=teamList.get(i).getTeamUID()%>"><%= teamList.get(i).getTeamName() %>	</a>
<%}%>


</body>
