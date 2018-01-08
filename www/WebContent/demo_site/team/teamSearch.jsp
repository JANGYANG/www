<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="com.bg.www.*" %>
<%@page import="com.google.gson.Gson" %>
<%
	TeamDAO teamDAO = new TeamDAO();
	ArrayList<TeamJson> teamList = teamDAO.findByN(request.getParameter("teamName"));
%>
<!DOCTYPE html>
<html lang="kor">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Search Team</title>

	<!--Import Google Icon Font-->
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<!--Import materialize.css-->
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/materialize.css" media="screen,projection" />
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/main.css" media="screen,projection" />
	
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	
	<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/materialize.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/main.js"></script>
</head>

<body>
  <div class="container">
    <div class="row">
      <div class="center">
        <img src="<%=request.getContextPath() %>/assets/img/logo_CI.png" style="width:20%"></img>
        <h4 style="text-align:center">SEARCH TEAM</h4>
      </div>
    </div>
  </div>
	<div class="container">
		<div class="row">
			<form action="" method="get">
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
	<div class="container">
		<%
		for(int i = 0; i<teamList.size(); i++){ %>
		<div class="collection">
			<p class="collection-item">
				<a  href="./teamView.jsp?teamUID=<%=teamList.get(i).getTeamUID()%>"><%= teamList.get(i).getTeamName() %></a>
			</p>
		</div>	
		<%}%>
	</div>

</body>
