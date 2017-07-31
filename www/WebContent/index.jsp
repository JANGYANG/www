<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 	  <!--Import Google Icon Font-->
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="./css/materialize.min.css"  media="screen,projection"/>
      <link type="text/css" rel="stylesheet" href="./css/main.css"  media="screen,projection"/>
		
      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
      
       <!-- Compiled and minified CSS -->
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.1/css/materialize.min.css">
	
	  <!-- Compiled and minified JavaScript -->
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.1/js/materialize.min.js"></script>
	  
	   <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	   
	   <script type="text/javascript" src="./js/materialize.min.js"></script>
	   <script type="text/javascript" src="./js/main.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BROKEN GLASSES</title>
</head>
	<body class="navbar-fixed black">
		<nav class="navbar  navbar-fixed-top">
		    <div class="nav-wrapper black">
		      <a href="./index.jsp" class="brand-logo" style="margin-left:30px"><img style="height:50px;width:auto"src="./img/ci.png"></a>
		      <a href="#" data-activates="mobile-demo" class="button-collapse right"><i class="material-icons">menu</i></a>
		      <ul class="right hide-on-med-and-down ">
		        <li><a href="#about">About</a></li>
		        <li><a href="#download">Characters</a></li>
		        <li><a href="#contact">Contact</a></li>
		      </ul>
		      <ul class="side-nav" id="mobile-demo">
		        <li><a href="#about">About</a></li>
		        <li><a href="#download">Characters</a></li>
		        <li><a href="#contact">Contact</a></li>
		      </ul>
		    </div>
		  </nav>

		  <div class="intro ">
	        <div class="intro-body">
	            <div class="container">
	                <div class="row">
	                    <div style="margin-top: 200px;"class="col m8 offset-m2 ">
	                        <h2 class="brand-heading">부러진 안경</h2>
	                        
							<div>
							<img style="height:100%;width:300px"src="./img/ci.png">
							</div>
	                        <p class="intro-text">365일, 어디서나 스마트한 축구 리그</p>
	
	                        <!-- <button type="button" class="btn btn-circle page-scroll" aria-label="Left Align">
	                          <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
	                        </button> -->
	                        <!-- 눈깔 버튼 -->
	
	                        <a href="./soccer/index.jsp">
	                            <i class="large material-icons">directions_run</i>
	                            <div style="over">시작하기-></div>
	                        </a>
	
	                        <!-- <button type="button" class="btn btn-circle page-scroll" aria-label="Center Align">
	                          <span class="glyphicon glyphicon-knight" aria-hidden="true"></span>
	                        </button> -->
	
	                        <!-- 표적 버튼 -->
	                    </div>
	                </div>
	            </div>
	        </div>
	      </div>

    <!-- About Section -->
    <section id="about" class="text-center black">
      <!-- <img src="./img/ci.png" style="margin-bottom:30px;" height="100px"> -->
      <div class="container">
	        <div class="row center">
	            <div class="col m8 offset-m2 white-text" style="margin-top:100px; line-height:3em">
	                <!-- <img src="./img/ci.png" height="100px" margin="50px"> -->
	                <h2 class="shadowlight">WHY BROKEN-GLASSES</h2>
	                <p class="shadowlight">왜 우린 경기를 기다려야 할까요?<br>우리가 참가할 대회와 리그는 왜이렇게 없는걸까요?</p>
	                <p class="shadowlight">이런 고충을 겪는 모든 아마추어 축구 선수들에게 부러진 안경의 솔루션을 제시합니다.<br>이제 여러분들은 <b class="light-blue">원하는 시간</b>에, <b class="light-blue">원하는 장소</b>에서, <b class="light-blue">원하는 리그 경기</b>를 가질 수 있습니다.<br>저희는 가장 스마트한 리그 아마추어 플렛폼을 제공합니다.</p>
	                <!-- <button class="btn btn-info" onclick='location="/soccer.php"'>자세히</button> -->
	            </div>
	        </div>
      </div>
    </section>
    	<div class="blank"></div>
    <section>
    </section>
    <!-- Download Section -->
    <section id="download" class="content-section text-center">
    	<div class="parallax-container wrap">
	    	<div class="container over" style="margin-top:300px;">
	            <div class="col m8 offset-m2 white-text">
	                <h2 class="shadowlight">EVERY WHERE</h2>
	                <p class="shadowlight">원하는 장소 어디서나 경기를 치를 수 있습니다. 이제 굳이 경기장 때문에 곤욕 치를 일이 없습니다. 자신이 원하는 가까운 장소에서 경기가 가능합니다.</p>
	                <!-- <a href="http://startbootstrap.com/template-overviews/grayscale/" class="btn btn-default btn-lg">Visit Download Page</a> -->
	            </div>
	        </div>
		  <div class="parallax">
		  	<img src="./img/where.jpg">
		  </div>
		</div>
	</section>
	
	
	<section>
      <div class="blank"></div>
    </section>   
    

    <!-- Contact Section -->
    <section class="content-section text-center">
        <div class="parallax-container wrap">
	    	<div class="container over" style="margin-top:300px;">
	            <div class="col m8 offset-m2 white-text">
                    <h2 class="shadowlight">EVERY TIME</h2>
                    <p class="shadowlight">가능한 시간에 경기를 치를 수 있습니다. 시간이 안맞아서 축구를 못했던 과거의 불편함이 사라집니다. 자신이 원하는 시간에 축구를 즐기세요.</p>
                    <!-- <a href="http://startbootstrap.com/template-overviews/grayscale/" class="btn btn-default btn-lg">Visit Download Page</a> -->
               </div>
	        </div>
		  <div class="parallax">
		  	<img src="./img/time.jpg">
		  </div>
		</div>
    </section>

	<section>
       <div class="blank"></div>
    </section> 
    
    <!-- Contact Section -->
    <section class="content-section text-center">
        <div class="parallax-container wrap">
	    	<div class="container over" style="margin-top:300px;">
	            <div class="col m8 offset-m2 white-text">
                    <h2 class="shadowlight">LEAGUE GAME</h2>
                    <p class="shadowlight">지겨운 자체경기, 의미없는 친선경기는 이제 끝. 이제 승부욕과 경쟁이 치열한 공식경기만을 치를 수 있습니다. 모든 것은 기록되며 더 나은 팀이, 자신이 될 수 있게 노력하세요.</p>
                    <!-- <a href="http://startbootstrap.com/template-overviews/grayscale/" class="btn btn-default btn-lg">Visit Download Page</a> -->
                  </div>
	        </div>
		  <div class="parallax">
		  	<img src="./img/league.jpg" style="width:100%; ">
		  </div>
		</div>
    </section>

    <!-- Contact Section -->
    <section id="contact" class="container content-section text-center">
        <div class="row center">
            <div class="col m8 offset-m2">
              <img src="./img/logo_CI.png" alt="" style="width:150px;">
                <h2>Contact BROKEN-GLASSES</h2>
                <p>Feel free to email us to provide some feedback on our services, give us suggestions for new services and ideas, or to just say hello!</p>
                <p><a href="mailto:radiata03@broken-glasses.com">radiata03@broken-glasses.com</a>
                </p>
                <ul class="list-inline banner-social-buttons">
                    <li>
                        <a href="https://facebook.com/broken-glasse5" > <i class="material-icons">face</i> <span class="network-name">Facebook</span></a>
                    </li>
                    <li>
                        <a href="https://instagram.com/brokenglasse5" > <i class="material-icons">camera_alt</i> <span class="network-name">Instagram</span></a>
                    </li>
                    <li>
                        <a href="https://www.youtube.com/channel/UCjZKJ7NP8S0z_HJccbg3W3Q"><i class="material-icons">youtube_searched_for</i>  <span class="network-name">Youtube</span></a>
                    </li>
                </ul>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div class="container text-center blue-text text-darken-2">
            <p>Copyright &copy; BROKEN-GLASSES 2017</p>
        </div>
    </footer>
	</body>
	
	<script>
	/* function collapseNavbar() {
	    if ($(".navbar").offset().top > 50) {
	        $(".navbar-fixed-top").addClass("top-nav-collapse");
	    } else {
	        $(".navbar-fixed-top").removeClass("top-nav-collapse");
	    }
	}
	$(window).scroll(collapseNavbar);
	$(document).ready(collapseNavbar); */
	
	$(document).ready(function(){
	      $('.carousel').carousel();
	    });
	</script>
</html>