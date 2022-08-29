<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login - Tutor Jairo</title>
<jsp:include page="/componentes/bootstrap.jsp"></jsp:include>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/bootstrap-5.0.2/signin.css" />
</head>
<body class="text-center">
	<main class="form-signin w-100 m-auto">
		<form action="<%=request.getContextPath()%>/Usuario/login">
			<img class="mb-4"
				src="<%=request.getContextPath()%>/images/login.png" alt=""
				width="72">
			<h1 class="h3 mb-3 fw-normal">Please sign in</h1>

			<div class="form-floating">
				<input type="email" class="form-control" id="floatingInput"
					name="correo" placeholder="name@example.com"> <label
					for="floatingInput">Email address</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="floatingPassword"
					name="contrasenia" placeholder="Password"> <label
					for="floatingPassword">Password</label>
			</div>

			<div class="checkbox mb-3">
				<label> <input type="checkbox" value="remember-me">
					Remember me
				</label>
			</div>
			<button class="w-100 btn btn-lg btn-primary" type="submit">Sign
				in</button>
			<p class="mt-5 mb-3 text-muted">&copy; 2017 - 2022</p>
		</form>
	</main>
</body>
</html>