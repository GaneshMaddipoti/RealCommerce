<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page isELIgnored="false"%>
<div class="container" id="softdev">
	<br />
	<div class="row">
		<div class="col s12">

			<div class="card-panel">
				<a href="#!" id="productsLink">Products</a> - ${product.category} - ${product.name}
				<hr />
				<c:forEach var="field" items="${product.fields}" varStatus="loop">
					<i class="material-icons">subject</i>${field.fieldName} <br />
					<span style="white-space: pre-wrap;">${field.fieldValue}</span>
					<br />
					<br />
				</c:forEach>
			</div>

			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<div class="row">
					<div class="col s4">
						<input type="button" value="Edit Product" class="btn"
							id="saveProductButton" onclick="gotoDetail('${product.id}')" />
					</div>
				</div>
			</sec:authorize>

		</div>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		$('#modal1').modal('close');
		$('.collapsible').collapsible();
		$("#productsLink").click(function() {
			$('#modal1').modal('open');
			$("main").load("product/listproduct");
		})
	});
	$(function() {
		$('textarea').each(function() {
			$(this).height($(this).prop('scrollHeight'));
		});
	});
	function gotoDetail(arg) {
		$("main").load("product/modifyproduct/" + arg);
	}
	function addProductField(arg) {
		$("main").load("product/addproductfield?id=" + arg);
	}
</script>