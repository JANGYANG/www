<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bg.www.UserDAO" %>
<%@page import="com.bg.www.UserJson" %>
<%
	UserDAO userDAO = new UserDAO();
	UserJson user = new UserJson();
	String teamName = (String)session.getAttribute("teamName");
	String userUID = (String)session.getAttribute("userUID");
	ArrayList<UserJson> userList = new ArrayList<UserJson>();
	userList = userDAO.findByTeamName(teamName);
%>

<!DOCTYPE html>


<html>
<head>
<!--Import Google Icon Font-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!--Import materialize.css-->
<link type="text/css" rel="stylesheet"
	href="../../css/materialize.min.css" media="screen,projection" />
<link type="text/css" rel="stylesheet" href="../../css/main.css"
	media="screen,projection" />

<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<script async type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script async type="text/javascript" src="../../js/materialize.min.js"></script>
<script async type="text/javascript" src="../../js/register.js"></script>


<!-- swiper 넘기는 효과 -->
<link type="text/css" rel="stylesheet" href="../../css/swiper.css">
<script type="text/javascript" src="../../js/swiper.jquery.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BROKEN-GLASSES REGISTER</title>


<style type="text/css">
.swiper-container {
	height: 50%;
	width: 80%;
}

select {
	display: inherit;
}
</style>

<script type="text/javascript">
var pageOk = new Array();
for(i=0;i<6;i++){
	pageOk[i] = 0;
}
var pageNation = 1;
function able(){
	$("#pageNext").attr("disabled",false);
}; 
function disable(){
	$("#pageNext").attr("disabled",true);
};
function pageDefault(){
	if(pageNation == 1){
		$("#pagePrev").attr("disabled",true);
		$("#pageNext").attr("disabled",true);
	}else{
		$("#pagePrev").attr("disabled",false);
		$("#pageNext").attr("disabled",true);
	}
};
function next(){
	pageNation++;
	pageDefault();
};
function prev(){
	pageNation--;
	pageDefault();
};

$(document).ready(function() {
	$("#pageNext").click(function(){
		pageOk[pageNation-1] = 1;
		next();
		if(pageOk[pageNation-1] == 1){
			able();
		}
	});
	$("#pagePrev").click(function(){
		prev();
		able();
	});
	$(".dateForm").click(function(){
		able();
	});
	$(".player").click(function(){
		if($(".player:checked").length >= 3){
			able();	
		}else{
			disable();
		}
	});
	$(".score").click(function(){
		able();
	});
	/* home팀인지 */
	var homeYes = $('#homeYes');
	var homeNo = $("#homeNo");
	homeYes.click(function(){
		$("#opponent").empty();
		$("#homeOrAway").val(1);
		$("#homeScore").text('<%=session.getAttribute("teamName")%>');
		homeYes.css("background-color","red");
		homeNo.css("background-color","gray");
		able();
	});
	homeNo.click(function(){
		$("#opponent").empty();
		$("#homeOrAway").val(0);
		$("#AwayScore").text('<%=session.getAttribute("teamName")%>');
		homeNo.css("background-color", "red");
		homeYes.css("background-color", "gray")
		able();
	});

	$("#searchTeam").keyup(function(){
		teamName = $('#searchTeam').val();
		$("#teams").empty();
		$.ajax({
			type : "POST",
			dataType : "json",
			url : '../../TeamSearchServlet',
			data : {
				teamName : teamName
			},
			success : function(json) {
				console.log("ajax success");
				console.log(json);
				console.log(json.length);
				console.log(json[0]);
				console.log(json[0]["teamName"]);
				$.each(json, function(key, val) {
					$('#teams').append(
							"<div class='btn teams' onclick='opponent(this)'>"
									+ val["teamName"] + "</div>")
				});
			},
			error : function() {
				console.log('Ajax Error');
			}
		});
	});
	
	$("#searchStadium")	.keyup(function(){
		stadium = $("#searchStadium").val();
		$("#stadiums").empty();
		$.ajax({
			type : "GET",
			dataType : "json",
			url : '/NaverSearchRegionServlet',
			data : {
				stadium : stadium
			},
			success : function(json) {
				console.log("ajax success");
				console.log(json);
				console.log(json.items[0].title)
				$.each(json.items, function(key, val) {
					$('#stadiums').append(
							"<div class='btn teams' onclick='selectStadium(this)'>"
									+ val["title"] + "</div>")
				});
			},
			error : function() {
				console.log('Ajax Error');
			}
		});
	});
});

function opponent(e) {
	$("#opponent").empty();
	$('#opponent').append("<div class='btn'>" + e.innerHTML + "</div>");
	$('#opponentTeam').val(e.innerHTML);
	able();
	if ($('#homeOrAway').val() == "1") {
		$('#awayScore').text(e.innerHTML);
	} else {
		$('#homeScore').text(e.innerHTML);
	}
};

function selectStadium(e) {
	$("#stadiumDiv").empty();
	$('#stadiumDiv').append("<div class='btn'>" + e.innerText + "</div>");
	$("#stadium").val(e.innerText);
	able();
};

function check(){
	for(i = 0; i<pageOk.length;i++){
		if(pageOk[i] == 0){
			return false;
		}
	}
	return true;
}

</script>

</head>
<body>
	<div class="container">
		<div class="row" style="text-align:center;">
			<div class="col m6 offset-m3 s8 offset-s2">
				<img src="../../img/logo_CI.png" alt="LOGIN" title="BG"
					style="width: 50%">
			</div>
		</div>
	</div>
	
	<form action="../../MatchRegisterServlet" id="matchForm" onsubmit="return check();"method="POST">
	<div class="swiper-container">
		<!-- Additional required wrapper -->
		<div style="padding:0;"class="swiper-wrapper">
			<!-- Slides -->
			<div class="swiper-slide" style="text-align:center;vertical-align:middle;">
				<div style="padding:3%">
				<div id="1"></div>
					<h1 style="text-align:center;">당신의 팀은 홈팀입니까?</h1>
					<div style="text-align:center;" class="btn" id="homeYes">YES</div>
					<div style="text-align:center;" class="btn" id="homeNo">NO</div>
					<input type="text" name=homeOrAway id="homeOrAway"></input>
				</div>	
			</div>
			
			<div class="swiper-slide">
				<div style="padding:3%">
					<div id="2"></div>
					<h1>상대팀을 골라주세요.</h1>
					<div id="opponent"></div>
					<input type="text" id="searchTeam"></input>
					<div id="teams"></div>
					<input type="text" name="opponentTeam" id="opponentTeam"></input>
				</div>
			</div>
			
			<div class="swiper-slide">
			<div id="3"></div>
				<h1>경기 시간을 선택해주세요.</h1>
				<label>경기 날짜</label><br>
				<div style="width:33%;display:inline-block;">
				<select class="form-control" name="matchDateYear" form="matchForm">
					<option value="2017">2017 년</option>
				</select>
				</div>
				<div style="width:33%;display:inline-block;">
				<select class="form-control dateForm" name="matchDateMonth" form="matchForm">
					<%
						for (int i = 1; i <= 12; i++) {
					%>
					<option value="<%=i%>"><%=i%> 월</option>
					<%
						}
					%>
				</select>
				</div>
				<div style="width:33%;display:inline-block;">
				<select class="form-control dateForm" name="matchDateDay" form="matchForm">
					<%
						for (int i = 1; i <= 31; i++) {
					%>
					<option value="<%=i%>"><%=i%> 일</option>
					<%
						}
					%>
				</select>
				</div>
				<h6>
					<input name="matchType" type="radio" id="test0" checked value="1"/> <label for="test0">단판</label>
					<input name="matchType" type="radio" id="test1" checked value="2"/> <label for="test1">전반 / 후반</label>
					<input name="matchType" type="radio" id="test2" value="3"/> <label for="test2">3 세트</label>
					<input name="matchType" type="radio" id="test3" value="4"/> <label for="test3">4 세트</label>
				</h6>
				
				<label>경기시간</label>
				<select class="form-control dateForm" name="playingTime" form="matchForm">
					<%
						for (int i = 4; i <= 12; i++) {
					%>
					<option value="<%=i * 5%>"><%=i * 5%> 분</option>
					<%
						}
					%>
				</select>
			</div>
			
			<div class="swiper-slide">
			<div id="4"></div>
				<h1>경기장을 골라주세요.</h1>
				<div id="stadiumDiv"></div>
				<input type="text" id="searchStadium" placeholder="운동장으로 검색해주세요."></input>
				<input type="text" name="stadium" id="stadium"></input>
				<div id="stadiums"></div>
			</div>
			
			<div class="swiper-slide">
			<div id="5"></div>
				<h1>출전 선수는 누구입니까?</h1>
				<%for(int i = 0; i < userList.size(); i++){ %>
				<h6>
					<input name="player" class="player" type="checkbox" id="member<%=i %>" value="<%=userList.get(i).getUserUID() %>"/> <label for="member<%=i%>"><%=userList.get(i).getName() %></label>
				</h6>
				<%} %>
			</div>
			
			<div class="swiper-slide">
			<div id="6"></div>
				<h1>최종 스코어를 알려주세요.</h1>
				<label class="scoreLabel" id="homeScore">HOME</label>
				<select class="form-control score" name="homeScore" form="matchForm" style="width:50%;">
					<%
						for (int i = 0; i < 13; i++) {
					%>
					<option value="<%=i%>"><%=i%> </option>
					<%
						}
					%>
				</select>
				<label class="scoreLabel" id="awayScore">AWAY</label>
				<select class="form-control score" name="awayScore" form="matchForm" style="width:50%;">
					<%
						for (int i = 0; i < 13; i++) {
					%>
					<option value="<%=i%>"><%=i%> </option>
					<%
						}
					%>
				</select>
			</div>
			
			<div class="swiper-slide">
			<div id="7"></div>
				<h1>경기를 기록합니다.</h1>
				<button class="btn" id="submit">기록</button>
			</div>
		</div>
		<!-- If we need pagination -->
		<div class="swiper-pagination"></div>
		
		<div disabled style="position: fixed;right:51%;"class="btn pagePrev" id="pagePrev">이전</div>
		<div disabled style="position: fixed;left:51%;"class="btn pageNext" id="pageNext">다음</div>
		<script>
			var mySwiper = new Swiper('.swiper-container', {
				// Optional parameters
				direction : 'horizontal',
				loop : false,
				onlyExternal : true,

				mousewheelControl : false,

				// Navigation arrows
				nextButton : '.pageNext',
				prevButton : '.pagePrev'

			});
		</script>
	</div>
</form>
</body>
</html>