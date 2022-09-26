<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="mx.ulsa.modelo.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar usuario</title>
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
	Usuario user = (Usuario) request.getAttribute("user");
	DateFormat formatter = new SimpleDateFormat("mm-dd-yyyy hh:mm:ss");

	String nuevaFecha = formatter.format(user.getFechaVigencia());
	String fecha = nuevaFecha.split(" ")[0];
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
				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<h1 class="h2">Actualizar usuario</h1>
				</div>
				<form method="POST"
					action="<%=request.getContextPath()%>/Usuario/actualizar?id=<%=user.getId()%>">
					<div class="row">
						<div class="col-10">
							<div class="mb-3 row">
								<label for="nombre" class="col-sm-2 col-form-label">Correo</label>
								<div class="col-sm-10">
									<input required type="text" name="correo" class="form-control"
										value="${user.getCorreo()}" id="correo" />
								</div>
							</div>
							<div class="mb-3 row">
								<label for="descripcion" class="col-sm-2 col-form-label">Contraseña</label>
								<div class="col-sm-10">
									<input required type="password" class="form-control"
										name=password id="password" />
								</div>
							</div>

							<div class="mb-3 row">
								<label for="descripcion" class="col-sm-2 col-form-label">Estatus</label>
								<div class="col-sm-10">
									<input type="checkbox" id="status" name="status" 
										<%=(user.getStatus() == true ? "checked" : "")%> />
								</div>
							</div>

							<div class="mb-3 row">
								<label for="descripcion" class="col-sm-2 col-form-label">Fecha
									vencimiento</label> <input required type="date" id="fecha" name="fecha">
								<p><%=fecha%></p>
							</div>

							<div class="mb-3 row">
								<div class="col-sm-2">
									<input type="reset" class="btn btn-danger" value="Cancelar" />
								</div>

								<div class="col-sm-2">
									<input type="submit" class="btn btn-success" value="Actualizar" />
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