package es.upm.dit.tfg.webLab.dao;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import es.upm.dit.tfg.webLab.model.Asignatura;
import es.upm.dit.tfg.webLab.model.Grupo;
import es.upm.dit.tfg.webLab.model.GrupoClase;


public class GrupoClaseDAOImplementation implements GrupoClaseDAO{
	public static GrupoClaseDAOImplementation instance;
	
	private GrupoClaseDAOImplementation() {
	
	}
	
	public static GrupoClaseDAOImplementation getInstance() {
		if (null == instance) {
			instance = new GrupoClaseDAOImplementation();
			}
		return instance;
	}
	
	@Override
	public void createGrupoClase(GrupoClase grupo) {
		Session session = SessionFactoryService.get().openSession();
		try {
			session.beginTransaction();

			session.save(grupo);

			session.getTransaction().commit();

		} catch (Exception e) {
		} finally {
			session.close();
		}	
	}



	@Override
	public void deleteGrupoClase(GrupoClase grupo) {
		Session session = SessionFactoryService.get().openSession();
		try {
			session.beginTransaction();

			session.delete(grupo);

			session.getTransaction().commit();

		} catch (Exception e) {
		} finally {
			session.close();
		}	
	}


	@Override
	public GrupoClase readGrupoClase(int id) {
		GrupoClase grup = null;
		Session session = SessionFactoryService.get().openSession();
		try {
			session.beginTransaction();

			grup = session.get(GrupoClase.class, id);

			session.getTransaction().commit();
		}catch(Exception e) {
			
		}finally {
			session.close();
		}
		return grup;
	}

	
	/*
	@Override
	public List<Grupo> readGrupos() {
		Session session = SessionFactoryService.get().openSession();
		List<Grupo> grupos = new ArrayList<>();
		try {
			session.beginTransaction();
			grupos.addAll(session.createQuery("select t from Grupo t").getResultList() );
			session.getTransaction().commit();
		}catch(Exception e) {
			
		}finally {
			session.close();
		}
		return grupos;
	}

*/
	@Override
	public void updateGrupoClase(GrupoClase grupo) {
		Session session = SessionFactoryService.get().openSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(grupo);
			session.getTransaction().commit();
		} catch (Exception e) {
			
		} finally {
			session.close();
		}		
	}

}