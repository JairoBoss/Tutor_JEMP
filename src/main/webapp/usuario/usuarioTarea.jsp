<%@page import="mx.ulsa.modelo.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registar Usuario Tarea</title>
<jsp:include page="/componentes/bootstrap.jsp"></jsp:include>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/bootstrap-5.0.2/dashboard.css" />

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/bootstrap-5.0.2/dashboard.rtl.css" />
</head>
<body>

	<%
	Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
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
				<jsp:param name="menuActivo" value="usuarioTarea" />
			</jsp:include>
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<h1 class="h2">Registrar usuario</h1>
					<h1><%=(String) request.getAttribute("mensaje") %></h1>
				</div>
				<form method="POST"
					action="<%=request.getContextPath()%>/Usuario/registrarUsuarioTarea">
					<div class="row">
						<div class="col-10">
							<div class="mb-3 row">
								<label for="correo" class="col-sm-2 col-form-label">correo</label>
								<div class="col-sm-10">
									<input required type="email" name="correo" class="form-control" 
										id="correo">
								</div>
							</div>
							<div class="mb-3 row">
								<label for="contrasenia" class="col-sm-2 col-form-label">Contrase&ntilde;a</label>
								<div class="col-sm-10">
									<input required type="password" class="form-control" name="contrasenia"
										id="contrasenia">
								</div>
							</div>
							<div class="mb-3 row">
								<label for="estatus" class="col-sm-2 col-form-label">Status</label>
								<div class="col-sm-10">
									<input type="checkbox" name="estatus" id="estatus">
								</div>
							</div>
							<hr />

							<div class="mb-3 row">
								<label for="fechaRegistro" class="col-sm-2 col-form-label">Fecha
									registro</label>
								<div class="col-sm-10">
									<input type="date" name="fechaRegistro" class="form-control" required
										id="fechaRegistro">
								</div>
							</div>

							<div class="mb-3 row">
								<label for="fechaVigencia" class="col-sm-2 col-form-label">Fecha
									vigencia</label>
								<div class="col-sm-10">
									<input type="date" name="fechaVigencia" class="form-control" required
										id="fechaVigencia">
								</div>
							</div>


							<div class="mb-3 row">

								<div class="col-sm-2">
									<input type="reset" class="btn btn-danger" value="Cancelar">
								</div>


								<div class="col-sm-2">
									<input type="submit" class="btn btn-success" value="Crear">
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