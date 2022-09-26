<%@page import="mx.ulsa.modelo.Usuario"%>
<%@page import="mx.ulsa.modelo.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	List<Producto> productos = (ArrayList) request.getAttribute("listaProductos");
	response.setContentType("application/vnd.ms-excel");
	response.setHeader("Content-disposition", "attachment; filename=reportePersonas.xls");
	%>
	<table class="table">
		<thead>
			<tr>
				<th>Id</th>
				<th>Nombre</th>
				<th>Descripcion</th>
				<th>Precio</th>
				<th>Imagen</th>
				<th>Stock</th>
				<th>Codigo de barras</th>
				<th>IVA</th>

			</tr>
		</thead>
		<tbody>
			<%
			for (int i = 0; i < productos.size(); i++) {
			%>
			<tr>
				<td><%=productos.get(i).getId()%></td>
				<td><%=productos.get(i).getNombre()%></td>
				<td><%=productos.get(i).getDescripcion()%></td>
				<td><%=productos.get(i).getPrecio()%></td>
				<td><img src="<%=productos.get(i).getImagen()%>" width="70px]" />
				</td>
				<td><%=productos.get(i).getNumExistencias()%></td>
				<td><%=productos.get(i).getCodigoBarras()%></td>
				<td><%=productos.get(i).getIvaPorcentaje()%></td>

			</tr>
			<%
			}
			%>
		</tbody>
</body>
</html>