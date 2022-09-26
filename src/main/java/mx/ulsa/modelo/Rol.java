package mx.ulsa.modelo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "rol")
public class Rol {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;

	@Column(name = "nombre_rol")
	private String nombre;

	@Column(name = "descripcion")
	private String descripcion;
	
	public Rol() {
		
	}

	public Rol(Integer id, String nombre, String descripcion) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.descripcion = descripcion;
	}

	public Rol(String nombre, String descripcion) {
		super();
		this.nombre = nombre;
		this.descripcion = descripcion;
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

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	@Override
	public String toString() {
		return "Rol [id=" + id + ", nombre=" + nombre + ", descripcion=" + descripcion + "]";
	}

}
