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
</head>
<body>
	<header>
		<jsp:include page="navbar.jsp"></jsp:include>
	</header>
	<main> <jsp:include page="dashboard.jsp"></jsp:include> </main>
	<footer class="page-footer bgcolor" style="margin-top: 10px;">
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>

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

	<script type="text/javascript" src="js/jquery.js"></script>
	<script src="js/materialize.min.js"></script>
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