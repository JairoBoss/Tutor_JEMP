package mx.ulsa.util;

import java.util.Properties;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;

import mx.ulsa.modelo.Persona;
import mx.ulsa.modelo.Producto;
import mx.ulsa.modelo.Rol;
import mx.ulsa.modelo.Usuario;

public class HibernateUtil {

	private static SessionFactory sessionFactory;

	public static SessionFactory getSessionFactory() {
		if (sessionFactory == null) {
			try {
				Configuration configuration = new Configuration();

				Properties settings = new Properties();

				settings.put(Environment.DRIVER, "org.postgresql.Driver");
				settings.put(Environment.URL, "jdbc:postgresql://localhost:5432/db_tutor");
				settings.put(Environment.USER, "postgres");
				settings.put(Environment.PASS, "123");
				settings.put(Environment.DIALECT, "org.hibernate.dialect.PostgreSQLDialect");

				settings.put(Environment.SHOW_SQL, "true");

				settings.put(Environment.CURRENT_SESSION_CONTEXT_CLASS, "thread");

				settings.put(Environment.HBM2DDL_AUTO, "update"); // create-drop //

				configuration.setProperties(settings);

				configuration.addAnnotatedClass(Rol.class);
				configuration.addAnnotatedClass(Persona.class);				
				configuration.addAnnotatedClass(Usuario.class);
				configuration.addAnnotatedClass(Producto.class);

				ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
						.applySettings(configuration.getProperties()).build();

				System.out.println("Hibernate Java Config serviceRegistry creado");

				sessionFactory = configuration.buildSessionFactory(serviceRegistry);

			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		return sessionFactory;
	}
}
