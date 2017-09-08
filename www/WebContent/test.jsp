<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!--Import Google Icon Font-->
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="./css/materialize.min.css"  media="screen,projection"/>
      <link type="text/css" rel="stylesheet" href="./css/main.css"  media="screen,projection"/>
		
      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
      
       <!-- Compiled and minified CSS -->
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.1/css/materialize.min.css">
	
	  <!-- Compiled and minified JavaScript -->
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.1/js/materialize.min.js"></script>
	  
	   <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	   
	   <script type="text/javascript" src="./js/materialize.min.js"></script>
	   <script type="text/javascript" src="./js/main.js"></script>
	   
	   <script type="text/javascript" src="./js/snap.svg-min.js"></script>
	   
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>test	</title>

</head>
<body>
<div class="container">
<section class="grid-wrap">
				<ul class="grid swipe-right" id="grid">
					<li class="title-box">
						<h2>Illustrations by <a href="http://ryotakemasa.com/">Ryo Takemasa</a></h2>
					</li>
					<li><a href="#"><img src="img/1.png" alt="dummy"><h3>A fantastic title</h3></a></li>
					<li><a href="#"><img src="img/1.png" alt="dummy"><h3>A fantastic title</h3></a></li>
					
				</ul>
			</section>
</div>

			<section class="related">
				<p>If you enjoyed this demo you might also like:</p>
				<a href="http://tympanus.net/Development/ThumbnailGridAnimations/">
					<img src="http://tympanus.net/codrops/wp-content/uploads/2013/10/ThumbnailGridAnimations1-300x162.jpg" />
					<h3>Animations for Thumbnail Grids</h3>
				</a>
				<a href="http://tympanus.net/Development/GridLoadingEffects/">
					<img src="http://tympanus.net/codrops/wp-content/uploads/2013/07/GridLoadingEffects-300x162.png" />
					<h3>Grid Loading Effects</h3>
				</a>
			</section>
		<!-- /container -->
		<script src="js/masonry.pkgd.min.js"></script>
		<script src="js/imagesloaded.pkgd.min.js"></script>
		<script src="js/classie.js"></script>
		<script src="js/colorfinder-1.1.js"></script>
		<script src="js/gridScrollFx.js"></script>
		<script>
			new GridScrollFx( document.getElementById( 'grid' ), {
				viewportFactor : 0.4
			} );
		</script>
	</body>
</html>