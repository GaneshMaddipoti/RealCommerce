<div class="container">
	<br />
	<div class="row">
		<div class="col s12 m6">
			<div class="card">
				<div class="card-content">
					<span class="card-title"><i class="material-icons">apps</i>
						Products</span>
					<p>Electronics, Fashion, Furniture, Books, etc...
						and etc...</p>
				</div>
				<div class="card-action">
					<a href="#" id="viewProducts">View All</a>
				</div>
			</div>
		</div>		
	</div>
	
</div>
<script>
	$(document).ready(function() {
		try {
			$('#modal1').modal('close');
		}catch(err){
			//do nothing
		}
		$("#viewProducts").click(function() {
			$('#modal1').modal('open');
			$("main").load("product/listproduct");
		})
		$("#viewTutorials").click(function() {
			$('#modal1').modal('open');
			$("main").load("course/listcourse");
		})
		$("#viewTools").click(function() {
			$('#modal1').modal('open');
			$("main").load("tool/listtool");
		})
	});
</script>