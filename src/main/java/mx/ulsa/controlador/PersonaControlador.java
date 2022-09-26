package mx.ulsa.controlador;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.ulsa.hibernate.PersonaDAO;
import mx.ulsa.hibernate.RolDAO;
import mx.ulsa.modelo.Persona;
import mx.ulsa.modelo.Rol;
import mx.ulsa.modelo.Usuario;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class PersonaControlador extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PersonaDAO personaDao = null;
	private List<Persona> listaPersonas;

	public void init() {
		personaDao = new PersonaDAO();
		listaPersonas = new ArrayList<Persona>();
	}

	public PersonaControlador() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
			case "/listarPersonas":
				this.listarPersonas(request, response);
				break;
			case "/registrar":
				this.registrarPersonas(request, response);
				break;
			case "/editar":
				this.editarPersona(request, response);
				break;
			case "/actualizar":
				this.actualizarPersona(request, response);
				break;
			case "/eliminar":
				this.obtnerDatosPersona(request, response);
				break;
			case "/delete":
				this.borrarPersona(request, response);
				break;
			case "/crear":
				this.registrarNuevaPersona(request, response);
				break;
			case "/exportar":
				this.exportar(request, response);
				break;
			default:
				break;
			}
		}
	}

	private void registrarPersonas(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nombre = request.getParameter("nombre");
		String apPaterno = request.getParameter("apPaterno");
		String apMaterno = request.getParameter("apMaterno");
		Integer edad = Integer.parseInt(request.getParameter("edad"));
		String rfc = request.getParameter("rfc");
		String telefono = request.getParameter("telefono");
		String fechaNacimiento = request.getParameter("fechaNacimiento");
		String domicilio = request.getParameter("domicilio");

		LocalDate date = LocalDate.parse(fechaNacimiento);

		Date dateGod = Date.from(date.atStartOfDay(ZoneId.systemDefault()).toInstant());

		System.out.println(nombre);
		Persona persona = new Persona(nombre, apPaterno, apMaterno, edad, rfc, telefono, dateGod, domicilio);

		personaDao.savePersona(persona);

		listarPersonas(request, response);

	}

	private void editarPersona(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer id = Integer.parseInt(request.getParameter("id"));
		Persona persona = personaDao.getPersona(id);
		request.setAttribute("persona", persona);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/persona/editarPersona.jsp");
		dispatcher.forward(request, response);

	}

	private void listarPersonas(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Persona> listaPersona = personaDao.getPersonas();
		request.setAttribute("listaPersona", listaPersona);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/persona/tablaPersona.jsp");
		dispatcher.forward(request, response);
	}

	private void actualizarPersona(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer id = Integer.parseInt(request.getParameter("id"));
		String nombre = request.getParameter("nombre");
		String apPaterno = request.getParameter("apPaterno");
		String apMaterno = request.getParameter("apMaterno");
		Integer edad = Integer.parseInt(request.getParameter("edad"));
		String rfc = request.getParameter("rfc");
		String telefono = request.getParameter("telefono");
		String fechaNacimiento = request.getParameter("fechaNacimiento");
		String domicilio = request.getParameter("domicilio");

		LocalDate date = LocalDate.parse(fechaNacimiento);

		Date dateGod = Date.from(date.atStartOfDay(ZoneId.systemDefault()).toInstant());

		Persona persona = new Persona(id, nombre, apPaterno, apMaterno, edad, rfc, telefono, dateGod, domicilio);

		personaDao.updatePersona(persona);

		listarPersonas(request, response);
	}

	private void obtnerDatosPersona(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer id = Integer.parseInt(request.getParameter("id"));
		Persona persona = personaDao.getPersona(id);
		request.setAttribute("persona", persona);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/persona/eliminarPersona.jsp");
		dispatcher.forward(request, response);
	}

	private void borrarPersona(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer id = Integer.parseInt(request.getParameter("id"));
		personaDao.deletePersona(id);
		listarPersonas(request, response);
	}

	private void registrarNuevaPersona(HttpServletRequest request, HttpServletResponse response) {

	}

	private void exportar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Persona> listaPersona = personaDao.getPersonas();
		request.setAttribute("listaPersona", listaPersona);
		request.setAttribute("listaPersona", listaPersona);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/persona/exportarPersonas.jsp");
		dispatcher.forward(request, response);
	}

}
