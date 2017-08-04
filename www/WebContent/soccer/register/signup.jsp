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


<script type="text/javascript">
$(function(){
    //아이디 중복 확인 소스
    var name = $('#name');
    var email = $('#email');
    var emailCheck = $('#emailCheck');
    var password = $('#password');
    var password_confirm = $('#password_confirm');
    var password_comment = $('#password_comment');
    var register_btn = $('#register_btn');


    // 이메일 중복 검사
    emailCheck.click(function(){
           console.log("email : "+email.val());

           $.ajax({
               type: "POST",
               dataType: "json",
               url: '../../UserRegisterServlet',
               data: {email: email.val()},

               success: function (json) {
                 console.log("ajax success")
                if(json.error == false) {
                  console.log("Available Email");
                  console.log("Error: " + json.error);
                  emailCheck.text('사용가능한 아이디 입니다.');
                  emailCheck.css("background-color","#40b0df");
                }else{
                  console.log("Unavailable Email");
                  console.log("Error: " + json.error);
                  console.log(json.error_msg);
                  emailCheck.css("background-color","red");
                  emailCheck.text('다른 아이디를 입력해 주세요.');
                  console.log(emailCheck.css("background-color"));
                  email.focus();
                }
               },

               error: function(){
                 console.log('Ajax Error');
               }
           });
       });
      //이메일 유효성 검사
      email.blur(function(){
        var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
        if(regex.test(email.val()) === false){
          emailCheck.text('Incorrect EMAIL');
          emailCheck.css("background-color","red");
        }else{
          emailCheck.text('Check EMAIL');
          emailCheck.css("background-color","#2bbbad");
        }
      });

    //비밀번호 유효성 체크
    password_confirm.blur(function(){
      if(password.val() == "" || password_confirm.val() == ""){
         password_comment.css("background-color","red");
         password_comment.text('비밀번호를 입력해주세요.');
      }else if(password.val() == password_confirm.val()){
          password_comment.text('비밀번호가 일치합니다.');
          password_comment.css("background-color","#40b0df");
          //  pwCheck2.val('1');
       }else{
          password_comment.css("background-color","red");
          password_comment.text('비밀번호가 일치하지 않습니다.');
       }
    });
    password.blur(function(){
      if(password.val() == ""){
         password_comment.css("background-color","red");
         password_comment.text('비밀번호를 입력해주세요.');
      }else if(password.val() == password_confirm.val()){
          password_comment.text('비밀번호가 일치합니다.');
          password_comment.css("background-color","#40b0df");
          //  pwCheck2.val('1');
       }else{
          password_comment.css("background-color","red");
          password_comment.text('비밀번호가 일치하지 않습니다.');
       }
    });

});

function checkSubmit(){
  var name = $('#name');
  var email = $('#email');
  var emailCheck = $('#emailCheck');
  var password = $('#password');
  var password_confirm = $('#password_confirm');
  var password_comment = $('#password_comment');

  if(email.val() == "" || name.val() == "" || password.val() == "" || password_confirm.val() == ""){
    alert("Fill the Form");
    $(".alert").alert();
    console.log("fill the form");
    return false;
  }else if(emailCheck.css("background-color") == "rgb(255, 0, 0)" || password_comment.css("background-color") == "rgb(255, 0, 0)"){
    alert("Check your FORM");
    console.log("check form");
    return false;
  }else if(emailCheck.css("background-color") == 'rgb(64, 176, 223)' && password_comment.css("background-color") == 'rgb(64, 176, 223)'){
    console.log("emailCheck color = " + emailCheck.css("background-color"));
    console.log("password color = " + password_comment.css("background-color"));
    console.log("ok");
    return true;
  }
  console.log("emailCheck color = " + emailCheck.css("background-color"));
  console.log("password color = " + password_comment.css("background-color"));
  return false;
}

</script>
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