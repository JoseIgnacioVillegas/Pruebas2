package es.upm.dit.tfg.webLab.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.*;

import es.upm.dit.tfg.webLab.model.Asignatura;
import es.upm.dit.tfg.webLab.model.Plaza;
import es.upm.dit.tfg.webLab.model.Profesor;


import org.hibernate.Session;


public class ProfesorDAOImplementation implements ProfesorDAO{

	public static ProfesorDAOImplementation instance;
	
	private ProfesorDAOImplementation() {
	
	}
	
	public static ProfesorDAOImplementation getInstance() {
		if (null == instance) {
			instance = new ProfesorDAOImplementation();
			}
		return instance;
	}
	
	@Override
	public void createProfesor(Profesor profesor) {
		Session session = SessionFactoryService.get().openSession();
		try {
			session.beginTransaction();

			session.save(profesor);

			session.getTransaction().commit();

		} catch (Exception e) {
		} finally {
			session.close();
		}	
	}
	
	
	
	@Override
	public Profesor readProfesor(int id) {
		

		
		
		
		Profesor profesor = null;
		Session session = SessionFactoryService.get().openSession();

		try {
			session.beginTransaction();
			profesor = session.get(Profesor.class, id);
			session.getTransaction().commit();
		}catch(Exception e) {
			
		}finally {
			session.close();
		}
		return profesor;
	}
	
	@Override
	public void deleteProfesor(Profesor profesor) {
		Session session = SessionFactoryService.get().openSession();
		try {
			session.beginTransaction();

			session.delete(profesor);

			session.getTransaction().commit();

		} catch (Exception e) {
		} finally {
			session.close();
		}	
	}
	
	
	@Override
	
	public List<Profesor> readProfesores() {
			
		Session session = SessionFactoryService.get().openSession();
			
		List<Profesor> profesores = new ArrayList<>();
			
		try {
				
			session.beginTransaction();
			
			profesores.addAll(session.createQuery("select t from Profesor t").getResultList() );
			session.getTransaction().commit();
			
		}catch(Exception e) {
				
		}finally {
			session.close();
		}	
	return profesores;
	}
	
	@Override
	public void updateProfesor(Profesor profesor) {
		Session session = SessionFactoryService.get().openSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(profesor);
			session.getTransaction().commit();
		} catch (Exception e) {
			System.out.println("En el DAO: "+e);
		} finally {
			session.close();
		}		
	}
	
	
	


}