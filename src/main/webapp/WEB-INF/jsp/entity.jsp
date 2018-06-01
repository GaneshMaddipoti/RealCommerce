<div class="row container">
	<br/>
	<div class="col hide-on-small-only m3 l2">
		<ul class="section table-of-contents" style="position: fixed;">
			<li><a href="#account">Account</a></li>
			<li><a href="#contact">Contact</a></li>
		</ul>
	</div>
	<div class="col s12 m9 l10">
		<div id="account" class="section scrollspy">
			<jsp:include page="entityinfo.jsp"></jsp:include>
		</div>

		<div id="contact" class="section scrollspy">
			<jsp:include page="entitycontact.jsp"></jsp:include>
		</div>

	</div>
</div>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/materialize.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#modal1').modal('close');
		$('.scrollspy').scrollSpy();
		$('select').material_select();
		$('.datepicker').pickadate({
			selectMonths : true, // Creates a dropdown to control month
			selectYears : 155, // Creates a dropdown of 15 years to control year,
			today : 'Today',
			clear : 'Clear',
			close : 'Ok',
			closeOnSelect : false
		// Close upon selecting a date,
		});
	});
</script>