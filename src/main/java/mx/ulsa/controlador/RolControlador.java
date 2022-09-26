package mx.ulsa.controlador;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.ulsa.hibernate.RolDAO;
import mx.ulsa.modelo.Rol;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet implementation class RolControlador
 */
public class RolControlador extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RolDAO rolDao = null;
	private List<Rol> listaRoles;

	public void init() {
		rolDao = new RolDAO();
		listaRoles = new ArrayList<Rol>();
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RolControlador() {
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
			System.out.println(action);

			if (action.contains("/registrar")) {
				this.registrar(request, response);
			}

			if (action.contains("eliminar")) {
				this.delete(request, response);
			}

			if (action.contains("listarRoles")) {
				this.listarRoles(request, response);
			}

			if (action.contains("editar")) {
				this.editarRol(request, response);
			}

			if (action.contains("actualizar")) {
				this.updateRol(request, response);
			}
			if (action.contains("exportar")) {
				this.exportarRoles(request, response);
			}

		}
	}

	private void exportarRoles(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Rol> listaRoles = rolDao.getRoles();

		request.setAttribute("listaRoles", listaRoles);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/usuario/exportarRoles.jsp");
		dispatcher.forward(request, response);
	}

	private void updateRol(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getPathInfo().split("/")[2]);
		String nombre = request.getParameter("nombre");
		String descripcion = request.getParameter("descripcion");
		Rol rol = new Rol(id, nombre, descripcion);

		System.out.print("El rol a actualiuzar es: " + rol.toString());
		rolDao.updateRol(rol);

		listarRoles(request, response);
	}

	private void editarRol(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getPathInfo().split("/")[2]);
		Rol rolObtenido = rolDao.getRol(id);

		System.out.print("El rol obtenido es: " + rolObtenido.toString());
		HttpSession session = request.getSession();

		synchronized (session) {
			session.setAttribute("rolObtenido", rolObtenido);
		}

		response.sendRedirect(request.getContextPath() + "/usuario/rol.jsp");

	}

	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getPathInfo().split("/")[2]);
		rolDao.deleteRol(id);
		listarRoles(request, response);
	}

	private void registrar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String nombre = request.getParameter("nombre");
		String descripcion = request.getParameter("descripcion");

		String mensajeError = "Mensaje error";
		request.setAttribute("mensajeError", mensajeError);

		Rol rol = new Rol(nombre, descripcion);

		rolDao.saveRol(rol);

		listarRoles(request, response);
	}

	private void listarRoles(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Rol> listaRoles = rolDao.getRoles();
		System.out.println(listaRoles);

		request.setAttribute("listaRoles", listaRoles);

//		RequestDispatcher dispatcher = request.getRequestDispatcher("/usuario/rol.jsp");
//		dispatcher.forward(request, response);
////		
//		response.sendRedirect(request.getContextPath() + "/usuario/rol.jsp");

		HttpSession session = request.getSession();

		synchronized (session) {
			session.setAttribute("listaRoles", listaRoles);
			session.setAttribute("rolObtenido", null);
		}

		response.sendRedirect(request.getContextPath() + "/usuario/rol.jsp");
	}

}
