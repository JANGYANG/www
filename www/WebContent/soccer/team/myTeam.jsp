<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
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
<body style="margin-bottom:1000px;">

<%= teamName %>
<%= userUid %>

<%
  if (userUid != null){
  if (teamName != null){
%>
  <section class="container content-section center" >
    <div class="container">
       <div class="row">
         <div class="col-lg-4 col-lg-offset-4 col-sm-6 col-sm-3">
           <%
           out.println("<h2>Comming Soon</h2>");
           out.println("<h3>Your Team is " + teamName + "</h3>");
           out.println("<h4>We are Ready for Team Data.</h4>");
           out.println("<h3>Thank you.</h3>");
           %>
           <div>구단 세부정보</div>
           <div>진행 리그</div>
           <div>설립연도</div>
           <div>리그 역사</div>
           <div>최근 경기 결과</div>
           <div>주요 인물</div>
           <div>유니폼</div>
           <div>경기장</div>

           
        </div>
      </div>
    </div>
  </section>
<%
  }else{
%>
  <section class="container content-section center">
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