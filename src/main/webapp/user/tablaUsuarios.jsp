<%@page import="java.util.ArrayList"%>
<%@page import="mx.ulsa.modelo.Usuario"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tabla de usuarios</title>
<jsp:include page="/componentes/bootstrap.jsp"></jsp:include>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/bootstrap-5.0.2/dashboard.css" />

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/bootstrap-5.0.2/dashboard.rtl.css" />

<link href="assets/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" />
</head>
<body>
<%@ page errorPage="crearUsuario.jsp" %>


	<%
	Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
	List<Usuario> usuarios = (ArrayList) request.getAttribute("listaUsuarios");
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
						<h1>Usuarios</h1>
						<a href="<%=request.getContextPath()%>/user/crearUsuario.jsp">
							<button type="submit" type="button" class="btn btn-primary ">Nuevo</button>
						</a> <a href="<%=request.getContextPath()%>/Usuario/exportar">
							<button type="button" class="btn btn-secondary">Exportar</button>
						</a>

						<div class="row">
							<table class="table">
								<thead>
									<tr>
										<th>Id</th>
										<th>Nombre</th>
										<th>Estatus</th>
										<th>Editar</th>
										<th>Eliminar</th>
									</tr>
								</thead>
								<tbody>


									<%
									for (int i = 0; i < usuarios.size(); i++) {
									%>
									<tr>
										<td><%=usuarios.get(i).getId()%></td>
										<td><%=usuarios.get(i).getCorreo()%></td>
										<td><%=usuarios.get(i).getStatus()%></td>
										<td><a
											href="<%=request.getContextPath()%>/Usuario/editar?id=<%=usuarios.get(i).getId()%>">
												<button type="submit" class="btn btn-success">
													<img width="25px" height="25px"
														src="https://icons.veryicon.com/png/o/miscellaneous/linear-small-icon/edit-246.png" />
												</button>
										</a></td>
										<td><a
											href="<%=request.getContextPath()%>/Usuario/eliminar?id=<%=usuarios.get(i).getId()%>">
												<button type="submit" class="btn btn-danger">
													<img width="25px" height="25px"
														src="https://cdn-icons-png.flaticon.com/512/1345/1345874.png" />
												</button>
										</a></td>


									</tr>
									<%
									}
									%>
									<c:forEach items="${usuarios}" var="user">
										<tr>
											<h1>{user}</h1>

											<td>${user.getId()}</td>
											<td>${user.getCorreo()}</td>
											<td>${user.getStatus()}</td>

											<td><a
												href="<%=request.getContextPath()%>/Rol/eliminar/${rol.getId()}">
													<button type="submit" class="btn btn-danger">
														<img width="50px" height="50px"
															src="https://cdn-icons-png.flaticon.com/512/1345/1345874.png" />
													</button>
											</a></td>

											<td><a
												href="<%=request.getContextPath()%>/Rol/editar/${rol.getId()}">
													<button type="submit" class="btn btn-success">
														<img width="50px" height="50px"
															src="https://icons.veryicon.com/png/o/miscellaneous/linear-small-icon/edit-246.png" />
													</button>
											</a></td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
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