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
<!--Import Google Icon Font-->
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="../css/materialize.css"  media="screen,projection"/>
      
      <link type="text/css" rel="stylesheet" href="../css/main.css"  media="screen,projection"/>
		
      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
      
       <!-- Compiled and minified CSS -->
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.1/css/materialize.min.css">
	
	  <!-- Compiled and minified JavaScript -->
	  <!-- index페이지 jquery -->
	   <script type="text/javascript" src="../js/snap.svg-min.js"></script>
	   <link type="text/css" rel="stylesheet" href="../css/component.css"  media="screen,projection"/>
	   <link type="text/css" rel="stylesheet" href="../css/demo.css"  media="screen,projection"/>
	   <!-- <link type="text/css" rel="stylesheet" href="../css/normalize.css"  media="screen,projection"/>
	    -->
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Broken-glasses</title>
</head>
<body>
	  	
	  	<div class="center" style="margin-top:100px"><h1>BROKEN GLASSES</h1></div>
	  	<div class="container">
		  	<div class="row">
	  			<div class="col m10 offset-m1 input-field">
					<i class="material-icons prefix dropdown-button" data-activates="dropdown2">person</i>
          <input id="icon_prefix" type="text" class="validate">
          <label for="icon_prefix">Search</label>
          <ul id='dropdown2' class='dropdown-content'>
				    <li><a href="#!"><i class="material-icons">person</i>Search by Person</a></li>
				    <li><a href="#!"><i class="material-icons">people</i>Search by Team</a></li>
				  </ul>
	  			</div>
	  		</div>
	  	</div>
		<div class="container">
			<section id="grid" class="grid clearfix">
				<a href="./team" data-path-hover="m 180,34.57627 -180,0 L 0,0 180,0 z">
					<figure>
						<img src="../img/1.png" />
						<svg viewBox="0 0 180 320" preserveAspectRatio="none"><path d="M 180,160 0,218 0,0 180,0 z"/></svg>
						<figcaption>
							<h2>TEAM</h2>
							<p>최고의 팀을찾아라</p>
							
						</figcaption>
					</figure>
				</a>
				<a href="./player/myPlayer.jsp" data-path-hover="m 180,34.57627 -180,0 L 0,0 180,0 z">
					<figure>
						<img src="../img/1.png" />
						<svg viewBox="0 0 180 320" preserveAspectRatio="none"><path d="M 180,160 0,218 0,0 180,0 z"/></svg>
						<figcaption>
							<h2>PLAYER</h2>
							<p>최고의 선수는 누구인가?</p>
							
						</figcaption>
					</figure>
				</a>
				<a href="./match" data-path-hover="m 180,34.57627 -180,0 L 0,0 180,0 z">
					<figure>
						<img src="../img/1.png" />
						<svg viewBox="0 0 180 320" preserveAspectRatio="none"><path d="M 180,160 0,218 0,0 180,0 z"/></svg>
						<figcaption>
							<h2>MATCH</h2>
							<p>모든 경기에 대해</p>
						</figcaption>
					</figure>
				</a>
				<a href="./search/" data-path-hover="m 180,34.57627 -180,0 L 0,0 180,0 z">
					<figure>
						<img src="../img/1.png" />
						<svg viewBox="0 0 180 320" preserveAspectRatio="none"><path d="M 180,160 0,218 0,0 180,0 z"/></svg>
						<figcaption>
							<h2>SEARCH</h2>
							<p>선수 와 팀을 검색하라</p>
							
						</figcaption>
					</figure>
				</a>
				</section>
				
				    <div class="fixed-action-btn toolbar">
					    <a class="btn-floating btn-large red" >
					      <i class="large material-icons">mode_edit</i>
					    </a>
					    <ul>
					    <%if(userUid != null){%>
					    		<li><a href="<%= request.getContextPath() %>/soccer/player/myPlayer.jsp">선수정보</a></li>
					     	<li><a href="<%= request.getContextPath() %>/UserLogoutServlet">팀 정보</a></li>
								<li><a href="<%= request.getContextPath() %>/UserLogoutServlet">로그아웃</a></li>
					     <%} 
					    else{%>
					   		<li><a href="<%= request.getContextPath() %>/soccer/login/index.jsp">로그인</a></li>
					    		<li><a href="<%= request.getContextPath() %>/soccer/register/signup.jsp">회원가입</a></li>
					     <%}%>
					     <!--  <li class="waves-effect waves-light"><a href="#!"><i class="material-icons">insert_chart</i></a></li>
					      <li class="waves-effect waves-light"><a href="#!"><i class="material-icons">format_quote</i></a></li>
					      <li class="waves-effect waves-light"><a href="#!"><i class="material-icons">publish</i></a></li>
					      <li class="waves-effect waves-light"><a href="#!"><i class="material-icons">attach_file</i></a></li> -->
					    </ul>
					  </div>
	
		</div>
		<script>
			(function() {
	
				function init() {
					var speed = 250,
						easing = mina.easeinout;

					[].slice.call ( document.querySelectorAll( '#grid > a' ) ).forEach( function( el ) {
						var s = Snap( el.querySelector( 'svg' ) ), path = s.select( 'path' ),
							pathConfig = {
								from : path.attr( 'd' ),
								to : el.getAttribute( 'data-path-hover' )
							};

						el.addEventListener( 'mouseenter', function() {
							path.animate( { 'path' : pathConfig.to }, speed, easing );
						} );

						el.addEventListener( 'mouseleave', function() {
							path.animate( { 'path' : pathConfig.from }, speed, easing );
						} );
					} );
				}

				init();

			})();
		</script>
	  	
	 <section class="container start">
		<div id="change-body">
		
		
		</div>
	</section>	
	
		

	   <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.1/js/materialize.min.js"></script>
	   <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.js"></script>
	   <script type="text/javascript" src="../js/materialize.js"></script>
	   <script type="text/javascript" src="../js/main.js"></script>

</body>
</html>