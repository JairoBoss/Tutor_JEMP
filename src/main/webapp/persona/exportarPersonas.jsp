<%@page import="mx.ulsa.modelo.Persona"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="mx.ulsa.modelo.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exportar personas</title>
</head>
<body>
	<%

	List<Persona> personas = (ArrayList) request.getAttribute("listaPersona");
	response.setContentType("application/vnd.ms-excel");
	response.setHeader("Content-disposition", "attachment; filename=reportePersonas.xls");
	%>

	<div class="row">
		<table class="table">
			<thead>
				<tr>
					<th>Id</th>
					<th>Nombre</th>
					<th>Paterno</th>
					<th>Materno</th>
					<th>Edad</th>
					<th>Telefono</th>
					<th>Domicilio</th>
					<th>RFC</th>
				</tr>
			</thead>
			<tbody>


				<%
				for (int i = 0; i < personas.size(); i++) {
				%>
				<tr>
					<td><%=personas.get(i).getId()%></td>
					<td><%=personas.get(i).getNombre()%></td>
					<td><%=personas.get(i).getPaterno()%></td>
					<td><%=personas.get(i).getMaterno()%></td>
					<td><%=personas.get(i).getEdad()%></td>
					<td><%=personas.get(i).getTelefono()%></td>
					<td><%=personas.get(i).getDomicilio()%></td>
					<td><%=personas.get(i).getRfc()%></td>

				</tr>
				<%
				}
				%>

			</tbody>
		</table>
	</div>


</body>
</html>