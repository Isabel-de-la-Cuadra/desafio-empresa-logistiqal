<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include page='../templates/header.jsp'>
	<jsp:param name='title' value='Listar Productos:' />
</jsp:include>

<body>

	<jsp:include page='../templates/navbar.jsp'>
		<jsp:param name='title' value='Sistema Web Empresa Logistiqal' />
	</jsp:include>

	<br>
	<br>

	<div class="container">
		<div class="text-center">
			<h1>Listado de Productos</h1>
		</div>

		<br>

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

		<br>

		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th scope="col">ID</th>
						<th scope="col">Código</th>
						<th scope="col">Producto</th>
						<th scope="col">Precio</th>
						<th scope="col">Stock</th>
						<th scope="col">Acciones</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="product" items="${listProducts}">
						<tr>
							<th scope="row"><c:out value="${product.id}"></c:out></th>
							<td><c:out value="${product.code}"></c:out></td>
							<td><c:out value="${product.name}"></c:out></td>
							<td><c:out value="${product.price}"></c:out></td>
							<td><c:out value="${product.stock}"></c:out></td>
							<td><a class="btn btn-primary"
								href="/product/edit/${product.id}" role="button"> <svg
										xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
 								<path
											d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z" />
								</svg>Editar
							</a> <a class="btn btn-danger" href="/product/delete/${product.id}"
								role="button"> <svg xmlns="http://www.w3.org/2000/svg"
										width="16" height="16" fill="currentColor" class="bi bi-trash"
										viewBox="0 0 16 16">
  								<path
											d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z" />
  								<path fill-rule="evenodd"
											d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z" />
								</svg> Eliminar
							</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<div class="row">
				<div class="col-md-2"></div>
				<h4 class="fs-6 fst-italic">(Hay ${totalElements} registros)</h4>
				<h4 class="fs-6 fst-italic">(Los mostraré de a ${size}
					registros)</h4>
				<div class="col-md-8">
					<nav aria-label="Pagination">
						<h4 class="fs-5">Para pasar de página tienes que apretar el
							botón</h4>
						<ul class="pagination pagination-lg justify-content-center">
							<c:forEach begin="1" end="${totalPages}" var="page">
								<li class="page-item"><a class="page-link"
									href="list?page=${page}&size=${size}">${page}</a></li>
							</c:forEach>
						</ul>
					</nav>
				</div>
				<div class="col-md-2"></div>
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