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
	  
	  <script type="text/javascript" src="../js/main.js"></script>
      
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body class="navbar-fixed">
	<nav class="navbar navbar-custom navbar-fixed-top  blue darken-3">
	    <div class="nav-wrapper ">
	      <a href="./index.jsp" class="brand-logo">BROKEN-GLASSES</a>
	      <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
	      <ul class="right hide-on-med-and-down">
	        <li><a href="#about">MAIN</a></li>
	        <li><a href="#download">TEAM</a></li>
	        <li><a href="#contact">PLAYER</a></li>
	        <li><a href="#contact">TEST</a></li>
	        <li><a href="#contact">LOGIN</a></li>
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
	
	<section class="container start">
		<div class="carousel carousel-slider">
	    <a class="carousel-item" href="#one!"><img src="https://lorempixel.com/800/400/food/1"></a>
	    <a class="carousel-item" href="#two!"><img src="https://lorempixel.com/800/400/food/2"></a>
	    <a class="carousel-item" href="#three!"><img src="https://lorempixel.com/800/400/food/3"></a>
	    <a class="carousel-item" href="#four!"><img src="https://lorempixel.com/800/400/food/4"></a>
	  	</div>
		<div class="row center">
			<h3> 메인 사진 자리</h3>
		</div>
		<div>
			<p>메인 페이지 내용</p>
		</div>
	</section>	
	
	
	
	  <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>
      <script> $(document).ready(function(){$(".button-collapse").sideNav();}); </script>
      <script>
		function collapseNavbar() {
		    if ($(".navbar").offset().top > 50) {
		        $(".navbar-fixed-top").addClass("top-nav-collapse");
		    } else {
		        $(".navbar-fixed-top").removeClass("top-nav-collapse");
		    }
		}
		$(window).scroll(collapseNavbar);
		$(document).ready(collapseNavbar);
		
		$(window).scroll(collapseNavbar);
		$(document).ready(collapseNavbar);
	  </script>
</body>
</html>