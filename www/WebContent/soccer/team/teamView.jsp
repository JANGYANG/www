<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bg.www.TeamDAO"%>
<%@page import="com.bg.www.TeamJson"%>
<%@page import="com.google.gson.Gson"%>

<!DOCTYPE html>

<%
	TeamDAO teamDAO = new TeamDAO();
	String json = "";
	String teamName = (String) request.getParameter("teamName");
	Gson gson = new Gson();
	TeamJson team = new TeamJson();
	team = teamDAO.viewTeam(teamName);
%>

<html lang="kor">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- j-query-3 -->
  <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

  <!-- Theme CSS -->
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/materialize.css">
 

  <!-- materialize js -->
  <script type="text/javascript" src="<%= request.getContextPath() %>/js/materialize.js"></script>

  <!-- google icon 쓰기 참고 :  https://www.w3schools.com/icons/google_icons_intro.asp -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<!-- swal2 이쁜 alert -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.10/sweetalert2.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.10/sweetalert2.css" />

<title>TEAM -BROKEN-GLASSES-</title>

<script type="text/javascript">
$(function(){
	$("#join").click(function(){
		swal({
			  title: '가입하시겠습니까?',
			  text: "<%out.print(team.getTeamName());%>에 가입하시게 됩니다.",
			  type: 'info',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '가입합니다.'
			}).then(function () {
				window.location.href = "../../TeamJoinServlet?teamName=<%out.print(team.getTeamName());%>"
			})
	});
});
</script>

</head>

<body>
	<div class="container">
		<div class="row">
			<div class="col m4 offset-m4 s6 offset-s3 center">
				<img src="../../img/logo_CI.png" alt="LOGIN" title="BG"
					style="width: 20%"></img>
				<h4 style="text-align: center">TEAM VIEW</h4>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col m4 offset-m4 s6 offset-s3">
				<h4 style="text-align: center">
				팀 이름 : 
					<%
						out.println(team.getTeamName());
					%>
				</h4>
			</div>
		</div>
		<div class="row">
			<div class="col m4 offset-m4 s6 offset-s3">
				<h4 style="text-align: center">
				1 우선 순위 지역<br>
					<%
						out.println(team.getRegionA());
					%>
				</h4>
			</div>
		</div>
		<div class="row">
			<div class="col m4 offset-m4 s6 offset-s3">
				<h4 style="text-align: center">
				2 우선 순위 지역<br> 
					<%
						out.println(team.getRegionB());
					%>
				</h4>
			</div>
		</div>
		<% if (session.getAttribute("teamName") == null){ %>
		<div class="row">
			<div class="col m4 offset-m4 s6 offset-s3 center">
				<button class="waves-effect waves-light btn" id="join">가입신청</button>
			</div>
		</div>
		<%} %>
	</div>

</body>