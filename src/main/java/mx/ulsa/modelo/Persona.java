package mx.ulsa.modelo;

public class Persona {
	private Integer id;
	private String nombre;
	private String paterno;
	private String materno;
	private Integer edad;
	private String telefono;

	public Persona(Integer id, String nombre, String paterno, String materno, Integer edad, String telefono) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.paterno = paterno;
		this.materno = materno;
		this.edad = edad;
		this.telefono = telefono;
	}

	public Persona() {

	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getPaterno() {
		return paterno;
	}

	public void setPaterno(String paterno) {
		this.paterno = paterno;
	}

	public String getMaterno() {
		return materno;
	}

	public void setMaterno(String materno) {
		this.materno = materno;
	}

	public Integer getEdad() {
		return edad;
	}

	public void setEdad(Integer edad) {
		this.edad = edad;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
}
