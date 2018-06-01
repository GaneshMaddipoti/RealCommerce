<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<link rel="icon" href="img/jtechy1.ico">
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
	<br />
	<br />
	<div class="container">
		<div class="row">
			<div class="col s12 m6 offset-m3">
				<form name='loginForm' action="<c:url value='/login' />"
					method='POST'>
					<div class="card">
						<div class="card-content">
							<span class="card-title black-text">Sign In</span>
							<c:if test="${not empty error}">
								<div class="error">${error}</div>
							</c:if>
							<c:if test="${not empty msg}">
								<div class="msg">${msg}</div>
							</c:if>
							<div class="row">
								<div class="input-field col s12">
									<input id="username" type="text" name="username"
										class="validate"> <label for="firstname"
										class="active">User Name</label>
								</div>
							</div>
							<div class="row">
								<div class="input-field col s12">
									<input id="password" type="password" name="password"
										class="validate"> <label for="lastname" class="active">Password</label>
								</div>
							</div>
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
						</div>
						<div class="card-action">
							<input type="submit" class="btn" value="Sign In" /> <a
								href="registration">Register Here</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/materialize.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#modal1').modal('close');
		});
	</script>
</body>
</html>