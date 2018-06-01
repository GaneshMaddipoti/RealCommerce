<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="img/icon.ico">
<title>Real Commerce - Sale is going on...</title>
<link href="css/icon.css" rel="stylesheet">
<link rel="stylesheet" href="css/materialize.min.css">

<link type="text/css" rel="stylesheet" href="css/custom.css"
	media="screen,projection" />

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script async
	src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<script>
	(adsbygoogle = window.adsbygoogle || []).push({
		google_ad_client : "ca-pub-8850828692885954",
		enable_page_level_ads : true
	});
</script>
</head>
<body>

	<header>
		<jsp:include page="navbar.jsp"></jsp:include>
	</header>
	<div id="modal1" class="modal">
		<div class="modal-content">
			<div class="preloader-wrapper big active">
				<div class="spinner-layer spinner-blue-only">
					<div class="circle-clipper left">
						<div class="circle"></div>
					</div>
					<div class="gap-patch">
						<div class="circle"></div>
					</div>
					<div class="circle-clipper right">
						<div class="circle"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<main> <jsp:include page="dashboard.jsp"></jsp:include> </main>
	<footer class="page-footer bgcolor" style="margin-top: 10px;">
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>

	<script type="text/javascript" src="js/jquery.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('.modal').modal({
				dismissible : true, // Modal can be dismissed by clicking outside of the modal
				opacity : .5, // Opacity of modal background
				inDuration : 300, // Transition in duration
				outDuration : 200, // Transition out duration
				startingTop : '4%', // Starting top style attribute
				endingTop : '10%'
			});
		});
	</script>
</body>
</html>