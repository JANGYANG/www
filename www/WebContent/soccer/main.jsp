<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<!--Import Google Icon Font-->
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="../css/materialize.min.css"  media="screen,projection"/>
      
      <link type="text/css" rel="stylesheet" href="../css/main.css"  media="screen,projection"/>
		
      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
      
       <!-- Compiled and minified CSS -->
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.1/css/materialize.min.css">
	
	  <!-- Compiled and minified JavaScript -->
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.1/js/materialize.min.js"></script>
	  
	   <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	   
	   <script type="text/javascript" src="../js/materialize.min.js"></script>
	   <script type="text/javascript" src="../js/main.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Broken-glasses</title>
</head>
<body>
	<!-- Dropdown Structure -->
<ul id="Community" class="dropdown-content">
  <li><a href="">공지사항</a></li>
  <li><a href="#!">축구게시판</a></li>
  <li><a href="#!">리그게시판</a></li>
  <li class="divider"></li>
  <li><a href="#!">MY팀게시판</a></li>
</ul>
<!-- Dropdown Structure -->
<ul id="Team" class="dropdown-content">
  <li><a href="#!">MY팀관리</a></li>
  <li><a href="#!">팀찾기 </a></li>
</ul>
<!-- Dropdown Structure -->
<ul id="Login" class="dropdown-content ">
  <li><a href="#!">나의정보</a></li>
  <li class="divider"></li>
  <li><a href="./logout.jsp">로그아웃</a></li>
  <li class="divider"></li>
  <li><a href="./register/signup.jsp">회원가입</a></li>
  <li class="divider"></li>
  <li><a href="./login/login.jsp">로그인</a></li>
</ul>
<!-- Dropdown Structure -->
<ul id="League" class="dropdown-content">
  <li><a href="#!">경기기록</a></li>
  <li><a href="#!">리그신청</a></li>
  <li><a href="#!">경기장정보</a></li>
   <li class="divider"></li>
  <li><a href="#!">MY리그</a></li>
</ul>

	<!-- Dropdown Structure -->
<ul id="Menu" class="dropdown-content">
  <li><a href="./main.jsp">MAIN</a></li>
  <li><a class="dropdown-button" data-activates="Team" href="#!">TEAM</a></li>
  <li><a href="./player.jsp">PLAYER</a></li>
  <li><a class="dropdown-button" data-activates="League" href="#!">LEAGUE</a></li>
  <li><a class="dropdown-button" data-activates="Community" href="#!">COMMUNITY</a></li>
  <li><a href="./test.jsp">TEST</a></li>
  <li><a class="dropdown-button" data-activates="Login" href="#!">LOGIN</a></li>

</ul>


	<nav class=" container navbar navbar-fixed-top blue darken-4" style="padding-right:10px; padding-left:10px">
	    <div class="nav-wrapper ">
	      <a href="./main.jsp" class="brand-logo">BROKEN-GLASSES</a>
	      <a href="#" data-activates="Menu" class="right dropdown-button hide-on-med-and-up"><i class="material-icons">menu</i></a>
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
		<div class="container">
			<div class="carousel carousel-slider center" data-indicators="true">
			    <a class="carousel-item" href="#one!"><img height=400px; style="border-radius: 8px;
	opacity: 0.8;"src="../img/time.jpg"></a>
			    <a class="carousel-item" href="#two!"><img height=400px; src="../img/where.jpg"></a>
			    <a class="carousel-item" href="#three!"><img height=400px; src="../img/stadium.jpg"></a>
			    <a class="carousel-item" href="#four!"><img height=400px; src="../img/league.jpg"></a>
		  	</div>
	  	</div>
	 <section class="container start">
		
		<div class="row center">
			<h3> 메인 사진 자리</h3>
		</div>
		<div>
			<p>메인 페이지 내용</p>
		</div>
		<div class="row">
			<div class="col s12 m12 l12">
				
				<div class="z-depth-3 ">
				 <div>진행중인 리그</div>
				  <table class="centered">
			        <thead>
			          <tr>
			              <th>득점순위</th>
			              <th>선수이름</th>
			              <th>소속팀</th>
			          </tr>
			        </thead>
			        <tbody>
			          <tr>
			            <td>1</td>
			            <td>박희융</td>
			            <td>프론티어</td>
			          </tr>
			          <tr>
			            <td>2</td>
			            <td>이우경</td>
			            <td>부러진안경</td>
			          </tr>
			          <tr>
			            <td>3</td>
			            <td>이민규</td>
			            <td>붙여진안경</td>
			          </tr>
			        </tbody>
			      </table>
				</div>
				<section style="height: 30px;"></section>
				<div class="z-depth-3 ">
				  <table class="centered">
			        <thead>
			          <tr>
			              <th>득점순위</th>
			              <th>선수이름</th>
			              <th>소속팀</th>
			          </tr>
			        </thead>
			        <tbody>
			          <tr class="hoverable">
			            <td>1</td>
			            <td>박희융</td>
			            <td>프론티어</td>
			          </tr>
			          <tr>
			            <td>2</td>
			            <td>이우경</td>
			            <td>부러진안경</td>
			          </tr>
			          <tr>
			            <td>3</td>
			            <td>이민규</td>
			            <td>붙여진안경</td>
			          </tr>
			        </tbody>
			      </table>
				</div>
				
				
				
			</div>
		</div>
	</section>	
	
	<script>
		$(document).ready(function(){
			$(".dropdown-button").dropdown({belowOrigin: true});
			 
		})
	</script>
	  
</body>
</html>