<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html>

<html lang="kor">
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

	  <script type="text/javascript" src="../../js/registerTeam.js"></script>
	  <style>
	  select{
	  display: inherit;
	  }
	  </style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Broken-glasses</title>
</head>

<body>


  <div class="container">
    <div class="row">
      <div class="col m6 offset-m3 s8 offset-s2">
        <img src="../../img/logo_CI.png" alt="LOGIN" title="BG" style="width:100%">
      </div>
    </div>
  </div>


  <form action="../../TeamRegisterServlet" method="POST" onsubmit='return checkSubmit();'>
  <!-- 팀이름 -->
  <div class="container">
    <div class="row">
      <div class="input-field col m6 offset-m3 s9 offset-s1">
        <input type="text" id="teamName" name="teamName" class="validate">
        <label for="icon_prefix">TeamName</label>
        <div id="teamNameCheck" class="btn" style="border-radius:15px;width:100%">Team name Check</div>
      </div>
    </div>
    <!-- 지역선택 -->
      <div class="row">
        <div class="col m6 offset-m3 s10 offset-s1" style="text-align:center;">
          <h5>Region</h5>
        
        	<br>
        		1지망 선호지역
			<select name="sido1" id="sido1"></select>
			<select name="gugun1" id="gugun1"></select>
			<!-- <input id="region1" name="region1"></input> -->
			<br>
			2지망 선호지역
			<select name="sido2" id="sido2"></select>
			<select name="gugun2" id="gugun2"></select>
			<!-- <input id="region2" name="region2"></input> -->
		</div>
      </div>      

      <div class="row">
        <div class="col m6 offset-m3 s10 offset-s1" style="text-align:center">
          <h5>TEAM BIRTH</h5>
          <select class="form-control" name="teamBirth" id="teamBirth" >
            <%
              for(int i=1980;i<2020;i++){
            %>
            <option value="<%=i%>"><%=i%></option>
            <%
              }
            %>
          </select>
        </div>
	</div>
</div>



<!-- 팀가입 버튼 -->
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
        <a href="#"><button id="back" class="btn waves-effect waves-light" style="width:100%">BACK<i class="material-icons right">subdirectory_arrow_left</i></button></a>
      </div>
    </div>
  </div>
<script>
$(document).ready(function(){
	$('#back').click(function(){
		window.history.back();});
})
</script>
</body>

</html>
