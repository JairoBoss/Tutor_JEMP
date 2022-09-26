package mx.ulsa.hibernate;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import mx.ulsa.modelo.Usuario;
import mx.ulsa.util.HibernateUtil;

public class UsuarioDao {

	public boolean saveUsuario(Usuario usuario) {
		boolean exito = false;
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			session.save(usuario);
			transaction.commit();
			exito = true;
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}

		return exito;
	}

	public void updateUsuario(Usuario usuario) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			session.update(usuario);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}

	public void deleteUsuario(int id) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			Usuario user = session.get(Usuario.class, id);
			if (user != null) {
				session.delete(user);
			}
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}

	public Usuario getUser(int id) {
		Transaction transaction = null;
		Usuario user = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			user = session.get(Usuario.class, id);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return user;
	}

	public List<Usuario> getUsuarios() {
		Transaction transaction = null;
		List<Usuario> usuarios = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			usuarios = session.createQuery("from Usuario").getResultList();
			transaction.commit();
			return usuarios;
		} catch (Exception e) {

			e.printStackTrace();
		}
		return null;
	}

	public Usuario getUsuarioByCOrreoAndPassword(String correo, String password) {
		Usuario user = null;
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			user = (Usuario) session.createQuery("from Usuario where correo=:param_correo and password=:param_pass")
					.setParameter("param_correo", correo).setParameter("param_pass", password).uniqueResult();
			transaction.commit();

		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return user;
	}

}