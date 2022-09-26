package mx.ulsa.hibernate;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import mx.ulsa.modelo.Persona;
import mx.ulsa.util.HibernateUtil;

public class PersonaDAO {

	public void savePersona(Persona persona) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			session.save(persona);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}
	
	public void updatePersona(Persona persona) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			session.update(persona);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}
	
	public void deletePersona(int id) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			Persona persona = session.get(Persona.class, id);
			if (persona != null) {
				session.delete(persona);
			}
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}
	
	public Persona getPersona(int id) {
		Transaction transaction = null;
		Persona persona = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			persona = session.get(Persona.class, id);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return persona ;
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Persona> getPersonas() {
		Transaction transaction = null;
		List<Persona> personas = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			personas = session.createQuery("from Persona").getResultList();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return personas;
	}
	
	
}
