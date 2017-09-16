<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bg.www.TeamDAO" %>
<%@page import="com.bg.www.TeamJson" %>
<%@page import="com.google.gson.Gson" %>

<!DOCTYPE html>

<html lang="kor">

<head>
<!-- 
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content=""> -->

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

  <title>SEARCH TEAM -BROKEN-GLASSES-</title>




<!--   <script type="text/javascript">
	$(function(){
		$("#btnSearch").click(function(){
			var teamName = $("#inputSearch").val();
			searchFunction(teamName);
		});
	})
	function searchFunction(teamName){
		$.ajax({
		       type: "POST",
		       dataType: "JSON",
		       url: '../../TeamSearchServlet',
		       data: {teamName: teamName},
		       success: function (json) {
		           console.log("ajax success");
			   },
		       error: function(){
		        //  console.log("json : " + json.error);
		           console.log('Ajax Error');
		       }
	     });
	};
  </script> -->

</head>

<body>
  <div class="container">
    <div class="row">
      <div class="center">
        <img src="../../img/logo_CI.png" alt="LOGIN" title="BG" style="width:20%"></img>
        <h4 style="text-align:center">SEARCH TEAM</h4>
      </div>
    </div>
  </div>
	<div class="container">
		<div class="row">
			<div class="col s8 offset-s2 l6 offset-l3"
				style="text-align: center;">
				<form action="" method="GET">
					<input style="text-align: center" type="text" name="teamName"
						id="inputSearch">
					<button id="btnSearch" class="btn" type="submit"
						style="text-align: center;">Search</button>
				</form>
			</div>
		</div>
	</div>
	<div class="container">
	<div class="row">
<%
  TeamDAO teamDAO = new TeamDAO();
  	String json = "";
  	String teamName = (String)request.getParameter("teamName");
  	json = teamDAO.searchByN(teamName);
  	Gson gson = new Gson();
  	TeamJson[] teamAry = gson.fromJson(json, TeamJson[].class);
  	out.println(json+"<br>");
  	if(teamAry.length==0){
%>
<div class="center">
결과가 없습니다. 다시 입력해주세요.
</div>

<%
  	}
  	for(int i = 0; i < teamAry.length; i++){
 %>

    <div class="col s12 m6 l4">
      <div class="card">
        <div class="card-image click-to-toggle fixed-action-btn" style="right:0px;">
          <img src="<%= request.getContextPath() %>/img/1.png">
          <span class="card-title"><%= teamAry[i].getTeamName() %></span>
          <a class="btn-floating halfway-fab waves-effect waves-light red"><i class="material-icons">add</i></a>
         	  <ul>
			      <li><a class="btn-floating red"><i class="large material-icons">person_add</i></a></li>
			      <li><a class="btn-floating yellow darken-1"><i class="large material-icons">pin_drop</i></a></li>
			      <li><a class="btn-floating green"><i class="large material-icons">search</i></a></li>
			    </ul>
        </div>
        <div class="card-content">
          <p>팀짧은 설명!</p>
        </div>
      </div>
    </div>
  
     <%
     
  	}
     %>

  
  
 
	</div>	
  </div>

<script>

</script>
</body>
