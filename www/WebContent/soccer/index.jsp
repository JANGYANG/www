<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
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
	<!-- Dropdown Structure -->
<ul id="Community" class="dropdown-content">
  <li><a href="">공지사항</a></li>
  <li><a href="./community/bbsSoccer.jsp">축구게시판</a></li>
  <li><a href="./community/bbsLeague.jsp">리그게시판</a></li>
  <li class="divider"></li>
  <li><a href="./community/bbsMyteam.jsp">MY팀게시판</a></li>
</ul>
<!-- Dropdown Structure -->
<ul id="Team" class="dropdown-content">
  <li><a href="./team/myTeam.jsp">MY팀관리</a></li>
  <li><a href="./team/teamSearch.jsp">팀찾기 </a></li>
</ul>
<!-- Dropdown Structure -->
<ul id="Login" class="dropdown-content ">
  <li><a href="./register/userinfo.jsp">나의정보</a></li>
  <li class="divider"></li>
  <li><a href="./login/logout.jsp">로그아웃</a></li>
  <li class="divider"></li>
  <li><a href="./register/signup.jsp">회원가입</a></li>
  <li class="divider"></li>
  <li><a href="./login/index.jsp">로그인</a></li>
</ul>
<!-- Dropdown Structure -->
<ul id="League" class="dropdown-content">
  <li><a href="./league/registerMatch.jsp">경기기록</a></li>
  <li><a href="./league/registerLeague.jsp">리그신청</a></li>
  <li><a href="./league/infoStadium.jsp">경기장정보</a></li>
   <li class="divider"></li>
  <li><a href="./league/myLeague.jsp">MY리그</a></li>
</ul>

	<!-- Dropdown Structure -->
<ul id="Menu" class="dropdown-content">
  <li><a id="#main">MAIN</a></li>
  <li><a class="dropdown-button" data-activates="Team" href="#!">TEAM</a></li>
  <li><a href="./player.jsp">PLAYER</a></li>
  <li><a class="dropdown-button" data-activates="League" href="#!">LEAGUE</a></li>
  <li><a class="dropdown-button" data-activates="Community" href="#!">COMMUNITY</a></li>
  <li><a href="./test.jsp">TEST</a></li>
  <li><a class="dropdown-button" data-activates="Login" href="#!">LOGIN</a></li>

</ul>


	<nav class="navbar navbar-fixed-top" style="padding-right:10px; padding-left:10px">
	    <div class="nav-wrapper ">
	      <a href="./main.jsp" class="brand-logo">BROKEN-GLASSES</a>
	      <a href="#" data-activates="Menu" class="right dropdown-button show-on-med-and-up"><i class="material-icons">menu</i></a>
	      <ul class="right hide-on-med-and-down">
	        <li><a href="./main.jsp">MAIN</a></li>
	        <li><a class="dropdown-button"  data-activates="Team" href="#!">TEAM<i class="tiny material-icons right">arrow_drop_down</i></a></li>
	        <li><a href="./player.jsp">PLAYER</a></li>
	        <li><a class="dropdown-button" data-activates="League" href="#!">LEAGUE<i class="tiny material-icons right">arrow_drop_down</i></a></li>
	        <li><a class="dropdown-button" data-activates="Community" href="#!">COMMUNITY<i class="tiny material-icons right">arrow_drop_down</i></a></li>
	        <li><a href="./test.jsp">TEST</a></li>
	        <li><a class="dropdown-button"  data-activates="Login" href="#!">LOGIN<i class="tiny material-icons right">arrow_drop_down</i></a></li>
	      </ul>
	    </div>
	</nav>
	
<!-- 	캐러셀 -->
<!-- 		<div class="container">
			<div class="carousel carousel-slider center" data-indicators="true">
			    <a class="carousel-item" href="#one!"><img height=400px; style="border-radius: 8px;
	opacity: 0.8;"src="../img/time.jpg"></a>
			    <a class="carousel-item" href="#two!"><img height=400px; src="../img/where.jpg"></a>
			    <a class="carousel-item" href="#three!"><img height=400px; src="../img/stadium.jpg"></a>
			    <a class="carousel-item" href="#four!"><img height=400px; src="../img/league.jpg"></a>
		  	</div>
	  	</div> -->
	  	
	  	<body>
	  	
	  	<div class="center" style="margin-top:100px"><h1>BROKEN GLASSES</h1></div>
		<div class="container">

			<section id="grid" class="grid clearfix">
				<a href="#" data-path-hover="m 180,34.57627 -180,0 L 0,0 180,0 z">
					<figure>
						<img src="../img/1.png" />
						<svg viewBox="0 0 180 320" preserveAspectRatio="none"><path d="M 180,160 0,218 0,0 180,0 z"/></svg>
						<figcaption>
							<h2>TEAM</h2>
							<p>최고의 팀을찾아라</p>
							
						</figcaption>
					</figure>
				</a>
				<a href="#" data-path-hover="m 180,34.57627 -180,0 L 0,0 180,0 z">
					<figure>
						<img src="../img/1.png" />
						<svg viewBox="0 0 180 320" preserveAspectRatio="none"><path d="M 180,160 0,218 0,0 180,0 z"/></svg>
						<figcaption>
							<h2>PLAYER</h2>
							<p>최고의 선수는 누구인가?</p>
							
						</figcaption>
					</figure>
				</a>
				<a href="#" data-path-hover="m 180,34.57627 -180,0 L 0,0 180,0 z">
					<figure>
						<img src="../img/1.png" />
						<svg viewBox="0 0 180 320" preserveAspectRatio="none"><path d="M 180,160 0,218 0,0 180,0 z"/></svg>
						<figcaption>
							<h2>LEAGUE</h2>
							<p>명승부가 가득한 리그</p>
							
						</figcaption>
					</figure>
				</a>
				<a href="#" data-path-hover="m 180,34.57627 -180,0 L 0,0 180,0 z">
					<figure>
						<img src="../img/1.png" />
						<svg viewBox="0 0 180 320" preserveAspectRatio="none"><path d="M 180,160 0,218 0,0 180,0 z"/></svg>
						<figcaption>
							<h2>COMMUNITY</h2>
							<p>전설이 시작되는 곳</p>
							
						</figcaption>
					</figure>
				</a>
				
				<!-- 여분입니다. -->
				<!-- <a href="#" data-path-hover="m 180,34.57627 -180,0 L 0,0 180,0 z">
					<figure>
						<img src="../img/1.png" />
						<svg viewBox="0 0 180 320" preserveAspectRatio="none"><path d="M 180,160 0,218 0,0 180,0 z"/></svg>
						<figcaption>
							<h2>Nebulous</h2>
							<p>Pea horseradish azuki bean lettuce.</p>
							<button>View</button>
						</figcaption>
					</figure>
				</a>
				<a href="#" data-path-hover="m 180,34.57627 -180,0 L 0,0 180,0 z">
					<figure>
						<img src="../img/1.png" />
						<svg viewBox="0 0 180 320" preserveAspectRatio="none"><path d="M 180,160 0,218 0,0 180,0 z"/></svg>
						<figcaption>
							<h2>Iridescent</h2>
							<p>A grape silver beet watercress potato.</p>
							<button>View</button>
						</figcaption>
					</figure>
				</a>
				<a href="#" data-path-hover="m 180,34.57627 -180,0 L 0,0 180,0 z">
					<figure>
						<img src="../img/1.png" />
						<svg viewBox="0 0 180 320" preserveAspectRatio="none"><path d="M 180,160 0,218 0,0 180,0 z"/></svg>
						<figcaption>
							<h2>Resonant</h2>
							<p>Chickweed okra pea winter purslane.</p>
							<button>View</button>
						</figcaption>
					</figure>
				</a>
				<a href="#" data-path-hover="m 180,34.57627 -180,0 L 0,0 180,0 z">
					<figure>
						<img src="../img/1.png" />
						<svg viewBox="0 0 180 320" preserveAspectRatio="none"><path d="M 180,160 0,218 0,0 180,0 z"/></svg>
						<figcaption>
							<h2>Zenith</h2>
							<p>Salsify taro catsear garlic gram.</p>
							<button>View</button>
						</figcaption>
					</figure>
				</a> -->
			</section>
		</div><!-- /container -->
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
	   
	   	<script>
	$(document).ready(function(){
	$(".dropdown-button").dropdown({belowOrigin: true});
	$("#change-body").load("./main.jsp");

	})
	   </script>
</body>
</html>