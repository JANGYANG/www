<%@ page import="com.bg.www.*"%>
<%@ page import="java.util.*" %>

<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String rootURL=request.getContextPath();
UserDAO uDAO = new UserDAO();
String userUID = (String)session.getAttribute("userUID");
if(userUID == null){
	response.sendRedirect(request.getContextPath()+"/soccer/login/");
}else{
	UserJson user = uDAO.findByUserUID((String)session.getAttribute("userUID").toString());
	if(user.getBirth() != null){
		response.sendRedirect(request.getContextPath()+"/soccer/");
	}else{
%>    
<!DOCTYPE html>
<html>
<head>
<!--Import Google Icon Font-->
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="<%=rootURL.toString() %>/css/materialize.css"  media="screen,projection"/>
      <link type="text/css" rel="stylesheet" href="<%=rootURL.toString() %>/css/main.css"  media="screen,projection"/>
		
      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	  
	   <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	   
	   <script type="text/javascript" src="<%=rootURL %>/js/materialize.min.js"></script>
	   <script type="text/javascript" src="<%=rootURL %>/js/main.js"></script>
	   
	   <!-- select2 -->

	  <script type="text/javascript" src="<%=rootURL %>/js/registerUserInfo.js"></script>
	  <style>
	  select{
	  display: inherit;
	  }
	  .mPosition{
	  background-color: #40b0df;
	  }
	  </style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Broken-glasses</title>
</head>
<body>

  <div class="container">
    <div class="row">
      <div class="col m6 offset-m3 s8 offset-s2">
        <img src="<%= rootURL %>/img/logo_CI.png" alt="LOGIN" title="BG" style="width:100%;padding:30px">
      </div>
    </div>
  </div>
  <div class="container">
    <div class="row">
      <div class="col m6 offset-m3">
        <h6 style="text-align:center;">선수이름</h6>
        <h3 style="text-align:center;">
        		<% 
        		out.println(user.getName());
        		%>
        </h3>
      </div>
    </div>
  </div>

  <form name="" action="<%=rootURL %>/UserRegisterServlet" method="POST" onsubmit="return checkSubmit();">
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
      <div class="row">
        <div class="col m6 offset-m3 s10 offset-s1" style="text-align:center;">
          <h5>Job</h5>
					<select name="job" id="job" class="job"></select>
				</div>
      </div>
     <!-- 지역선택 -->
      <div class="row">
        <div class="col m6 offset-m3 s10 offset-s1" style="text-align:center;">
          <h5>Region</h5>
	        <p>선호지역</p>
	        <section id="regionForm">
						<section id="region" style="margin-bottom:2%">
							<select name="mainRegion[]" id="" class="sido"></select>
							<select name="subRegion[]" id="" class="gugun"></select>
						</section>
					</section>
					<div class="btn" id="addRegion">추가하기</div>
				</div>
      </div>


      <!-- 포지션 -->
      <div class="row">
        <div class="col m8 offset-m2 s10 offset-s1" style="text-align:center;">
          <h5 style="text-align:center;">POSITION</h5>
          <div class="btn mPosition fw" style="border-radius:15px;width:25%;background-color:white;color:gray;">LFW</div>
          <div class="btn mPosition fw" style="border-radius:15px;width:25%;background-color:white;color:gray;">CFW</div>
          <div class="btn mPosition fw" style="border-radius:15px;width:25%;background-color:white;color:gray;">RFW</div>
          <br><br>
          <div class="btn mPosition md" style="border-radius:15px;width:25%;background-color:white;color:gray;">ACM</div>
          <br><br>
          <div class="btn mPosition md" style="border-radius:15px;width:25%;background-color:white;color:gray;">LWM</div>
          <div class="btn mPosition md" style="border-radius:15px;width:25%;background-color:white;color:gray;">CM</div>
          <div class="btn mPosition md" style="border-radius:15px;width:25%;background-color:white;color:gray;">RWM</div>
          <br><br>
          <div class="btn mPosition md" style="border-radius:15px;width:25%;background-color:white;color:gray;">DCM</div>
          <br><br>
          <div class="btn mPosition d" style="border-radius:15px;width:25%;background-color:white;color:gray;">LB</div>
          <div class="btn mPosition d" style="border-radius:15px;width:25%;background-color:white;color:gray;">CD</div>
          <div class="btn mPosition d" style="border-radius:15px;width:25%;background-color:white;color:gray;">RB</div>
          <br><br>
          <div class="btn mPosition gk" style="border-radius:15px;width:25%;background-color:white;color:gray;">GK</div>
        </div>
        <input type="hidden" name="position" id="position">
      </div>
		
	      <hr class="dashed_gray">
	
	      <div class="row">
	        <div class="col m6 offset-m3 s10 offset-s1" style="text-align:center;">
	          <button type="submit" class="btn"name="button">선수등록</button>
	        </div>
	      </div>
	   </div>
</form>
		
<script type="text/javascript">
 
$('document').ready(function() {
	var job = ["고등학생","대학생","회사원","자영업자","IT","금융업계","화학","선생님"]
	
   var area0 = ["시/도 선택","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
   var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
   var area2 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
   var area3 = ["대덕구","동구","서구","유성구","중구"];
   var area4 = ["광산구","남구","동구","북구","서구"];
   var area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
   var area6 = ["남구","동구","북구","중구","울주군"];
   var area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
   var area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
   var area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
   var area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
   var area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
   var area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
   var area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
   var area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
   var area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
   var area16 = ["서귀포시","제주시","남제주군","북제주군"];
 
   $("#job").each(function(){
	  $job = $(this);
	  $.each(eval(job), function(){
		  $job.append("<option value='"+this+"'>"+this+"</option>");
	  });
   });
   
	 // 시/도 선택 박스 초기화
	 $("select[name^=mainRegion]").each(function() {
	  $selsido = $(this);
	  $.each(eval(area0), function() {
	   $selsido.append("<option value='"+this+"'>"+this+"</option>");
	  });
	  $selsido.next().append("<option value=''>구/군 선택</option>");
	 });
	 
	 // 시/도 선택시 구/군 설정
	 $("select[name^=mainRegion]").change(function() {
	  var area = "area"+$("option",$(this)).index($("option:selected",$(this)));// 선택지역의 구군 Array
	  
	  var $gugun = $(this).next(); // 선택영역 군구 객체
	  $("option",$gugun).remove(); // 구군 초기화
	  if(area == "area0")
	   $gugun.append("<option value=''>구/군 선택</option>");
	  else {
	
		 $(this).next().append("<option selected disabled value=''>구/군 선택</option>");
	   $.each(eval(area), function() {
		
	    $gugun.append("<option value='"+this+"'>"+this+"</option>");
	   });
	  }
	  
	  $(".gugun").change(function(){
		  var obj = new Object();
		  obj.sido = $(this).prev().val();
		  obj.gugun = $(this).val();
		  obj = JSON.stringify(obj);
		  $(this).next().val(obj);
	  });
	});

	 $("#addRegion").click(function(){
		$('#region').clone().appendTo('#regionForm');
		$("select[name^=mainRegion]").each(function() {
			  $selsido = $(this);
			  $.each(eval(area0), function() {
			   $selsido.append("<option value='"+this+"'>"+this+"</option>");
			  });
			  $selsido.next().append("<option value=''>구/군 선택</option>");
			 });
			 
			 // 시/도 선택시 구/군 설정
			 $("select[name^=mainRegion]").change(function() {
			  var area = "area"+$("option",$(this)).index($("option:selected",$(this)));// 선택지역의 구군 Array
			  var $gugun = $(this).next(); // 선택영역 군구 객체
			  $("option",$gugun).remove(); // 구군 초기화
			  if(area == "area0")
			   $gugun.append("<option value=''>구/군 선택</option>");
			  else {
				 $(this).next().append("<option selected disabled value=''>구/군 선택</option>");
			   $.each(eval(area), function() {
				
			    $gugun.append("<option value='"+this+"'>"+this+"</option>");
			   });
			  }
			 });
	});
	 var positionArray = [];
	 
	 $(".mPosition").each(function(){
			$(this).click(function(){
				if($(this).css("background-color") == "rgb(255, 255, 255)"){
					console.log($(this).text());
					positionArray.push($(this).text());
					if($(this).hasClass('fw')){
						$(this).css("background-color","red");
						$(this).css("color","white");
						
					}else if($(this).hasClass('md')){
						$(this).css("background-color","orange");
						$(this).css("color","white");
					}else if($(this).hasClass('d')){
						$(this).css("background-color","blue");
						$(this).css("color","white");
					}else{
						$(this).css("background-color","green");
						$(this).css("color","white");
					}
				}else{
					$(this).css("background-color","#FFFFFF"); 
					$(this).css("color","gray");
					var deletePosition = $(this).text();
					positionArray = jQuery.grep(positionArray,function(n,i){
						return n !== deletePosition;
					});
				}
				$("#position").val(positionArray);
			});
		}); 
	 
	 
	 
	 
});
function checkSubmit(){
	var submit = true;
	
	var birth = $('#birth').val();
	var height = $('#height').val();
	var weight = $('#weight').val();
	var position = $('#position').val();
	
	$('select[name^=sub]').each(function(){
		console.log($(this).val());
		if($(this).val() == null){
			submit = false;
		}
	});
	
	console.log("birth : "+ birth);
	console.log("height : " + height);
	console.log("weight : " + weight);
	console.log("position : " + position);
	
	if(birth == '' || height == '' || weight == '' || position == ''){
		submit = false	
	}
	
	return submit;
	
}
</script>
 



	</body>   
</html>

<%
	}
}
%>