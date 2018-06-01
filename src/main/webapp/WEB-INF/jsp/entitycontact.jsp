<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script>
	//callback handler for form submit
	$(document).ready(function() {
		$("#entityContactButton").click(function(e) {
			$('#modal1').modal('open');
			var postData = $("#entityContact").serializeArray();
			var formURL = $("#entityContact").attr("action");
			$.ajax({
				url : formURL,
				type : "POST",
				data : postData,
				success : function(data, textStatus, jqXHR) {
					$('#modal1').modal('close');
					$("#entityContactResult").html("Saved " + textStatus);
				},
				error : function(jqXHR, textStatus, errorThrown) {
					$('#modal1').modal('close');
					$("#entityContactResult").html("Saved " + textStatus);
				}
			});
		});
	});
</script>
<div class="row">
	<form:form method="POST" action="saveAccountContact"
		modelAttribute="entityContact" class="col s12">

		<form:hidden path="id" />

		<div class="row">
			<div class="input-field col s6">
				<form:input path="addressLine1" />
				<form:label path="addressLine1">Address Line 1</form:label>
			</div>
			<div class="input-field col s6">
				<form:input path="addressLine2" />
				<form:label path="addressLine2">Address Line 2</form:label>
			</div>
		</div>

		<div class="row">
			<div class="input-field col s6">
				<form:input path="city" />
				<form:label path="city">City</form:label>
			</div>
			<div class="input-field col s6">
				<form:input path="state" />
				<form:label path="state">State</form:label>
			</div>
		</div>

		<div class="row">
			<div class="input-field col s6">
				<form:input path="country" />
				<form:label path="country">Country</form:label>
			</div>
			<div class="input-field col s6">
				<form:input path="pinCode" />
				<form:label path="pinCode">Pin Code</form:label>
			</div>
		</div>

		<div class="row">
			<div class="input-field col s6">
				<form:input path="telephone" />
				<form:label path="telephone">Telephone Number</form:label>
			</div>
			<div class="input-field col s6">
				<form:input path="mobile" />
				<form:label path="mobile">Mobile Number</form:label>
			</div>
		</div>

		<div class="row">
			<div class="input-field col s6">
				<form:input path="email" />
				<form:label path="email">Email</form:label>
			</div>
		</div>

		<div class="row">
			<div class="input-field col s6">
				<input type="button" value="Submit" class="btn"
					id="entityContactButton" /> <span id="entityContactResult"></span>
			</div>
		</div>
	</form:form>
</div>
<script>
	$(document).ready(function() {
		$('#modal1').modal('close');
	});
</script>