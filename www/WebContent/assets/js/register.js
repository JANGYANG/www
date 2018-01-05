$(function(){
	
	console.log(document.location.origin);
	
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
               url: '/www/servlet/UserRegisterServlet',
               data: {email: email.val()},

               success: function(json){
            	   	console.log("ajax success");
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
                  emailCheck.text('다른 아이디 입력해 주세요.');
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
        if(regex.test(email.val()) === false || email.val() == ""){
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
$(document).ready(function(){
	$("#register_btn").click(function(){
		function checkbutton(){
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
			  }else if(emailCheck.css("background-color") == 'rgb(64, 176, 223)' && password_comment.css("background-color") == 'rgb(64, 176, 223)'
				 ){
			    console.log("emailCheck color = " + emailCheck.css("background-color"));
			    console.log("password color = " + password_comment.css("background-color"));
			    console.log("ok");
			    return true;
			  }
			  console.log("emailCheck color = " + emailCheck.css("background-color"));
			  console.log("password color = " + password_comment.css("background-color"));
			  return false;
			}

	})
	setInterval(checkSubmit,500);
})
function checkSubmit(){
  var name = $('#name');
  var email = $('#email');
  var emailCheck = $('#emailCheck');
  var password = $('#password');
  var password_confirm = $('#password_confirm');
  var password_comment = $('#password_comment');

  if (emailCheck.css("background-color") == 'rgb(64, 176, 223)' && password_comment.css("background-color") == 'rgb(64, 176, 223)' && name.val() != ""
	  && email.css("border-bottom") != "#F44336"){
	  $("#register_btn").removeClass("disabled");
  }
}


	