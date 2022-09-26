<%@page import="mx.ulsa.modelo.Producto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar producto</title>
<jsp:include page="/componentes/bootstrap.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/bootstrap-5.0.2/dashboard.css" />

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/bootstrap-5.0.2/dashboard.rtl.css" />

<link href="assets/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" />
</head>
<%
Producto producto = (Producto) request.getAttribute("producto");
%>

<jsp:include page="/componentes/mainHeader.jsp">
	<jsp:param name="usuarioCorreo" value="${usuario.getCorreo() }" />
</jsp:include>

<div class="container-fluid">
	<div class="row">
		<jsp:include page="/componentes/menuLateral.jsp">
			<jsp:param name="menuActivo" value="productoTarea" />
		</jsp:include>
		<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
			<div
				class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
				<h1 class="h2">Editar Producto</h1>
			</div>
			<form method="POST"
				action="<%=request.getContextPath()%>/Producto/delete?id=<%=producto.getId()%>">
				<div class="row">
					<div class="col-10">
						<div class="mb-3 row">
							<label for="nombre" class="col-sm-2 col-form-label">nombre</label>
							<div class="col-sm-10">
								<input readonly type="text" name="nombre" class="form-control"
									id="nombre" value="${producto.getNombre()}" />
							</div>
						</div>
						<div class="mb-3 row">
							<label for="descripcion" class="col-sm-2 col-form-label">Descripcion
							</label>
							<div class="col-sm-10">
								<input readonly type="text" class="form-control"
									name="descripcion" id="descripcion"
									value="${producto.getDescripcion()}" />
							</div>
						</div>

						<div class="mb-3 row">
							<label for="precio" class="col-sm-2 col-form-label">Precio</label>
							<div class="col-sm-10">
								<input readonly type="number" min="0" max="1000" name="precio"
									class="form-control" id="precio"
									value="${producto.getPrecio()}" />
							</div>
						</div>

						<div class="mb-3 row">
							<label for="imagen" class="col-sm-2 col-form-label">Imagen</label>
							<div class="col-sm-10">
								<input readonly type="text" class="form-control" name="imagen"
									id="imagen" value="${producto.getImagen()}" />
							</div>
						</div>

						<div class="mb-3 row">
							<label for="numExistencias" class="col-sm-2 col-form-label">Stock</label>
							<div class="col-sm-10">
								<input readonly type="number" min="0" max="1000"
									name="numExistencias" class="form-control" id="numExistencias"
									value="${producto.getNumExistencias()}" />
							</div>
						</div>

						<div class="mb-3 row">
							<label for="codigoBarras" class="col-sm-2 col-form-label">Codigo
								de barras</label>
							<div class="col-sm-10">
								<input readonly type="text" name="codigoBarras"
									class="form-control" id="codigoBarras"
									value="${producto.getCodigoBarras()}" />
							</div>
						</div>

						<div class="mb-3 row">
							<label for="ivaPorcentaje" class="col-sm-2 col-form-label">Iva</label>
							<div class="col-sm-10">
								<input readonly type="number" step="any" min="0" max="100"
									name="ivaPorcentaje" class="form-control" id="ivaPorcentaje"
									value="${producto.getIvaPorcentaje()}" />
							</div>
						</div>

						<div class="mb-3 row">
							<div class="col-sm-2">
								<input type="submit" class="btn btn-danger" value="Eliminar" />
							</div>
						</div>
					</div>
				</div>
			</form>
		</main>
	</div>
</div>

<script
	src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"
	integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"
	integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha"
	crossorigin="anonymous"></script>
<script
	src="<%=request.getContextPath()%>/js/bootstrap-5.0.2/dashboard.js"></script>


<body>

</body>
</html>