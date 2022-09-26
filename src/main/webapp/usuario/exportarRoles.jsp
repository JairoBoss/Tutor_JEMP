<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="mx.ulsa.modelo.Rol"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exportar roles</title>
</head>
<body>
	<%
	List<Rol> listaRoles = (ArrayList) request.getAttribute("listaRoles");
	response.setContentType("application/vnd.ms-excel");
	response.setHeader("Content-disposition", "attachment; filename=reporteRoles.xls");
	%>

	<div class="row">
		<div class="col-12">
			<h1>Roles</h1>

			<div class="row">
				<table class="table">
					<thead>
						<tr>
							<th>Id</th>
							<th>Nombre</th>
							<th>Descripcion</th>
						</tr>
					</thead>
					<tbody>
						<%
						for (int i = 0; i < listaRoles.size(); i++) {
						%>
						<tr>
							<td><%=listaRoles.get(i).getId()%></td>
							<td><%=listaRoles.get(i).getNombre()%></td>
							<td><%=listaRoles.get(i).getDescripcion()%></td>
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