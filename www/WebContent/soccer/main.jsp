<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-custom navbar-fixed-top   blue lighten-4">
	    <div class="nav-wrapper ">
	      <a href="./index.jsp" class="brand-logo">BROKEN-GLASSES</a>
	      <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
	      <ul class="right hide-on-med-and-down">
	        <li><a href="./main.jsp">MAIN</a></li>
	        <li><a href="./team.jsp">TEAM</a></li>
	        <li><a href="./player.jsp">PLAYER</a></li>
	        <li><a href="./test.jsp">TEST</a></li>
	        <li><a href="./login/index.jsp">LOGIN</a></li>
	      </ul>
	      <ul class="side-nav" id="mobile-demo">
	        <li><a href="#about">MAIN</a></li>
	        <li><a href="#download">TEAM</a></li>
	        <li><a href="#contact">PLAYER</a></li>
	        <li><a href="#contact">TEST</a></li>
	        <li><a href="#contact">LOGIN</a></li>
	      </ul>
	    </div>
	</nav>
		<div class="container">
			<div class="carousel carousel-slider">
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
			<div class="col m8  ">
				<div class="z-depth-3  blue lighten-4 white-text">
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
			
			
			</div>
			
			<div class="col m4 ">
				<div class="z-depth-3  blue lighten-4">
					  <form action="/users/login.php" method="POST" id="form" onsubmit="return checkSubmit();">  
					        <input type="email" name="email" id="email" class="validate">
					        <input type="password" name="password" id="password" class="validate">
					      <p style="text-align:center;">
					        <input type="checkbox" id="test5" />
					        <label for="test5">REMEMVER ME!</label>
					      </p>
					      <button class="btn waves-effect waves-light" type="submit" name="login_button" id="btnLogin" style="width:50%;">
					        LOGIN<i class="material-icons right">send</i>
					      </button>
					    
					  
					
					  </form>
				</div>
			
			
			</div>
		</div>
	</section>	
	
	
	  
</body>
</html>