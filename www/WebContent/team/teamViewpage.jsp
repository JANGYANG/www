<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/materialize.css"  media="screen,projection"/>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/assets/js/materialize.js"></script>
	
	<title>FIND_B</title>
	
	
</head>
<body style="background-color:#5da2d4" >
	<div class="row center">
		<div class="col l10">
			<div class="section row ">
				<div class="col s5 margin-m line">
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
							<div class="valign-wrapper">
								<img src="<%= request.getContextPath() %>/assets/img/player.png" alt="" class="col s3 responsive-img">
								<div class="col s5">GK- 이민규</div> 
								<img src="<%= request.getContextPath() %>/assets/img/uniform.png" alt="" class="col s3 responsive-img"> 
							</div> 
							
						</li>
						<li> 
							<div class="valign-wrapper">
								<img src="<%= request.getContextPath() %>/assets/img/player.png" alt="" class="col s3 responsive-img">
								<div class="col s5">GK- 이민규</div> 
								<img src="<%= request.getContextPath() %>/assets/img/uniform.png" alt="" class="col s3 responsive-img"> 
							</div> 
						</li>
						<li> 
							<div class="valign-wrapper">
								<img src="<%= request.getContextPath() %>/assets/img/player.png" alt="" class="col s3 responsive-img">
								<div class="col s5">GK- 이민규</div> 
								<img src="<%= request.getContextPath() %>/assets/img/uniform.png" alt="" class="col s3 responsive-img"> 
							</div> 
						</li>
						<li> 
							<div class="valign-wrapper">
								<img src="<%= request.getContextPath() %>/assets/img/player.png" alt="" class="col s3 responsive-img">
								<div class="col s5">GK- 이민규</div> 
								<img src="<%= request.getContextPath() %>/assets/img/uniform.png" alt="" class="col s3 responsive-img"> 
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
	
		<div class="section col l2">
				<div class="banner card valign-wrapper">광고 </div>
		</div>
	</div>
	
	
	
</body>

<style>
.carding{padding: 30px; margin:10px; }
.line{border-right: 3px solid}
.img-l{width:150px; height: 150px;}
.img-mid{width:100px; width: 100px;}
.img-sm{width:50px; height:50px;}
.banner{height: 500px;}
.margin-m{margin:10px;}
.margin-v{margin-top: 10px; margin-bottom: 10px;}
.parent-h{height: inherit;}
</style>

</html>