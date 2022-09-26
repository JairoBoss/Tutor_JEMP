package mx.ulsa.modelo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "usuario")
public class Usuario {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;

	@Column(name = "correo")
	private String correo;

	@Column(name = "password")
	private String password;

	@Column(name = "status")
	private Boolean status;

	@Column(name = "fechaRegistro")
	private Date fechaRegistro;

	@Column(name = "fechaVigencia")
	private Date fechaVigencia;

	public Usuario() {

	}
	
	public Usuario(Integer id, String correo, String password, Boolean status, Date fechaVigencia) {
		super();
		this.id = id;
		this.correo = correo;
		this.password = password;
		this.status = status;
	
		this.fechaVigencia = fechaVigencia;
	}

	public Usuario(Integer id, String correo, String password, Boolean status, Date fechaRegistro, Date fechaVigencia) {
		super();
		this.id = id;
		this.correo = correo;
		this.password = password;
		this.status = status;
		this.fechaRegistro = fechaRegistro;
		this.fechaVigencia = fechaVigencia;
	}
	
	public Usuario(String correo, String password, Boolean status, Date fechaRegistro, Date fechaVigencia) {
		super();
		
		this.correo = correo;
		this.password = password;
		this.status = status;
		this.fechaRegistro = fechaRegistro;
		this.fechaVigencia = fechaVigencia;
	}
	

	@Override
	public String toString() {
		return "Usuario [id=" + id + ", correo=" + correo + ", password=" + password + ", status=" + status
				+ ", fechaRegistro=" + fechaRegistro + ", fechaVigencia=" + fechaVigencia + "]";
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

	public Date getFechaRegistro() {
		return fechaRegistro;
	}

	public void setFechaRegistro(Date fechaRegistro) {
		this.fechaRegistro = fechaRegistro;
	}

	public Date getFechaVigencia() {
		return fechaVigencia;
	}

	public void setFechaVigencia(Date fechaVigencia) {
		this.fechaVigencia = fechaVigencia;
	}

}
