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
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/main.css"  media="screen,projection"/>
	<!-- Compiled and minified JavaScript -->
	<!-- index페이지 jquery -->
	<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/snap.svg-min.js"></script>
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/component.css"  media="screen,projection"/>
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/demo.css"  media="screen,projection"/>
  
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.js"></script>
  <script src="<%=request.getContextPath() %>/assets/js/materialize.min.js"></script>
</head>

<body style="background-color:#5da2d4;">

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

		<div class="container">
			<section id="grid" class="grid clearfix">
				<a href="./team" data-path-hover="m 180,34.57627 -180,0 L 0,0 180,0 z">
					<figure>
						<img src="<%=request.getContextPath() %>/assets/img/1.png" />
						<svg viewBox="0 0 180 320" preserveAspectRatio="none"><path d="M 180,160 0,218 0,0 180,0 z"/></svg>
						<figcaption>
							<h2>TEAM</h2>
							<p>최고의 팀을찾아라</p>
							
						</figcaption>
					</figure>
				</a>
				<a href="./player/myPlayer.jsp" data-path-hover="m 180,34.57627 -180,0 L 0,0 180,0 z">
					<figure>
						<img src="<%=request.getContextPath() %>/assets/img/1.png" />
						<svg viewBox="0 0 180 320" preserveAspectRatio="none"><path d="M 180,160 0,218 0,0 180,0 z"/></svg>
						<figcaption>
							<h2>PLAYER</h2>
							<p>최고의 선수는 누구인가?</p>
							
						</figcaption>
					</figure>
				</a>
				<a href="./match" data-path-hover="m 180,34.57627 -180,0 L 0,0 180,0 z">
					<figure>
						<img src="<%=request.getContextPath() %>/assets/img/1.png" />
						<svg viewBox="0 0 180 320" preserveAspectRatio="none"><path d="M 180,160 0,218 0,0 180,0 z"/></svg>
						<figcaption>
							<h2>MATCH</h2>
							<p>모든 경기에 대해</p>
						</figcaption>
					</figure>
				</a>
				<a href="./search/" data-path-hover="m 180,34.57627 -180,0 L 0,0 180,0 z">
					<figure>
						<img src="<%=request.getContextPath() %>/assets/img/1.png" />
						<svg viewBox="0 0 180 320" preserveAspectRatio="none"><path d="M 180,160 0,218 0,0 180,0 z"/></svg>
						<figcaption>
							<h2>SEARCH</h2>
							<p>선수 와 팀을 검색하라</p>
							
						</figcaption>
					</figure>
				</a>
				</section>
		</div>

<jsp:include page="/footNav.jsp" flush="false" />

<script>
  	$(function(){
  		$("#sbp").click(function(){
  			$('#sForm').attr('action','./player/playerSearch.jsp');
  			$('#sIcon').text("person");
  			$('.sInput').attr('name',"userName");
  		});
  		$("#sbt").click(function(){
  			$('#sForm').attr('action','./team/teamSearch.jsp');
  			$('#sIcon').text("people");
  			$('.sInput').attr('name',"teamName");
  		})
  	});
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
</body>
</html>