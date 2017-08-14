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
		<div class="container">
			<div class="carousel carousel-slider center" data-indicators="true">
			    <a class="carousel-item" href="#one!"><img height=400px; style="border-radius: 8px;
				opacity: 0.8;"src="../img/time.jpg"></a>
			    <a class="carousel-item" href="#two!"><img height=400px; src="../img/where.jpg"></a>
			    <a class="carousel-item" href="#three!"><img height=400px; src="../img/stadium.jpg"></a>
			    <a class="carousel-item" href="#four!"><img height=400px; src="../img/league.jpg"></a>
		  	</div>
	  	</div>
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
	
	<script>
		$(document).ready(function(){
			$(".dropdown-button").dropdown({belowOrigin: true});
			 
		})
	</script>
	  
</body>
</html>