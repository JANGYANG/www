<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>LOGIN</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/materialize.css"  media="screen,projection"/>
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/main.css"  media="screen,projection"/>
		
		<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/materialize.min.js"></script>
   <script>
	   $(function(){
		  	$('#btnLogin').click(function(){
			  var email = $('#email');
			  var password = $('#password').val();
				  console.log("password : " + password );
		           $.ajax({
		               type: "POST",
		               dataType: "json",
		               url: '<%=request.getContextPath()%>/UserLoginServlet',
		               data: {email: email.val(), password: password},
	
		               success: function(json){
		            	   	console.log("ajax success");
		            	   	if(json.error == false) {
		                  console.log("Available Email");
		                  console.log("Error: " + json.error);
		                  window.location.replace("../");
		            	   	}else{
		                  console.log("Unavailable Email");
			              console.log("Error: " + json.error);
						  alert("Please check your form  \n"+json.error_msg);
		                  email.focus();
		                }
		               },
		               error: function(){
		            	   	console.log('Ajax Error');
		               }
		           });
			});
	   });
	   </script>
</head>
<body>
	  <div class="container">
    <div class="row">
      <div class="col m6 offset-m3 s8 offset-s2">
        <img src="<%=request.getContextPath() %>/assets/img/logo_CI.png" alt="LOGIN" title="BG" style="width:100%">
      </div>
    </div>
  </div>

  <!-- <form action="../../UserLoginServlet" method="POST" id="form"> -->

  <div class="container">
    <div class="row">
      <div class="input-field col m6 offset-m3 s9 offset-s1">
        <input type="email" name="email" id="email" class="validate">
        <label for="icon_prefix">EMAIL</label>
      </div>
    </div>
  </div>
  <div class="container">
    <div class="row">
      <div class="input-field col m6 offset-m3 s9 offset-s1">
        <input type="password" name="password" id="password" class="validate">
        <label for="icon_prefix">PASSWORD</label>
      </div>
    </div>
  </div>
  <div class="container">
    <div class="row" style="text-align:center;">
      <p style="text-align:center;">
        <input type="checkbox" id="test5" />
        <label for="test5">REMEMVER ME!</label>
      </p>
      <button class="btn waves-effect waves-light" type="submit" name="login_button" id="btnLogin" style="width:50%;">
        LOGIN<i class="material-icons right">send</i>
      </button>
    </div>
    <div class="row">
      <hr class="dashed_gray">
    </div>
  </div>

  <!-- </form> -->

  <div class="container">
    <div class="row">
      <div class="col m3 offset-m3 s8 offset-s2">
        <a href="../register/signup.jsp"><button class="btn waves-effect waves-yellow" style="width:100%;">register<i class="material-icons right">person_add</i></button></a>
      </div>
      <div class="col m3 offset-m6 s8 offset-s2" style="margin-top:10px">
        <a href="<%=request.getContextPath() %>"><button class="btn waves-effect waves-light" style="width:100%">BACK<i class="material-icons right">subdirectory_arrow_left</i></button></a>
      </div>
    </div>
  </div>

	
	
	
	  
</body>
</html>