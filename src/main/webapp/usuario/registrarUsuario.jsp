<%@page import="mx.ulsa.modelo.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registar usuario - Tutorial Jairo</title>
<jsp:include page="/componentes/bootstrap.jsp"></jsp:include>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/bootstrap-5.0.2/dashboard.css" />

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/bootstrap-5.0.2/dashboard.rtl.css" />
</head>
<body>

	<%
	Usuario usuario = (Usuario) request.getSession().getAttribute("Usuario");
	%>

	<c:if test="${usuario == null }">
		<jsp:forward page="./login.jsp" />
	</c:if>

	<jsp:include page="/componentes/mainHeader.jsp">
		<jsp:param name="usuarioCorreo" value="${usuario.getCorreo() }" />
	</jsp:include>

	<div class="container-fluid">
		<div class="row">
			<jsp:include page="/componentes/menuLateral.jsp">
				<jsp:param name="menuActivo" value="usuario" />
			</jsp:include>
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<h1 class="h2">Registrar usuario</h1>
					<h1><%=(String) request.getAttribute("mensaje") %></h1>
				</div>
				<form method="post"
					action="<%=request.getContextPath()%>/Usuario/registrarUsuarioPersona">
					<div class="row">
						<div class="col-10">
							<div class="mb-3 row">
								<label for="correo" class="col-sm-2 col-form-label">correo</label>
								<div class="col-sm-10">
									<input type="email" name="correo" class="form-control"
										id="correo">
								</div>
							</div>
							<div class="mb-3 row">
								<label for="password" class="col-sm-2 col-form-label">Contrase&ntilde;a</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" name="password"
										id="password">
								</div>
							</div>
							<div class="mb-3 row">
								<label for="status" class="col-sm-2 col-form-label">Status</label>
								<div class="col-sm-10">
									<input type="checkbox" name="status" id="status">
								</div>
							</div>
							<hr />

							<div class="mb-3 row">
								<label for="nombre" class="col-sm-2 col-form-label">Nombre</label>
								<div class="col-sm-10">
									<input type="text" name="nombre" class="form-control"
										id="nombre">
								</div>
							</div>

							<div class="mb-3 row">
								<label for="paterno" class="col-sm-2 col-form-label">Paterno</label>
								<div class="col-sm-10">
									<input type="text" name="paterno" class="form-control"
										id="paterno">
								</div>
							</div>

							<div class="mb-3 row">
								<label for="materno" class="col-sm-2 col-form-label">Materno</label>
								<div class="col-sm-10">
									<input type="text" name="materno" class="form-control"
										id="materno">
								</div>
							</div>

							<div class="mb-3 row">
								<label for="edad" class="col-sm-2 col-form-label">Edad</label>
								<div class="col-sm-10">
									<input type="number" min="18" max="100" name="edad"
										class="form-control" id="edad">
								</div>
							</div>

							<div class="mb-3 row">
								<label for="telefono" class="col-sm-2 col-form-label">Telefono</label>
								<div class="col-sm-10">
									<input type="tel" name="telefono" class="form-control"
										id="telefono">
								</div>
							</div>

							<div class="mb-3 row">

								<div class="col-sm-2">
									<input type="submit" name="status" class="btn btn-success"
										value="Crear">
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
</body>
</html>