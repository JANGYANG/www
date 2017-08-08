<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!--Import Google Icon Font-->
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="../../css/materialize.min.css"  media="screen,projection"/>
      <link type="text/css" rel="stylesheet" href="../../css/main.css"  media="screen,projection"/>
		
      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
      
       <!-- Compiled and minified CSS -->
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.1/css/materialize.min.css">
	
	  <!-- Compiled and minified JavaScript -->
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.1/js/materialize.min.js"></script>
	  
	   <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	   
	   <script type="text/javascript" src="../../js/materialize.min.js"></script>
	   <script type="text/javascript" src="../../js/main.js"></script>
	   
	   <!-- select2 -->
	  <script type="text/javascript" src="../../js/select2.js"></script>
	  <link rel="stylesheet" href="../../css/select2.css">
	  <script type="text/javascript" src="../../js/region.js"></script>
	  <script type="text/javascript" src="../../js/registerUserInfo.js"></script>
	  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Broken-glasses</title>
</head>
<body style="margin-bottom:1000px;">


  <div class="container">
    <div class="row">
      <div class="col m6 offset-m3 s8 offset-s2">
        <img src="../../img/logo_CI.png" alt="LOGIN" title="BG" style="width:100%;padding:30px">
      </div>
    </div>
  </div>

  <div class="container">
    <div class="row">
      <div class="col m6 offset-m3">
        <h6 style="text-align:center;">선수이름</h6>
        <h3 style="text-align:center;">
          <?php
          echo $user['name'];
          session_destroy();
           ?>
        </h3>
      </div>
    </div>
  </div>

  <form action="registerUserInfo.jsp" method="POST" onsubmit="return checkSubmit();">
    <input type="hidden" name="user_uid" value="<?php echo $user['unique_id'] ?>">
    <div class="container">
      <div class="row">
        <div class="col m6 offset-m3 s10 offset-s1" style="text-align:center;">
          <label for="birth">Birthday</label>
          <input class="form-control" style="text-align:center;"type="date" name="birth" id="birth">
        </div>
      </div>
      <div class="row">
        <div class="input-field col m3 offset-m3 s5 offset-s1">
          <label for="height">Height (Cm)</label>
          <input style="text-align:center;" type="number" name="height" id="height" value="">
        </div>
        <div class="input-field col m3 s5">
          <label for="weight">Weight (Kg)</label>
          <input style="text-align:center;" type="number" name="weight" id="weight" value="">
        </div>
      </div>

      <!-- 지역선택 -->
      <div class="row">
        <div class="col m6 offset-m3 s10 offset-s1" style="text-align:center;">
          <h5>Region</h5>
        </div>
        <!-- 도/시 -->
        <div class="col m3 offset-m3 s10 offset-s1">
          <label style="width:100%;background-color:black;">
            시/도
            <select id="mRegion_a" class="mRegion_a form-control"></select>
            <input type="hidden" name="region_a" id="region_a">
          </label>
        </div>
        <!-- 시/구 -->
        <div class="col m3 s10 offset-s1">
          <label style="width:100%">
            구/시/군
            <select disabled id="mRegion_b" class="mRegion_b form-control"></select>
            <input type="hidden" name="region_b" id=region_b>
          </label>
        </div>

      </div>

      <!-- 포지션 -->
      <div class="row">
        <div class="col m8 offset-m2 s10 offset-s1" style="text-align:center;">
          <h5 style="text-align:center;">POSITION</h5>
          <textbox class="btn mPosition" id="position_fw" style="border-radius:15px">FW</textbox>
          <textbox class="btn mPosition" id="position_md" style="border-radius:15px">MD</textbox>
          <textbox class="btn mPosition" id="position_df" style="border-radius:15px">DF</textbox>
          <textbox class="btn mPosition" id="position_gk" style="border-radius:15px">GK</textbox>
        </div>
        <input type="hidden" name="position" id="position">
      </div>
      <!-- 팀여부 -->
      <!-- <div class="row">
        <div class="col m6 offset-m3 s10 offset-s1" style="text-align:center;">
          <h6>DO you Have TEAM?</h6>
          <textbox class="btn mteam" id="team_yes">YES</textbox>
          <textbox class="btn mteam" id="team_no">NO</textbox>
          <input type="hidden" name="team" id="team" value="">
        </div>
      </div> -->

      <hr class="dashed_gray">

      <div class="row">
        <div class="col m6 offset-m3 s10 offset-s1" style="text-align:center;">
          <button type="submit" class="btn"name="button">NEXT</button>
        </div>
      </div>


    </div>
  </form>


</body>
</html>