<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<header>
	<div class="navbar-fixed">
		<nav class="blue darken-1">
			<div class= "nav-wrapper">
				<a href="<%=request.getContextPath() %>" class="brand-logo">FIND_B</a>
				<a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
				<ul class="right hide-on-med-and-down">
				  <li><a href="<%=request.getContextPath() %>/demo_site/player/playerViewpage.jsp">PLAYER</a></li>
				  <li><a href="<%=request.getContextPath() %>/demo_site/team/playerViewpage.jsp">TEAM</a></li>
				  <li><a href="<%=request.getContextPath() %>/demo_site/match/matchViewpage.jsp">MATCH</a></li>
				  <li><a href="#">B.LAB</a></li>
				</ul>
				<ul class="side-nav" id="nav-mobile">
				  <li><a href="<%=request.getContextPath() %>/demo_site/player/playerViewpage.jsp">PLAYER</a></li>
				  <li><a href="<%=request.getContextPath() %>/demo_site/team/playerViewpage.jsp">TEAM</a></li>
				  <li><a href="<%=request.getContextPath() %>/demo_site/match/matchViewpage.jsp">MATCH</a></li>
				 <li><a href="#">B.LAB</a></li>
				</ul>
			</div>
			
		</nav>
	</div>
</header>
<script>
$( document ).ready(function(){
	 $(".button-collapse").sideNav();
})
</script>