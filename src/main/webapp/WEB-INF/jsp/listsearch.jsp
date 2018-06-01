<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<div class="container">
	<br />
	<div class="container">
		<div class="row">
			<div class="col s12">
				<form:form method="POST" action="search/searchResults" modelAttribute="field"
					class="col s12">
					<div class="row">
						<div class="input-field col s8">
							<i class="material-icons prefix">search</i> <input
								id="fieldValue" type="text" name="fieldValue" class="validate">
							<label for="fieldValue" class="active">Search Here</label>
						</div>
						<div class="col s4">
							<input type="submit" class="btn" value="Search" />
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>


</div>
<script>
	$(document).ready(function() {
		$('#modal1').modal('close');
	});
	function load(arg) {
		$('#modal1').modal('open');
		$("main").load(arg);
	}
</script>
</html>
