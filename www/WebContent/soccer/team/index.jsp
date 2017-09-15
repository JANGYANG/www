<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<!-- 팀이 가입되지 않았을 떄 -->
<%if(teamName == null){ %>
<div class="container center" >
	<div style="margin-top:100px">
	<h3 class="black-text">아직도 팀이 없으신가요?</h3>
	</div>
	<div style="margin-top:150px; top:50%;">
		<a href="./teamMake.jsp"><button class="btn blue darken-2" >팀만들기</button></a>      
          <div class="input-field col s6 s12 blue-text text-darken-2">
          <a href="./teamSearch.jsp"><button class="btn blue darken-2" >팀찾기</button></a>
          </div>
	</div>
</div>
<% } %>
<!-- 팀이 가입되어 있을때 -->

<div class="container">
	<%if(teamName != null){
		response.sendRedirect( request.getContextPath()+"/soccer/team/myTeam.jsp");
	}
	%>	
</div>


<script>

</script>

</body>   
</html>