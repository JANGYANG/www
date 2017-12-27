<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/materialize.css"  media="screen,projection"/>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/assets/js/materialize.js"></script>
	
	<title>FIND_B</title>
	
	
</head>
<body style="background-color:#5da2d4" >
<jsp:include page="/headNav.jsp" flush="false" />

	  	<div class="center" style="margin-top:100px">
	  		<h1>FIND_B</h1>
	  	</div>
	  	<div class="container">
		  	<div class="row">
	  			<div class="col m10 offset-m1 input-field">
	  			<form id="sForm" action='./player/playerSearch.jsp' method="GET">
					<i id="sIcon" class="material-icons prefix dropdown-button" data-activates="dropdown2">person</i>
         	<input name="userName" id="icon_prefix" class="sInput" type="text" class="validate" style="border-bottom:1px solid #fff;width:80%;">
         	<label for="icon_prefix" style="color:white">Search</label>
         	<button class="btn">찾기</button>
         </form>
          <ul id='dropdown2' class='dropdown-content'>
				    <li><a id="sbp" href="#!"><i class="material-icons">person</i>Search by Person</a></li>
				    <li><a id="sbt" href="#!"><i class="material-icons">people</i>Search by Team</a></li>
				  </ul>
	  			</div>
	  		</div>
	  	</div>
<jsp:include page="/footNav.jsp" flush="false" />

		
	
</body>


	</html>