$(function(){

});


$(document).ready(function() {
  console.log("Called registerUserInfo.js")

  var mRegion_a = $('#mRegion_a');
  var mRegion_b = $('#mRegion_b');
  var region_a = $('#region_a');
  var region_b = $('#region_b');
  var position = $('#position');
  var mPosition = $('.mPosition');
  var position_fw = $('#position_fw');
  var position_md = $('#position_md');
  var position_df = $('#position_df');
  var position_gk = $('#position_gk');
  var varPosition = position.val();
  // var team_yes = $('#team_yes');
  // var team_no = $('#team_no');
  // var team = $('#team');


  // 포지션
  position_fw.click(function(){
    if(varPosition != "fw"){
      mPosition.css("background-color","#2bbbad");
      position_fw.css("background-color","red");
      varPosition = "fw";
      position.val(varPosition);
    }else{
      position_fw.css("background-color","#2bbbad");
      varPosition = null;
      position.val(varPosition);
    }
  });
  position_md.click(function(){
    if(varPosition != "md"){
      mPosition.css("background-color","#2bbbad");
      position_md.css("background-color","green");
      varPosition = "md";
      position.val(varPosition);
    }else{
      position_md.css("background-color","#2bbbad");
      varPosition = null;
      position.val(varPosition);
    }
  });
  position_df.click(function(){
    if(varPosition != "df"){
      mPosition.css("background-color","#2bbbad");
      position_df.css("background-color","blue");
      varPosition = "df";
      position.val(varPosition);
    }else{
      position_df.css("background-color","#2bbbad");
      varPosition = null;
      position.val(varPosition);
    }
  });
  position_gk.click(function(){
    if(varPosition != "gk"){
      mPosition.css("background-color","#2bbbad");
      position_gk.css("background-color","orange");
      varPosition = "gk";
      position.val(varPosition);
    }else{
      position_gk.css("background-color","#2bbbad");
      varPosition = null;
      position.val(varPosition);
    }
  });





  // team_yes.click(function(){
  //   var varTeam = 1;
  //   team.val(varTeam);
  //   team_yes.css("background-color","#40b0df");
  //   team_no.css("background-color","#2bbbad");
  // });
  // team_no.click(function(){
  //   var varTeam = 0;
  //   team.val(varTeam);
  //   team_no.css("background-color","#40b0df");
  //   team_yes.css("background-color","#2bbbad");
  // });




});
function checkSubmit(){
  var birth = $('#birth').val();
  var height = $('#height').val();
  var weight = $('#weight').val();
  var region_a = $('#region_a').val();
  var region_b = $('#region_b').val();
  var position = $('#position').val();
  // var team = $('#team').val();

  console.log(birth);
  console.log(height);
  console.log(weight);
  console.log(region_a);
  console.log(region_b);
  console.log(position);
  // console.log(team);

  // if (birth != '' && height != '' && weight != '' && region_a != '' && region_b != '' && position != '' && team != ''){
  //   return true;
  // }else{
  //   alert("Check your Form");
  //   return false;
  // }

  if (birth != '' && height != '' && weight != '' && region_a != '' && region_b != '' && position != ''){
    return true;
  }else{
    alert("Check your Form");
    return false;
  }
};
