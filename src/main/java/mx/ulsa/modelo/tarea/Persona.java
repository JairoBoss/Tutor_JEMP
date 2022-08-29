package mx.ulsa.modelo.tarea;

public class Persona {
	private String nombre;
	private String apPaterno;
	private String apMaterno;
	private Integer edad;
	private String rfc;
	private String telefono;
	private String fechaNacimiento;
	private String domicilio;

	public Persona(String nombre, String apPaterno, String apMaterno, Integer edad, String rfc, String telefono,
			String fechaNacimiento, String domicilio) {
		super();
		this.nombre = nombre;
		this.apPaterno = apPaterno;
		this.apMaterno = apMaterno;
		this.edad = edad;
		this.rfc = rfc;
		this.telefono = telefono;
		this.fechaNacimiento = fechaNacimiento;
		this.domicilio = domicilio;
	}

	public Persona() {
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApPaterno() {
		return apPaterno;
	}

	public void setApPaterno(String apPaterno) {
		this.apPaterno = apPaterno;
	}

	public String getApMaterno() {
		return apMaterno;
	}

	public void setApMaterno(String apMaterno) {
		this.apMaterno = apMaterno;
	}

	public Integer getEdad() {
		return edad;
	}

	public void setEdad(Integer edad) {
		this.edad = edad;
	}

	public String getRfc() {
		return rfc;
	}

	public void setRfc(String rfc) {
		this.rfc = rfc;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getFechaNacimiento() {
		return fechaNacimiento;
	}

	public void setFechaNacimiento(String fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	public String getDomicilio() {
		return domicilio;
	}

	public void setDomicilio(String domicilio) {
		this.domicilio = domicilio;
	}

	@Override
	public String toString() {
		return "Persona [nombre= " + nombre + ", apPaterno= " + apPaterno + ", apMaterno= " + apMaterno + ", edad= "
				+ edad + ", rfc= " + rfc + ", telefono= " + telefono + ", fechaNacimiento= " + fechaNacimiento
				+ ", domicilio= " + domicilio + "]";
	}
}
