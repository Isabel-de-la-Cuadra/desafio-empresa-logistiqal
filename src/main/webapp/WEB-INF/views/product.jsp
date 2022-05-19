<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<jsp:include page='../templates/header.jsp'>
	<jsp:param name='title' value='Registro Producto:' />
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
				<div class="card-body p-5">
					<h2 class="fs-4 card-title mb-4">Formulario de Registro de
						Productos</h2>

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

					<form:form method="POST" action="/product" modelAttribute="product">

						<div class="mb-3">
							<form:input type="text" class="form-control" path="code"
								placeholder="Ingresa el código del producto" />
							<form:errors path="code" class="text-danger" />
						</div>


						<div class="mb-3">
							<form:input type="text" class="form-control" path="name"
								placeholder="Ingresa el nombre del producto" />
							<form:errors path="name" class="text-danger" />
						</div>

						<div class="mb-3">
							<form:input type="number" class="form-control" path="price"
								placeholder="Ingresa el precio del producto" />
							<form:errors path="price" class="text-danger" />
						</div>

						<div class="mb-3">
							<form:input type="number" class="form-control" path="stock"
								placeholder="Ingresa el stock del producto" />
							<form:errors path="stock" class="text-danger" />
						</div>

						<div class="contenedor-icono">
							<button type="submit" class="btn btn-primary ms-auto">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-check2" viewBox="0 0 16 16">
  										<path
										d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z" />
									</svg>
								Registrar Producto
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