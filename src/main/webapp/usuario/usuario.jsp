<%@page import="mx.ulsa.modelo.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Usuario - Tutorial Jairo</title>
<jsp:include page="/componentes/bootstrap.jsp" />
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
				<jsp:param name="menuActivo" value="usuario" />
			</jsp:include>
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<h1 class="h2">Usuario</h1>
				</div>
				<div class="row">
					<div class="col-3">
						<a type="button" class="btn btn-primary"
							href="<%=request.getContextPath()%>/usuario/registrarUsuario.jsp">Nuevo
							registro</a>
					</div>
				</div>
				<%
				String mensaje = null;
				mensaje = (String) request.getAttribute("mensaje");
				%>
				<%=(String) request.getAttribute("mensaje") %>
				<%=request.getAttribute("mensaje")%>
				${mensaje}
				<div class="alert alert-warning alert-dismissible fade show"
					role="alert">



					<c:if test="${mensaje!= null }">

						<strong>${mensaje }</strong>
					</c:if>


					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
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