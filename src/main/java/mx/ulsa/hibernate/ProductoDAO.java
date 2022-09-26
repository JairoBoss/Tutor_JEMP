package mx.ulsa.hibernate;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import mx.ulsa.modelo.Producto;
import mx.ulsa.modelo.Usuario;
import mx.ulsa.util.HibernateUtil;

public class ProductoDAO {
	
	public void saveProducto(Producto producto) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			session.save(producto);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}
	
	public void updateProducto(Producto producto) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			session.update(producto);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}
	
	public void deleteRol(int id) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			Producto procuto= session.get(Producto.class, id);
			if (procuto != null) {
				session.delete(procuto);
			}
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}
	
	public Producto getProducto(int id) {
		Transaction transaction = null;
		Producto producto = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			producto = session.get(Producto.class, id);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return producto ;
	}
	
	@SuppressWarnings("unchecked")
	public List<Producto> getProducto() {
		Transaction transaction = null;
		List<Producto> usuarios = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			usuarios = session.createQuery("from Producto").getResultList();
			transaction.commit();
			return usuarios;
		} catch (Exception e) {

			e.printStackTrace();
		}
		return null;
	}
	

}
