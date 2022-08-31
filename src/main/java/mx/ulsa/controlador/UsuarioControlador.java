
package mx.ulsa.controlador;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.ulsa.modelo.Persona;
import mx.ulsa.modelo.Usuario;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class UsuarioControlador
 */
public class UsuarioControlador extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UsuarioControlador() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		procesar(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
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
			default:
				break;
			}
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
//		String nombre = request.getParameter("nombre");
//		String paterno = request.getParameter("paterno");
//		String materno = request.getParameter("materno");
//		String edad = request.getParameter("edad");
//		String telefono = request.getParameter("telefono");

		String mensaje = "Ayuda";
		request.setAttribute("mensaje", mensaje);

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

}
