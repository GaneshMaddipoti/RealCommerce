<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<link rel="icon" href="img/jtechy1.ico">
<title>Real Commerce - Sale is going on...</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
</head>
<body onload='document.registerForm.username.focus();'>
	<br />
	<br />
	<div class="container">
		<div class="row">
			<div class="col s12 m6 offset-m3">
				<form name='registerForm' action="<c:url value='/register' />"
					method='POST'>
					<div class="card">
						<div class="card-content">
							<span class="card-title black-text">Registration</span>
							<c:if test="${not empty error}">
								<div class="error">${error}</div>
							</c:if>
							<c:if test="${not empty msg}">
								<div class="msg">${msg}</div>
							</c:if>
							<div class="row">
								<div class="input-field col s12">
									<input id="userName" type="text" name="userName"
										class="validate"> <label for="userName" class="active">User
										Name</label>
								</div>
							</div>
							<div class="row">
								<div class="input-field col s12">
									<input id="password" type="text" name="password"
										class="validate"> <label for="lastname" class="active">Password</label>
								</div>
							</div>
							<div class="row">
								<div class="col s12">
									<input type="checkbox" id="adminFlag" name="adminFlag"><label
										for="adminFlag">Admin ?</label>
								</div>
							</div>
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
						</div>
						<div class="card-action">
							<input type="submit" class="btn" value="Register" />
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/materialize.js"></script>
</body>
</html>