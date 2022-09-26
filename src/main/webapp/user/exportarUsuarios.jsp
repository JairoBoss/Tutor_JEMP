<%@page import="java.util.ArrayList"%>
<%@page import="mx.ulsa.modelo.Usuario"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Usuarios</title>
</head>
<body>
	<%
	List<Usuario> usuarios = (ArrayList) request.getAttribute("listaUsuarios");
	response.setContentType("application/vnd.ms-excel");
	response.setHeader("Content-disposition", "attachment; filename=reporteUsuarios.xls");
	%>
	<div class="row">
		<div class="col-12">
			<h1>Usuarios</h1>

			<div class="row">
				<table class="table">
					<thead>
						<tr>
							<th>Id</th>
							<th>Nombre</th>
							<th>Estatus</th>
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
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>


</body>
</html>