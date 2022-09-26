<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Registro nuevo usuario</title>
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/bootstrap.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/app.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/pages/auth.css">
</head>
<body>
	<div id="auth">

		<div class="row h-100">
			<div class="col-lg-5 col-12">
				<div id="auth-left">
					<div class="auth-logo"></div>
					<h1 class="auth-title">Registro</h1>
					<p class="auth-subtitle mb-5">Registro de un nuevo usuario.</p>

					<%
					String msg = null;
					if (request.getAttribute("msg") != null) {
						msg = request.getAttribute("msg").toString();
					}
					%>

					<c:if test="${msg != null }">
						<p class="auth-subtitle mb-5">
							<%=msg%>
						</p>
					</c:if>

					<form action="<%=request.getContextPath()%>/Usuario/registrarUsuario">
						<div class="form-group position-relative has-icon-left mb-4">
							<input type="email" class="form-control form-control-xl"
								name="correo" placeholder="Correo" required>
							<div class="form-control-icon">
								<i class="bi bi-person"></i>
							</div>
						</div>
						<div class="form-group position-relative has-icon-left mb-4">
							<input type="password" class="form-control form-control-xl"
								name="contrasenia" placeholder="Password" required>
							<div class="form-control-icon">
								<i class="bi bi-shield-lock"></i>
							</div>
						</div>

						<button class="btn btn-primary btn-block btn-lg shadow-lg mt-5"
							type="submit">Registrar</button>
					</form>

				</div>
			</div>
			<div class="col-lg-7 d-none d-lg-block">
				<div id="auth-right"></div>
			</div>
		</div>

	</div>

</body>
</html>