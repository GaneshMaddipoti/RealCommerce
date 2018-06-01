<%@ page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="bgcolor">
	<div class="container nav-wrapper">
		<a href="#!" class="flow-text" id="realCommerce"><strong>Real Commerce</strong></a>
		<a href="#" data-activates="slide-out" class="button-collapse"><i
			class="material-icons" style="color: white">menu</i></a>
	</div>
	<ul id="slide-out" class="side-nav fixed" style="width: 250px">
		<li><div class="user-view">
				<div class="background bgcolor"></div>
				<a href="#!user"><img class="circle" src="img/index.png"></a>
				<c:if test="${pageContext.request.userPrincipal.name != null}">
					<a href="#!name"><span class="white-text name">${pageContext.request.userPrincipal.name}</span></a>
					<a href="logout">Logout</a>
				</c:if>
				<c:if test="${pageContext.request.userPrincipal.name == null}">
					<a href="login">Login</a>
				</c:if>
			</div></li>
		<li><a class="waves-effect" href="#!" id="dashboard"><i
				class="material-icons">dashboard</i>Dashboard</a></li>
		<li><a class="waves-effect" href="#!" id="products"><i
				class="material-icons">apps</i>Products</a></li>
		<li><div class="divider"></div></li>
		<li><a class="waves-effect" href="#!" id="blog"><i
				class="material-icons">rss_feed</i>blog</a></li>
		<li><a class="waves-effect" href="#!" id="search"><i
				class="material-icons">search</i>Search</a></li>
		<li><a class="waves-effect" href="#!" id="profile"><i
				class="material-icons">account_box</i>Profile</a></li>
	</ul>
</nav>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".button-collapse").sideNav();
		$("#dashboard").click(function() {
			$('#modal1').modal('open');
			$("main").load("dashboard");
		})
		$("#products").click(function() {
			$('#modal1').modal('open');
			$("main").load("product/listproduct");
		})
		$("#blog").click(function() {
			$('#modal1').modal('open');
			$("main").load("blog/listblog");
		})
		$("#search").click(function() {
			$('#modal1').modal('open');
			$("main").load("search/initial");
		})
		$("#profile").click(function() {
			$('#modal1').modal('open');
			$("main").load("entity");
		})
	});
</script>
