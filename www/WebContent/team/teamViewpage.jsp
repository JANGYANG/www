<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/materialize.css"  media="screen,projection"/>
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/custom.css"  media="screen,projection"/>

	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/assets/js/materialize.js"></script>
	
	<title>FIND_B</title>
	
	
</head>
<body style="background-color:#5da2d4" >
<jsp:include page="/headNav.jsp"></jsp:include>
<div class="center white-text" style="margin-top:100px">
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

	<div class="row center">
		<div class="col l10">
			<div class="section row ">
				<div class="col s5 line">
					<div class="card">
						<img src="<%= request.getContextPath() %>/assets/img/logo_CI.png" alt="" class="img-l">
					</div>
				</div>
				<div class="col l6 ">
					<div class="card">
					Hello world
					</div>
				</div>	
			</div>
			<div class="divider"></div>
			<div class="section row center">
				<div class="col l5 margin-m line">
					<ul>
						<li>	
							<div class="valign-wrapper card">
								<img src="<%= request.getContextPath() %>/assets/img/player.png" alt="" class="col s3 responsive-img circle">
								<div class="col s5">GK- 이민규</div> 
								<img src="<%= request.getContextPath() %>/assets/img/uniform.png" alt="" class="col s3 responsive-img circle"> 
							</div> 
							
						</li>
						<li> 
							<div class="valign-wrapper card">
								<img src="<%= request.getContextPath() %>/assets/img/player.png" alt="" class="col s3 responsive-img circle">
								<div class="col s5">GK- 이민규</div> 
								<img src="<%= request.getContextPath() %>/assets/img/uniform.png" alt="" class="col s3 responsive-img circle"> 
							</div> 
						</li>
						<li> 
							<div class="valign-wrapper card">
								<img src="<%= request.getContextPath() %>/assets/img/player.png" alt="" class="col s3 responsive-img circle">
								<div class="col s5">GK- 이민규</div> 
								<img src="<%= request.getContextPath() %>/assets/img/uniform.png" alt="" class="col s3 responsive-img circle"> 
							</div> 
						</li>
						<li> 
							<div class="valign-wrapper card">
								<img src="<%= request.getContextPath() %>/assets/img/player.png" alt="" class="col s3 responsive-img circle">
								<div class="col s5">GK- 이민규</div> 
								<img src="<%= request.getContextPath() %>/assets/img/uniform.png" alt="" class="col s3 responsive-img circle"> 
							</div> 
						</li>
					</ul>
				</div>
				<div class="col l6 margin-m">
					<ul>
						<li>
							<div class="row card">
								<div class="margin-v valign-wrapper">
									<div class="col s3 ">
										<img src="<%= request.getContextPath() %>/assets/img/player.png" alt="" class="responsive-img circle margin-v">
									</div>
									<div class="col s6">										
											<div class="col s5"><span>FC 부러진안경</span> </div>
											<div class="col s2">1:0</div>
											<div class="col s5">FC장양 </div>										
									</div>
									<div class="col s3 ">
									<img src="<%= request.getContextPath() %>/assets/img/player.png" alt="" class="responsive-img circle margin-v">
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="row card">
								<div class="margin-v valign-wrapper">
									<div class="col s3 ">
										<img src="<%= request.getContextPath() %>/assets/img/player.png" alt="" class="responsive-img circle margin-v">
									</div>
									<div class="col s6 ">										
											<div class="col s5"><span>FC 부러진안경</span> </div>
											<div class="col s2">1:0</div>
											<div class="col s5">FC장양 </div>										
									</div>
									<div class="col s3 ">
									<img src="<%= request.getContextPath() %>/assets/img/player.png" alt="" class="responsive-img circle margin-v">
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="row card">
								<div class="margin-v valign-wrapper">
									<div class="col s3 ">
										<img src="<%= request.getContextPath() %>/assets/img/player.png" alt="" class="responsive-img circle margin-v">
									</div>
									<div class="col s6">
											<div class="col s5"><span>FC 부러진안경</span> </div>
											<div class="col s2">1:0</div>
											<div class="col s5">FC장양 </div>
									</div>
									<div class="col s3 ">
									<img src="<%= request.getContextPath() %>/assets/img/player.png" alt="" class="responsive-img circle margin-v">
									</div>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	
		<div class="section col l2 ">
				<div class="banner card valign-wrapper hide-on-med-and-down">광고 </div>
		</div>
		<div class="col s12 hide-on-large-only">
			<div class="card"> 광고  </div>
		</div>
	</div>
</body>
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
  	
</script>

</html>