<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script>
	//callback handler for form submit
	$(document).ready(function() {
		$("#entityAccountButton").click(function(e) {
			$('#modal1').modal('open');
			var postData = $("#entityInfo").serializeArray();
			var formURL = $("#entityInfo").attr("action");
			$.ajax({
				url : formURL,
				type : "POST",
				data : postData,
				success : function(data, textStatus, jqXHR) {
					$('#modal1').modal('close');
					$("#entityInfoResult").html("Saved " + textStatus);
				},
				error : function(jqXHR, textStatus, errorThrown) {
					$('#modal1').modal('close');
					$("#entityInfoResult").html("Saved " + textStatus);      
				}
			});
		});
	});
</script>
<div class="row">
	<form:form method="POST" action="saveAccountInfo"
		modelAttribute="entityInfo" class="col s12">

		<form:hidden path="id" />

		<div class="row">
			<div class="input-field col s6">
				<form:input path="firstName" />
				<form:label path="firstName">First Name</form:label>
			</div>
			<div class="input-field col s6">
				<form:input path="lastName" />
				<form:label path="lastName">Last Name</form:label>
			</div>
		</div>
		<div class="row">
			<div class="input-field col s6">
				<form:select path="gender">
					<form:option value="" disabled="disabled">Choose your option</form:option>
					<form:option value="Male">Male</form:option>
					<form:option value="Female">Female</form:option>
				</form:select>
				<label>Gender</label>
			</div>
			<div class="input-field col s6">
				<form:input path="birthDate" class="datepicker"/>
				<form:label path="birthDate">Birth Date</form:label>
			</div>
		</div>
		<div class="row">
			<div class="input-field col s6">
				<input type="button" value="Submit" class="btn"
					id="entityAccountButton" /> <span id="entityInfoResult"></span>
			</div>
		</div>
	</form:form>
</div>