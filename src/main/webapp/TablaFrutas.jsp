<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tabla de frutas</title>
<body>
	<center>
		<h2>
			Comparar Fresas y Zarzamoras			
		</h2>
		<%
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-disposition", "attachment; filename=ExcelFrutas.xls");
		%>
	</center>
	
	<table>
		<tr>
			<th></th>
			<th>
				Fresas
			</th>
			<th>
				Zarzamoras
			</th>		
		</tr>
		<tr>
			<th>Primer cuarto</th>
			<th>
				2307
			</th>
			<th>
				4706
			</th>		
		</tr>
		<tr>
			<th>Segundo cuarto</th>
			<th>
				2982
			</th>
			<th>
				5104
			</th>		
		</tr>
		<tr>
			<th>Tercer cuarto</th>
			<th>
				3011
			</th>
			<th>
				5220
			</th>		
		</tr>
		<tr>
			<th>Cuarto cuarto</th>
			<th>
				3055
			</th>
			<th>
				5287
			</th>		
		</tr>
	</table>
</body>
</html>