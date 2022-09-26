<%@page import="mx.ulsa.modelo.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Crear usuario</title>
<jsp:include page="/componentes/bootstrap.jsp"></jsp:include>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/bootstrap-5.0.2/dashboard.css" />

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/bootstrap-5.0.2/dashboard.rtl.css" />

<link href="assets/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" />
</head>
<body>
	<%
	Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
	%>

	<jsp:include page="/componentes/mainHeader.jsp">
		<jsp:param name="usuarioCorreo" value="${usuario.getCorreo() }" />
	</jsp:include>


	<div class="container-fluid">
		<div class="row">
			<jsp:include page="/componentes/menuLateral.jsp">
				<jsp:param name="menuActivo" value="usuarioTarea" />
			</jsp:include>
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<div class="row">
					<div class="col-12">
						<h1 class="mt-2">Crear Usuario</h1>

						<div class="row">
							<form
								action="<%=request.getContextPath()%>/Usuario/crear">
								<div class="form-group position-relative has-icon-left mb-4">
									<input type="email" class="form-control form-control-xl"
										name="correo" placeholder="Correo" required />
									<div class="form-control-icon">
										<i class="bi bi-person"></i>
									</div>
								</div>
								<div class="form-group position-relative has-icon-left mb-4">
									<input type="password" class="form-control form-control-xl"
										name="contrasenia" placeholder="Password" required />
									<div class="form-control-icon">
										<i class="bi bi-shield-lock"></i>
									</div>
								</div>

								<button class="btn btn-primary btn-block btn-lg shadow-lg mt-5"
									type="submit">Registrar</button>
							</form>

						</div>
					</div>
				</div>
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