<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tratar errores</title>
</head>
<body>
	<%@ page errorPage="PaginaError.jsp"%>

	<%
	String meses = request.getParameter("meses");
	int m = Integer.parseInt(meses);
	%>
</body>
</html>