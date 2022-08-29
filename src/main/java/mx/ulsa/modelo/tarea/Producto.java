package mx.ulsa.modelo.tarea;

public class Producto {
	private String nombre;
	private String descripcion;
	private Integer precio;
	private String imagen;
	private Integer numExistencias;
	private String codigoBarras;
	private Float ivaPorcentaje;

	public Producto(String nombre, String descripcion, Integer precio, String imagen, Integer numExistencias,
			String codigoBarras, Float ivaPorcentaje) {
		super();
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.precio = precio;
		this.imagen = imagen;
		this.numExistencias = numExistencias;
		this.codigoBarras = codigoBarras;
		this.ivaPorcentaje = ivaPorcentaje;
	}

	public Producto() {

	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Integer getPrecio() {
		return precio;
	}

	public void setPrecio(Integer precio) {
		this.precio = precio;
	}

	public String getImagen() {
		return imagen;
	}

	public void setImagen(String imagen) {
		this.imagen = imagen;
	}

	public Integer getNumExistencias() {
		return numExistencias;
	}

	public void setNumExistencias(Integer numExistencias) {
		this.numExistencias = numExistencias;
	}

	public String getCodigoBarras() {
		return codigoBarras;
	}

	public void setCodigoBarras(String codigoBarras) {
		this.codigoBarras = codigoBarras;
	}

	public Float getIvaPorcentaje() {
		return ivaPorcentaje;
	}

	public void setIvaPorcentaje(Float ivaPorcentaje) {
		this.ivaPorcentaje = ivaPorcentaje;
	}

	@Override
	public String toString() {
		return "Producto [nombre= " + nombre + ", descripcion= " + descripcion + ", precio= " + precio + ", imagen= "
				+ imagen + ", numExistencias= " + numExistencias + ", codigoBarras= " + codigoBarras
				+ ", ivaPorcentaje= " + ivaPorcentaje + "]";
	}
}
