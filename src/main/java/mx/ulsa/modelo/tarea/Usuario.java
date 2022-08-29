package mx.ulsa.modelo.tarea;

public class Usuario {

	private String correo;
	private String contrasenia;
	private Boolean estatus;
//	private Date fechaRegistro;
//	private Date fechaVigencia;
	private String fechaRegistro;
	private String fechaVigencia;

	public Usuario(String correo, String contrasenia, Boolean estatus, String fechaRegistro, String fechaVigencia) {
		super();
		this.correo = correo;
		this.contrasenia = contrasenia;
		this.estatus = estatus;
		this.fechaRegistro = fechaRegistro;
		this.fechaVigencia = fechaVigencia;
	}

	public Usuario() {

	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public String getContrasenia() {
		return contrasenia;
	}

	public void setContrasenia(String contrasenia) {
		this.contrasenia = contrasenia;
	}

	public Boolean getEstatus() {
		return estatus;
	}

	public void setEstatus(Boolean estatus) {
		this.estatus = estatus;
	}

	public String getFechaRegistro() {
		return fechaRegistro;
	}

	public void setFechaRegistro(String fechaRegistro) {
		this.fechaRegistro = fechaRegistro;
	}

	public String getFechaVigencia() {
		return fechaVigencia;
	}

	public void setFechaVigencia(String fechaVigencia) {
		this.fechaVigencia = fechaVigencia;
	}

	@Override
	public String toString() {
		return "Usuario [correo= " + correo + ", contrasenia= " + contrasenia + ", estatus= " + estatus
				+ ", fechaRegistro= " + fechaRegistro + ", fechaVigencia= " + fechaVigencia + "]";
	}
}
