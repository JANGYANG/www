<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.PrintWriter" %>
<%
  request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=UTF-8");
	String userUid = (String)session.getAttribute("userUID");		/* 로그인했는지 세션값 지정 */
	String userName = (String)session.getAttribute("userName");	/* 로그인했는지 세션값 지정 */
%>

<!DOCTYPE html>
<html>
<head>
	<title>AnyBALL</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/materialize.css"  media="screen,projection"/>
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.js"></script>
  <script src="<%=request.getContextPath() %>/assets/js/materialize.min.js"></script>
</head>

<body style="background-color:#5da2d4;">


<jsp:include page="/demo_site/headNav.jsp" flush="false" />

	  	<div class="center white-text" style="margin-top:100px">
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
		
		<div id="change-body">
			
		</div>
		

<jsp:include page="/demo_site/footNav.jsp" flush="false" />
</body>
<script>
  	$(function(){
  		$("#sbp").click(function(){
  			$('#sForm').attr('action','<%=request.getContextPath() %>/player/playerSearch.jsp');
  			$('#sIcon').text("person");
  			$('.sInput').attr('name',"userName");
  		});
  		$("#sbt").click(function(){
  			$('#sForm').attr('action','<%=request.getContextPath() %>/team/teamSearch.jsp');
  			$('#sIcon').text("people");
  			$('.sInput').attr('name',"teamName");
  		})
  	});
</script>

</html>