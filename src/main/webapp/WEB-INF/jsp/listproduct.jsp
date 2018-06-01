<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<div class="container">
	<br />
	<c:if test="${resultMap.size() gt 0}">
		<c:forEach items="${resultMap}" var="entry">
			<div class="card-panel">
				${entry.key}
				<hr />
				<div class="row">
					<c:forEach items="${entry.value}" var="product">
						<dic class="col s12 m4 l3">
						<div class="card-panel card-150h bgcolor white-text"
							onclick="load('product/productdetails/${product.id}')">
							<div class="valign-wrapper">
								<i class="material-icons">chevron_right</i>${product.name}
							</div>
							<hr />
							${product.description}
						</div>
						</dic>
					</c:forEach>
				</div>
			</div>
		</c:forEach>
	</c:if>
	<c:if test="${resultMap.size() eq 0}">
		<div class="card-panel">No Products Found.</div>
	</c:if>

	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<input type="button" class="btn" value="Add Product"
			onclick="load('product/addproduct')" />
	</sec:authorize>

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
