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
<body style="background-color:#5da2d4">

<jsp:include page="/headNav.jsp" flush="false" />

<section>
	<div class="container">
	<h3>팀 관련 알림</h3>
	<%if(reqJoinList.size() < 1){
		%>
		<div class="row blue lighten-3" >
			<p>새로운 팀 가입 관련된 알림이 없습니다.</p>
		</div>
	<%}else{ %>
	
	<%for(int i = 0; i < reqJoinList.size(); i++){
		%>
		<div class="row blue lighten-3">
			<div class="col m2">
				<img src="<%=request.getContextPath() %>/assets/img/player.png" style="width:100%;border-radius:50%;"/>
			</div>
			<div class="col m4">
				<h4><%=reqJoinList.get(i).getUser().getName() %></h4>
				<p><%=reqJoinList.get(i).getUser().getBirth() %>
				<br/><%=reqJoinList.get(i).getUser().getHeight() %>cm <%=reqJoinList.get(i).getUser().getWeight() %>kg
				<br/><%=reqJoinList.get(i).getUser().getPosition().toString() %>
				</p>
			</div>
			<div class="col m2">
			->
			</div>
			<div class="col m2">
				<h4><a href="<%=request.getContextPath()%>/ReqTeamJoinServlet?teamUID=<%=reqJoinList.get(i).getTeam().getTeamUID()%>&playerUID=<%=reqJoinList.get(i).getUser().getUserUID()%>&confirm=1">수락</a></h4>
			</div>
			<div class="col m2">
		  		<h4><a href="<%=request.getContextPath()%>/ReqTeamJoinServlet?teamUID=<%=reqJoinList.get(i).getTeam().getTeamUID()%>&playerUID=<%=reqJoinList.get(i).getUser().getUserUID()%>&confirm=0">거절</a></h4>
			</div>
		</div>
	<%}
	} %>
	</div>
</section>

<jsp:include page="/footNav.jsp" flush="false" />

</body>
</html>