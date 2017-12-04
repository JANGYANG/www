<%@ page import="java.util.*" %>
<%@page import="com.bg.www.*"%>
<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String userUID = (String)session.getAttribute("userUID");
UserDAO userDAO = new UserDAO();
UserJson user = userDAO.findByUserUID(userUID);

if(user.getName() == null ){
	response.sendRedirect(request.getContextPath()+"/soccer/login/");
}
%>
<!DOCTYPE html>
<html>
	<head>
      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<title>Broken-glasses</title>

			<!--Import Google Icon Font-->
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/css/materialize.min.css"  media="screen,projection"/>
      <link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/css/main.css"  media="screen,projection"/>
		
      
	
	  
	   <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	   
	   <script type="text/javascript" src="../../js/materialize.min.js"></script>
	   <script type="text/javascript" src="../../js/main.js"></script>
	
	</head>
<body>
<%if(user.getTeamUID() == null){ %>
<div class="container content-section center" >
	<div class="row">
		<h3 class="black-text">아직도 팀이 없으신가요?</h3>
		<div class="col m5 offset-m1 s10 offset-s1">
			<a href="./teamMake.jsp"><button class="btn blue darken-2" style="width:100%">팀만들기</button></a>
		</div>
		<div class="col m5 s10 offset-s1">  
			<a href="./teamSearch.jsp"><button class="btn blue darken-2" style="width:100%">팀찾기</button></a>
		</div>
	</div>
</div>
<% }else{
		response.sendRedirect( request.getContextPath()+"/soccer/team/myTeam.jsp");
	}
	%>	
	
</body>   
</html>