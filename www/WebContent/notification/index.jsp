<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.bg.www.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
  request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=UTF-8");
	String userUID = (String)session.getAttribute("userUID");		/* 로그인했는지 세션값 지정 */
	String userName = (String)session.getAttribute("userName");	/* 로그인했는지 세션값 지정 */
	String teamUID = (String)session.getAttribute("teamUID");
	if(userUID == null){
		response.sendRedirect(request.getContextPath());
	}else if(teamUID == null){
		response.sendRedirect(request.getContextPath());
	}
	String oldstring = "2011-01-18 00:00:00.0";
	Date date = new SimpleDateFormat("yyyy-MM-dd").parse(oldstring);
	String newstring = new SimpleDateFormat("yyyy-MM-dd").format(date);
	out.println(newstring); // 2011-01-18
	TeamDAO teamDAO = new TeamDAO();
	ArrayList<ReqTeamJoinJson> reqJoinList = teamDAO.reqTeamJoin(teamUID);
%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>NOTIFICATION</title>
	
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/materialize.css"  media="screen,projection"/>
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/main.css"  media="screen,projection"/>
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/materialize.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/main.js"></script>

</head>
<body>
<section>
	<h2>팀 관련 알림</h2>
	<div class="container">
	<%for(int i = 0; i < reqJoinList.size(); i++){
		%>
		<div class="row">
			<div class="col m3">
				<img src="<%=request.getContextPath() %>/assets/img/player.png" style="width:100%;border-radius:50%;"/>
			</div>
			<div class="col m5">
				<h4><%=reqJoinList.get(i).getUser().getName() %></h4>
				<p><%=reqJoinList.get(i).getUser().getBirth() %>
				<br/><%=reqJoinList.get(i).getUser().getHeight() %>cm <%=reqJoinList.get(i).getUser().getWeight() %>kg
				<br/><%=reqJoinList.get(i).getUser().getPosition().toString() %>
				</p>
			</div>
			<div class="col m2">
			->
			</div>
			<div class="col m1">
				<h4>수락</h4>
			</div>
			<div class="col m1">
		  		<p>거절</p>
			</div>
		</div>
	<%} %>
	</div>
</section>
</body>
</html>