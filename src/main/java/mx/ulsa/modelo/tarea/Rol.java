package mx.ulsa.modelo.tarea;

public class Rol {
	private String nombre;
	private String descripcion;

	public Rol(String nombre, String descripcion) {
		super();
		this.nombre = nombre;
		this.descripcion = descripcion;
	}

	public Rol() {

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

	@Override
	public String toString() {
		return "Rol [nombre= " + nombre + ", descripcion= " + descripcion + "]";
	}
}
