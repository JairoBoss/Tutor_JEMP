package mx.ulsa.controlador;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.ulsa.hibernate.PersonaDAO;
import mx.ulsa.hibernate.UsuarioDao;
import mx.ulsa.modelo.Persona;
import mx.ulsa.modelo.Rol;
import mx.ulsa.modelo.Usuario;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Servlet implementation class UsuarioControlador
 */
public class UsuarioControlador extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PersonaDAO personaDao;
	private UsuarioDao usuarioDao;
	private List<Usuario> listaUsuarios;

	public void init() {
		personaDao = new PersonaDAO();
		usuarioDao = new UsuarioDao();
		listaUsuarios = new ArrayList<Usuario>();
//		listaRoles = new ArrayList<Rol>();
	}

	public UsuarioControlador() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		procesar(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		procesar(request, response);
	}

	protected void procesar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			String action = request.getPathInfo();
			switch (action) {
			case "/login":
				this.perfil(request, response);
				break;
			case "/registrar":
				this.registrar(request, response);
				break;
			case "/registrarUsuarioPersona":
				this.registrarUsuarioPersona(request, response);
				break;
			case "registrarUsuarioTarea":
				this.registarUsuarioTarea(request, response);
				break;
			case "/registrarUsuario":
				this.registrarNuevoUsuario(request, response);
				break;
			case "/usuarios":
				this.listarUsuarios(request, response);
				break;
			case "/editar":
				this.editarUsuario(request, response);
				break;
			case "/actualizar":
				this.actualizarUsuario(request, response);
				break;
			case "/eliminar":
				this.obtnerDatosUsuario(request, response);
				break;
			case "/delete":
				this.borrarUsuario(request, response);
				break;
			case "/crear":
				this.registrarNuevoUsuarioAdmin(request, response);
				break;
			case "/exportar":
				this.exportar(request, response);
				break;
			default:
				break;
			}
		}
	}

	private void exportar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Usuario> listaUsuarios = usuarioDao.getUsuarios();
		System.out.println(listaUsuarios);
		request.setAttribute("listaUsuarios", listaUsuarios);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/user/exportarUsuarios.jsp");
		dispatcher.forward(request, response);
		
	}

	private void registrarNuevoUsuario(HttpServletRequest request, HttpServletResponse response) {
		try {
			// 1.- Recuperar todos los datos del formuladrio
			String correo = request.getParameter("correo");
			String contrasenia = request.getParameter("contrasenia");
			if ((correo == null || correo == "") && (contrasenia == null || contrasenia == "")) {
				request.setAttribute("msg", "Tienes que rellenar todos los datos del formulario");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/usuario/registroNuevoUsuario.jsp");
				dispatcher.forward(request, response);
			} else {
//				2.- Crear un modelo usuario
				Calendar c = Calendar.getInstance();
				c.add(Calendar.YEAR, 1);
				Usuario usuario = new Usuario(correo, contrasenia, true, new Date(), c.getTime());

				boolean exito = this.usuarioDao.saveUsuario(usuario);

				if (exito == true) {
					request.setAttribute("msg", "Usuario creado con exito");
					RequestDispatcher dispatcher = request.getRequestDispatcher("/usuario/registroNuevoUsuario.jsp");
					dispatcher.forward(request, response);
//					response.sendRedirect(request.getContextPath() + "/usuario/registroNuevoUsuario.jsp");
				} else {
					request.setAttribute("msg", "Error al guardar el usuario");
					RequestDispatcher dispatcher = request.getRequestDispatcher("/usuario/registroNuevoUsuario.jsp");
					dispatcher.forward(request, response);
//					response.sendRedirect(request.getContextPath() + "/usuario/registroNuevoUsuario.jsp");
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void registarUsuarioTarea(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		String correo = request.getParameter("correo");
//		String contrasenia = request.getParameter("contrasenia");
//		String estatus = request.getParameter("estatus");
//
//		String fechaRegistro = (String) request.getParameter("fechaRegistro");
//		String fechaVigencia = (String) request.getParameter("fechaVigencia");

		String mensaje = "Ayuda";
		request.setAttribute("mensaje", mensaje);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/usuario/usuarioTarea.jsp");
		dispatcher.forward(request, response);
	}

	private void registrarUsuarioPersona(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1.- Recuperar todos los datos del formulario
		// 2.- Guardarlos en la base de datos
		// 3.- Regresar a la pagina usuario.jsp

//		String correo = request.getParameter("correo");
//		String password = request.getParameter("password");
//		String status = request.getParameter("status");
//
		String nombre = request.getParameter("nombre");
		String apPaterno = request.getParameter("apPaterno");
		String apMaterno = request.getParameter("apMaterno");
		String edad = request.getParameter("edad");
		String telefono = request.getParameter("telefono");

		String mensaje = "Registro creado con exito";
		request.setAttribute("mensaje", mensaje);

//		Persona persona = new Persona(nombre, apPaterno, apMaterno, Integer.parseInt(edad), telefono);
//		System.out.print(persona.toString());
//		personaDao.savePersona(persona);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/usuario/usuario.jsp");
		dispatcher.forward(request, response);

//		request.getRequestDispatcher("/usuario/usuario.jsp").forward(request, response);
	}

	protected void perfil(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String parametroCorreo = request.getParameter("correo");
			String parametroPwd = request.getParameter("contrasenia");
			if ((parametroCorreo == null || parametroCorreo.isEmpty())
					&& (parametroPwd == null || parametroPwd.isEmpty())) {
				request.setAttribute("msg", "Datos de ingresos erróneos");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/usuario/login.jsp");
				dispatcher.forward(request, response);
			} else {
				// Buscar usuario y contraseña en la base de datos
				Usuario usuario = new Usuario();
				usuario.setCorreo(parametroCorreo);
				usuario.setPassword(parametroPwd.trim());

				HttpSession session = request.getSession();
				synchronized (session) {
					session.setAttribute("usuario", usuario);
					response.sendRedirect(request.getContextPath() + "/usuario/perfil.jsp");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "/usuario/login.jsp");
		}
	}

	protected void registrar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String parametroNombre = request.getParameter("name");
		String parametroPaterno = request.getParameter("paterno");
		String parametroMaterno = request.getParameter("materno");
		Integer parametroEdad = Integer.parseInt(request.getParameter("edad"));
		String parametroTelefono = request.getParameter("telefono");
		String parametroCorreo = request.getParameter("correo");
		String parametroPwd = request.getParameter("pwd");
		String parametroEmpresa = request.getParameter("empresa");
		String parametroDireccion = request.getParameter("direccion");

		try {
			Persona persona = new Persona();
			persona.setNombre(parametroNombre);
			persona.setPaterno(parametroPaterno);
			persona.setMaterno(parametroMaterno);
			persona.setEdad(parametroEdad);
			persona.setTelefono(parametroTelefono);

			Usuario usuario = new Usuario();
			usuario.setCorreo(parametroCorreo);
			usuario.setPassword(parametroPwd);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/usuario/login.jsp");
			dispatcher.forward(request, response);
		}
	}

	private void listarUsuarios(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			List<Usuario> listaUsuarios = usuarioDao.getUsuarios();
			System.out.println(listaUsuarios);
			request.setAttribute("listaUsuarios", listaUsuarios);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/user/tablaUsuarios.jsp");
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void editarUsuario(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer id = Integer.parseInt(request.getParameter("id"));

		Usuario user = usuarioDao.getUser(id);
		request.setAttribute("user", user);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/user/editarUsuario.jsp");
		dispatcher.forward(request, response);

	}

	private void actualizarUsuario(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Integer id = Integer.parseInt(request.getParameter("id"));

		Usuario user = usuarioDao.getUser(id);

		String correo = request.getParameter("correo");
		String password = request.getParameter("password");
		String status = request.getParameter("status");
		String fecha = request.getParameter("fecha");
		Boolean estatus = status != "on" ? false : true;
		LocalDate date = LocalDate.parse(fecha);

		Date dateGod = Date.from(date.atStartOfDay(ZoneId.systemDefault()).toInstant());

		Usuario userActualizado = new Usuario(id, correo, password, estatus, user.getFechaRegistro(), dateGod);

		usuarioDao.updateUsuario(userActualizado);
		listarUsuarios(request, response);

	}

	private void obtnerDatosUsuario(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer id = Integer.parseInt(request.getParameter("id"));

		Usuario user = usuarioDao.getUser(id);
		request.setAttribute("user", user);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/user/eliminarUsuario.jsp");
		dispatcher.forward(request, response);

	}

	private void borrarUsuario(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Integer id = Integer.parseInt(request.getParameter("id"));

		usuarioDao.deleteUsuario(id);

		listarUsuarios(request, response);
	}

	private void registrarNuevoUsuarioAdmin(HttpServletRequest request, HttpServletResponse response) {
		try {
			// 1.- Recuperar todos los datos del formuladrio
			String correo = request.getParameter("correo");
			String contrasenia = request.getParameter("contrasenia");
			if ((correo == null || correo == "") && (contrasenia == null || contrasenia == "")) {
				request.setAttribute("msg", "Tienes que rellenar todos los datos del formulario");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/usuario/registroNuevoUsuario.jsp");
				dispatcher.forward(request, response);
			} else {
//				2.- Crear un modelo usuario
				Calendar c = Calendar.getInstance();
				c.add(Calendar.YEAR, 1);
				Usuario usuario = new Usuario(correo, contrasenia, true, new Date(), c.getTime());

				boolean exito = this.usuarioDao.saveUsuario(usuario);

				listarUsuarios(request, response);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
