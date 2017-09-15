<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.PrintWriter" %>
<%
    request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=UTF-8");
	String userUid = (String)session.getAttribute("userUid");		/* 로그인했는지 세션값 지정 */
	String userName = (String)session.getAttribute("userName");	/* 로그인했는지 세션값 지정 */
%>

<!DOCTYPE html>
<html>
<head>
<!--Import Google Icon Font-->
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/materialize.css"  media="screen,projection"/>
      
      <link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/main.css"  media="screen,projection"/>
		
      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
      
       <!-- Compiled and minified CSS -->
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.1/css/materialize.min.css">
	
	  <!-- Compiled and minified JavaScript -->
	  <!-- index페이지 jquery -->
	  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Broken-glasses</title>
</head>
<body>
	<div>
		<div id="change">
		
		</div>
	</div>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.1/js/materialize.min.js"></script>
   <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.js"></script>
   <script type="text/javascript" src="../js/materialize.js"></script>
   <script type="text/javascript" src="../js/main.js"></script>
	<script>
	$(document).ready(function(){
		$('#change').load('<%= request.getContextPath()%>/soccer/login');
	})
	</script>	  	
</body>
</html>