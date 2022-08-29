<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout - Tutorial Jairo</title>
</head>
<body>
	<%
	session.invalidate();
	%>
	<jsp:forward page="./login.jsp"></jsp:forward>
	<script type='text/javascript'>
		(function() {
			window.location.reload();
		})();
	</script>
</body>
</html>