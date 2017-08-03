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
	   
	   <script type="text/javascript" src="../../js/materialize.min.js"></script>
	   
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BROKEN-GLASSES REGISTER</title>
</head>
<body>


  <div class="container">
    <div class="row">
      <div class="col m6 offset-m3 s8 offset-s2">
        <img src="../../img/logo_CI.png" alt="LOGIN" title="BG" style="width:100%">
      </div>
    </div>
  </div>


  <form action="../../UserRegisterServlet" method="POST">
  <!-- 이메일 -->
  <div class="container">
    <div class="row">
      <div class="input-field col m6 offset-m3 s9 offset-s1">
        <input type="email" id="email" name="email" class="validate">
        <label for="icon_prefix">EMAIL</label>
        <textbox id="emailCheck" class="btn" style="border-radius:15px;width:100%">eMail Check</textbox>
      </div>
    </div>
  </div>
  <!-- 이름 -->
  <div class="container">
    <div class="row">
      <div class="input-field col m6 offset-m3 s9 offset-s1">
        <input type="text" id="name" name="name" class="validate">
        <label for="icon_prefix">NAME</label>
      </div>
    </div>
  </div>
  <!-- 비밀번호 -->
  <div class="container">
    <div class="row">
      <div class="input-field col m6 offset-m3 s9 offset-s1">
        <input type="password" id="password" name="password" class="validate" id="password">
        <label for="icon_prefix">PASSWORD</label>
      </div>
    </div>
    <div class="row">
      <div class="input-field col m6 offset-m3 s9 offset-s1">
        <input type="password" name="password_confirm" class="validate" id="password_confirm">
        <label for="icon_prefix">PASSWORD CONFIRM</label>
        <textbox id="password_comment" class="btn" style="border-radius:15px;width:100%;pointer-events:none;">PASSWORD CONFIRM</textbox>
      </div>
    </div>
  </div>

<!-- 회원가입 버튼 -->
    <div class="container">
      <div class="row">
        <div class="col m6 offset-m3 s8 offset-s2">
          <button type="submit" id="register_btn" class="btn waves-effect waves-yellow" style="width:100%;">register<i class="material-icons right">person_add</i></button>
        </div>
      </div>
      <div class="row">
        <hr class="dashed_gray">
      </div>
    </div>

  </form>
	<!-- 이건 무슨버튼이죠? -->
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
   

  <!-- 뒤로가기 -->
  <div class="container">
    <div class="row">
      <div class="col m3 offset-m6 s8 offset-s2" style="margin-top:10px">
        <a href="../login/index.jsp"><button class="btn waves-effect waves-light" style="width:100%">BACK<i class="material-icons right">subdirectory_arrow_left</i></button></a>
      </div>
    </div>
  </div>

</body>
</html>