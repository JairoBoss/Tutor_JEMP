<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="mx.ulsa.modelo.Usuario"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Perfil - Tutorial Jairo nuevo</title>
<jsp:include page="/componentes/bootstrap.jsp" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/bootstrap-5.0.2/dashboard.css" />

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/bootstrap-5.0.2/dashboard.rtl.css" />



<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/bootstrap.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/widgets/chat.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/app.css">
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/assets/images/favicon.svg"
	type="image/x-icon">

</head>
<body>
	<%
	Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
	%>

	<c:if test="${usuario == null }">
		<jsp:forward page="./login.jsp"></jsp:forward>
	</c:if>

	<jsp:include page="/componentes/mainHeader.jsp">
		<jsp:param name="usuarioCorreo" value="${usuario.getCorreo() }" />
	</jsp:include>
	<div class="container-fluid">
		<div class="row">
			<jsp:include page="/componentes/menuLateral.jsp">
				<jsp:param name="menuActivo" value="dashboard" />
			</jsp:include>
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">




				

				<br /><br />
				<section id="basic-vertical-layouts">
				<div class="card-header">
					<h4 class="card-title">Nuevos mensajes</h4>
				</div>
					<div class="col-md1 col-12">
						<div class="row">
							<div class="col-md1">
								<div class="card">
									<div class="card-header">
										<div class="media d-flex align-items-center">
											<div class="avatar me-3">
												<img
													src="<%=request.getContextPath()%>/assets/images/faces/1.jpg"
													alt="" srcset=""> <span
													class="avatar-status bg-success"></span>
											</div>
											<div class="name flex-grow-1">
												<h6 class="mb-0">Jairo</h6>
												<span class="text-xs">Online</span>
											</div>
											<button class="btn btn-sm">
												<i data-feather="x"></i>
											</button>
										</div>
									</div>
									<div class="card-body pt-4 bg-grey">
										<div class="chat-content">
											<div class="chat">
												<div class="chat-body">
													<div class="chat-message">Hola Jairo, Como te puedo ayudar?</div>
												</div>
											</div>
											<div class="chat chat-left">
												<div class="chat-body">
													<div class="chat-message">Hola!, estoy buscando una nueva plantilla para un proyecto</div>
													<div class="chat-message">De preferencia que use styled-components </div>
												</div>
											</div>
											<div class="chat">
												<div class="chat-body">
													<div class="chat-message">De momento te puedo recomendar usar </div>
													<div class="chat-message"><a href="https://tokyo.bloomui.com/">Tokyo React Typescript Admin Dashboard</a></div>
												</div>
											</div>
											<div class="chat chat-left">
												<div class="chat-body">
													<div class="chat-message">Ok gracias, creo que me puede servir :)</div>
												</div>
											</div>
										</div>
									</div>
									<div class="card-footer">
										<div
											class="message-form d-flex flex-direction-column align-items-center">
											<a href="http://" class="black"><i data-feather="smile"></i></a>
											<div class="d-flex flex-grow-1 ml-4">
												<input type="text" class="form-control"
													placeholder="Type your message..">
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>










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