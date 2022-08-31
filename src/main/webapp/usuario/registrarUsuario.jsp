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

<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/bootstrap.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/app.css">
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
				<br />
				<section id="basic-vertical-layouts">
					<div class="col-md1 col-12">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">Registrar un nuevo usuario</h4>
							</div>
							<div class="card-content">
								<div class="card-body">
									<form class="form form-vertical" method="post"
										action="<%=request.getContextPath()%>/Usuario/registrarUsuarioPersona">
										<div class="form-body">
											<div class="row">
												<div class="col-12">
													<div class="form-group has-icon-left">
														<label for="first-name-icon">Nombre(s)</label>
														<div class="position-relative">
															<input type="text" class="form-control"
																placeholder="Coloca tu nombre" id="nombre">
															<div class="form-control-icon">
																<i class="bi bi-person"></i>
															</div>
														</div>
													</div>
												</div>




												<div class="col-12">
													<div class="form-group has-icon-left">
														<label for="first-name-icon">Paterno</label>
														<div class="position-relative">
															<input type="text" class="form-control"
																placeholder="Coloca tu apellido" id="paterno">
															<div class="form-control-icon">
																<i class="bi bi-person"></i>
															</div>
														</div>
													</div>
												</div>

												<div class="col-12">
													<div class="form-group has-icon-left">
														<label for="first-name-icon">Materno</label>
														<div class="position-relative">
															<input type="text" class="form-control"
																placeholder="Coloca tu apellido" id="materno">
															<div class="form-control-icon">
																<i class="bi bi-person"></i>
															</div>
														</div>
													</div>
												</div>


												<div class="col-12">
													<div class="form-group has-icon-left">
														<label for="first-name-icon">Edad</label>
														<div class="position-relative">
															<input class="form-control" placeholder="Coloca tu edad"
																type="number" min="18" max="100" name="edad">
															<div class="form-control-icon">
																<i class="bi bi-person"></i>
															</div>
														</div>
													</div>
												</div>



												<div class="col-12">

													<div class="form-group has-icon-left">
														<label for="email-id-icon">Email</label>
														<div class="position-relative">
															<input type="email" class="form-control"
																placeholder="Email" id="correo">
															<div class="form-control-icon">
																<i class="bi bi-envelope"></i>
															</div>
														</div>
													</div>
												</div>
												<div class="col-12">
													<div class="form-group has-icon-left">
														<label for="mobile-id-icon">Telefono</label>
														<div class="position-relative">
															<input type="tel" class="form-control"
																placeholder="Tu telefono" id="telefono">
															<div class="form-control-icon">
																<i class="bi bi-phone"></i>
															</div>
														</div>
													</div>
												</div>
												<div class="col-12">
													<div class="form-group has-icon-left">
														<label for="password-id-icon">Password</label>
														<div class="position-relative">
															<input type="password" class="form-control"
																placeholder="Password" id="password">
															<div class="form-control-icon">
																<i class="bi bi-lock"></i>
															</div>
														</div>
													</div>
												</div>
												<div class="col-12">
													<div class='form-check'>
														<div class="checkbox mt-2">
															<input type="checkbox" id="status"
																class='form-check-input' checked> <label
																for="remember-me-v">Status</label>
														</div>
													</div>
												</div>
												<div class="col-12 d-flex justify-content-end">
													<button type="submit" class="btn btn-primary me-1 mb-1">Submit</button>
													<button type="reset"
														class="btn btn-light-secondary me-1 mb-1">Reset</button>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</section>
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