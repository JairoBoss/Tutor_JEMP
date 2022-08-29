package mx.ulsa.modelo;

public class Usuario {
	private Integer id;
	private String correo;
	private String password;
	private Boolean status;

	public Usuario() {

	}

	public Usuario(Integer id, String correo, String password, Boolean status) {
		super();
		this.id = id;
		this.correo = correo;
		this.password = password;
		this.status = status;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

}
