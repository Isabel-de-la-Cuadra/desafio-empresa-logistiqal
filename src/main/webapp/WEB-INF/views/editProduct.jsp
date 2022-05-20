<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include page='../templates/header.jsp'>
	<jsp:param name='title' value='Editar Producto:' />
</jsp:include>

<body>

	<jsp:include page='../templates/navbar.jsp'>
		<jsp:param name='title' value='Sistema Web Empresa Logistiqal' />
	</jsp:include>

	<br>
	<br>

	<div class="row justify-content-sm-center h-150">
		<div class="col-xxl-4 col-xl-5 col-lg-5 col-md-7 col-sm-9">
			<div class="card shadow-lg" id="card">
				<div class="card-body p-3">
					<h1 class="fs-4 card-title mb-2">Formulario de Actualización
						de Productos</h1>
						
					<c:if test="${msgError !=null}">
						<div class="alert alert-danger" role="alert">
							<c:out value="${msgError}"></c:out>
						</div>
					</c:if>

					<c:if test="${msgOk !=null}">
						<div class="alert alert-success" role="alert">
							<c:out value="${msgOk}"></c:out>
						</div>
					</c:if>

					<form:form method="POST" action="/product/update"
						modelAttribute="product">
						<form:input type="hidden" class="form-control" path="id" value="" />

						<div class="mb-3">
							<form:label class="mb-1 text-muted" path="code">
									Reingresa el código del Producto</form:label>
							<form:input type="text" class="form-control" path="code" />
							<form:errors path="code" class="text-danger"/>
						</div>

						<div class="mb-3">
							<form:label class="mb-1 text-muted" path="name">
									Reingresa el nombre del Producto</form:label>
							<form:input type="text" class="form-control" path="name"/>
							<form:errors path="name" class="text-danger" />
						</div>

						<div class="mb-3">
							<form:label class="mb-1 text-muted" path="price">
									Reingresa el precio del Producto</form:label>
							<form:input type="number" class="form-control" path="price"/>
							<form:errors path="price" class="text-danger" />
						</div>

						<div class="mb-3">
							<form:label class="mb-1 text-muted" path="stock">
									Reingresa el stock del Producto</form:label>
							<form:input type="number" class="form-control" path="stock"/>
							<form:errors path="stock" class="text-danger" />
						</div>

						<div class="contenedor-icono">
							<button type="submit" class="btn btn-primary ms-auto">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
 								 	<path
										d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z" />
								</svg>
								Actualizar Producto
							</button>
						</div>

					</form:form>
				</div>
			</div>
		</div>
	</div>

	<br>
	<br>

	<jsp:include page='../templates/footer.jsp'>
		<jsp:param name='title' value='Sistema Web Empresa Logistiqal' />
	</jsp:include>

	<!-- Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js ">
	</script>

</body>
</html>