<nav id="sidebarMenu"
	class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
	<div class="position-sticky pt-3 sidebar-sticky">
		<ul class="nav flex-column">
			<li class="nav-item"><a
				class="nav-link ${param.menuActivo == 'dashboard' ? 'active' : ''}"
				href="<%=request.getContextPath()%>/usuario/perfil.jsp"
				aria-current="page" href="#"> <span data-feather="home"
					class="align-text-bottom"></span> Dashboard
			</a></li>
			<li class="nav-item"><a
				class="nav-link ${param.menuActivo == 'usuario' ? 'active' : ''}"
				href="<%=request.getContextPath()%>/usuario/usuario.jsp"> <span
					data-feather="file" class="align-text-bottom"></span> Usuario
			</a></li>

			<h6
				class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted text-uppercase">
				<span>Tarea 2</span> <a class="link-secondary" href="#"
					aria-label="Add a new report"> </a>
			</h6>

			<li class="nav-item"><a
				class="nav-link ${param.menuActivo == 'usuarioTarea' ? 'active' : ''}"
				href="<%=request.getContextPath()%>/Usuario/usuarios"> <span
					data-feather="shopping-cart" class="align-text-bottom"></span>
					Usuario
			</a></li>
			<li class="nav-item"><a
				class="nav-link ${param.menuActivo == 'rolTarea' ? 'active' : ''}"
				href="<%=request.getContextPath()%>/Rol/listarRoles"> <span
					data-feather="users" class="align-text-bottom"></span> Rol
			</a></li>
			<li class="nav-item"><a
				class="nav-link ${param.menuActivo == 'personaTarea' ? 'active' : ''}"
				href="<%=request.getContextPath()%>/Persona/listarPersonas"> <span
					data-feather="bar-chart-2" class="align-text-bottom"></span>
					Persona
			</a></li>
			<li class="nav-item"><a
				class="nav-link ${param.menuActivo == 'productoTarea' ? 'active' : ''}"
				href="<%=request.getContextPath()%>/Producto/listarPersonas"> <span
					data-feather="layers" class="align-text-bottom"></span> Producto
			</a></li>
		</ul>

		<h6
			class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted text-uppercase">
			<span>Saved reports</span> <a class="link-secondary" href="#"
				aria-label="Add a new report"> <span data-feather="plus-circle"
				class="align-text-bottom"></span>
			</a>
		</h6>
		<ul class="nav flex-column mb-2">
			<li class="nav-item"><a class="nav-link" href="#"> <span
					data-feather="file-text" class="align-text-bottom"></span> Current
					month
			</a></li>
			<li class="nav-item"><a class="nav-link" href="#"> <span
					data-feather="file-text" class="align-text-bottom"></span> Last
					quarter
			</a></li>
			<li class="nav-item"><a class="nav-link" href="#"> <span
					data-feather="file-text" class="align-text-bottom"></span> Social
					engagement
			</a></li>
			<li class="nav-item"><a class="nav-link" href="#"> <span
					data-feather="file-text" class="align-text-bottom"></span> Year-end
					sale
			</a></li>
		</ul>
	</div>
</nav>
