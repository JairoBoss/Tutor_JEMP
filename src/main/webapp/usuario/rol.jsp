<%@page import="java.util.ArrayList"%>
<%@page import="mx.ulsa.modelo.Rol"%>
<%@page import="java.util.List"%>
<%@page import="mx.ulsa.modelo.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registar Rol Tarea</title>
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
	List<Rol> roles = (ArrayList) request.getAttribute("roles");
	%>



	<jsp:include page="/componentes/mainHeader.jsp">
		<jsp:param name="usuarioCorreo" value="${usuario.getCorreo() }" />
	</jsp:include>

	<div class="container-fluid">
		<div class="row">
			<jsp:include page="/componentes/menuLateral.jsp">
				<jsp:param name="menuActivo" value="rolTarea" />
			</jsp:include>
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">


				<c:if test="${sessionScope.rolObtenido == null }">
					<div
						class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
						<h1 class="h2">Registrar Rol</h1>
						<a href="<%=request.getContextPath()%>/Rol/exportar">
							<button type="button" class="btn btn-secondary">Exportar</button>
						</a>
					</div>
					<form method="POST"
						action="<%=request.getContextPath()%>/Rol/registrar">
						<div class="row">
							<div class="col-10">
								<div class="mb-3 row">
									<label for="nombre" class="col-sm-2 col-form-label">nombre</label>
									<div class="col-sm-10">
										<input required type="text" name="nombre" class="form-control"
											id="nombre">
									</div>
								</div>
								<div class="mb-3 row">
									<label for="descripcion" class="col-sm-2 col-form-label">Descripcion</label>
									<div class="col-sm-10">
										<input required type="text" class="form-control"
											name="descripcion" id="descripcion">
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
				</c:if>

				<c:if test="${sessionScope.rolObtenido != null }">
					<div
						class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
						<h1 class="h2">Actualizar Rol</h1>
					</div>
					<form method="POST"
						action="<%=request.getContextPath()%>/Rol/actualizar/${sessionScope.rolObtenido.getId()}">
						<div class="row">
							<div class="col-10">
								<div class="mb-3 row">
									<label for="nombre" class="col-sm-2 col-form-label">nombre</label>
									<div class="col-sm-10">
										<input required type="text" name="nombre" class="form-control"
											value="${sessionScope.rolObtenido.getNombre()}" id="nombre">
									</div>
								</div>
								<div class="mb-3 row">
									<label for="descripcion" class="col-sm-2 col-form-label">Descripcion</label>
									<div class="col-sm-10">
										<input required type="text" class="form-control"
											value="${sessionScope.rolObtenido.getDescripcion()}"
											name="descripcion" id="descripcion">
									</div>
								</div>

								<div class="mb-3 row">

									<div class="col-sm-2">
										<input type="reset" class="btn btn-danger" value="Cancelar">
									</div>


									<div class="col-sm-2">
										<input type="submit" class="btn btn-success"
											value="Actualizar">
									</div>

								</div>
							</div>
						</div>
					</form>
				</c:if>



				<div class="row">
					<div class="col-12">
						<c:if test="${sessionScope.listaRoles != null }">
							<h1 class="mt-2">Roles</h1>
							<div class="row">
								<table class="table">
									<thead>
										<tr>
											<th>Id</th>
											<th>Nombre</th>
											<th>Descripcion</th>
											<th>Eliminar</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="rol" items="${sessionScope.listaRoles}">
											<tr>
												<td>${rol.getId()}</td>
												<td>${rol.getNombre()}</td>
												<td>${rol.getDescripcion()}</td>

												<td><a
													href="<%=request.getContextPath()%>/Rol/eliminar/${rol.getId()}">
														<button type="submit" class="btn btn-danger">
															<img width="50px" height="50px"
																src="https://static.vecteezy.com/system/resources/thumbnails/000/378/282/small/Basic_Elements__28125_29.jpg" />
														</button>


												</a></td>

												<td><a
													href="<%=request.getContextPath()%>/Rol/editar/${rol.getId()}">
														<button type="submit" class="btn btn-success">
															<img width="50px" height="50px"
																src="https://img.freepik.com/vector-gratis/lapiz_24908-54630.jpg?w=2000" />
														</button>


												</a></td>

											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</c:if>
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