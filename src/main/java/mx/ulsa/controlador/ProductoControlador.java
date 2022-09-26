package mx.ulsa.controlador;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.ulsa.hibernate.ProductoDAO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import mx.ulsa.modelo.Producto;

/**
 * Servlet implementation class ProductoControlador
 */
public class ProductoControlador extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductoDAO productoDao;
	private List<Producto> listaProductos;

	public void init() {
		productoDao = new ProductoDAO();

	}

	public ProductoControlador() {
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
				this.listarProducto(request, response);
				break;
			case "/registrar":
				this.registrarProducto(request, response);
				break;
			case "/editar":
				this.editarProducto(request, response);
				break;
			case "/actualizar":
				this.actualizarProducto(request, response);
				break;
			case "/eliminar":
				this.obtnerDatosProducto(request, response);
				break;
			case "/delete":
				this.borrarProducto(request, response);
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
		List<Producto> listaProductos = productoDao.getProducto();
		request.setAttribute("listaProductos", listaProductos);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/producto/exportarProductos.jsp");
		dispatcher.forward(request, response);
	}

	private void borrarProducto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer id = Integer.parseInt(request.getParameter("id"));
		productoDao.deleteRol(id);
		listarProducto(request, response);
		
	}

	private void obtnerDatosProducto(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer id = Integer.parseInt(request.getParameter("id"));
		Producto producto = productoDao.getProducto(id);
		request.setAttribute("producto", producto);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/producto/eliminarProducto.jsp");
		dispatcher.forward(request, response);

	}

	private void actualizarProducto(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer id = Integer.parseInt(request.getParameter("id"));
		String nombre = request.getParameter("nombre");
		String descripcion = request.getParameter("descripcion");
		Integer precio = Integer.parseInt(request.getParameter("precio"));
		String imagen = request.getParameter("imagen");
		Integer numExistencias = Integer.parseInt(request.getParameter("numExistencias"));
		String codigoBarras = request.getParameter("codigoBarras");
		Integer ivaPorcentaje = Integer.parseInt(request.getParameter("ivaPorcentaje"));

		Producto producto = new Producto(id, nombre, descripcion, precio, imagen, numExistencias, codigoBarras,
				ivaPorcentaje);

		productoDao.updateProducto(producto);
		listarProducto(request, response);
	}

	private void editarProducto(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer id = Integer.parseInt(request.getParameter("id"));
		Producto producto = productoDao.getProducto(id);
		request.setAttribute("producto", producto);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/producto/editarProducto.jsp");
		dispatcher.forward(request, response);

	}

	private void registrarProducto(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nombre = request.getParameter("nombre");
		String descripcion = request.getParameter("descripcion");
		Integer precio = Integer.parseInt(request.getParameter("precio"));
		String imagen = request.getParameter("imagen");
		Integer numExistencias = Integer.parseInt(request.getParameter("numExistencias"));
		String codigoBarras = request.getParameter("codigoBarras");
		Integer ivaPorcentaje = Integer.parseInt(request.getParameter("ivaPorcentaje"));

		Producto producto = new Producto(nombre, descripcion, precio, imagen, numExistencias, codigoBarras,
				ivaPorcentaje);
		productoDao.saveProducto(producto);
		listarProducto(request, response);

	}

	private void listarProducto(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Producto> listaProductos = productoDao.getProducto();
		System.out.println("***********************");
		System.out.println(listaProductos);
		request.setAttribute("listaProductos", listaProductos);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/producto/tablaProductos.jsp");
		dispatcher.forward(request, response);

	}

}
