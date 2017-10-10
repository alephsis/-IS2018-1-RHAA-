/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.unam.ciencias.is.modelo;

import mx.unam.ciencias.is.mapeobd.Usuario;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author ahernandez
 */
public class UsuarioDAO {
    
     /*Sesion para conectarnos a la base de datos*/
    private SessionFactory sessionFactory;
    
    /**
     * Inicialisamos la sesion a la base de datos.
     * @param sessionFactory 
     */
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    /**
     * Guarda un usuario a la base de datos 
     * @param usuario el usuario a guardar.
     */
    public void guardar(Usuario usuario) {
        //se inicia la sesion
        Session session = sessionFactory.openSession();
        //la transaccion a relizar
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            //guardamos el usuario
            session.persist(usuario);
           
            tx.commit();
        }
        catch (Exception e) {
            //Se regresa a un estado consistente 
            if (tx!=null){ 
                tx.rollback();
            }
            e.printStackTrace(); 
        }
        finally {
            //cerramos simpre la sesion
            session.close();
        }
    
    }
    
    /**
     * Elimina el usuario de la base de datos
     * @param usuario el usuario a eliminar
     */
    public void eliminar(Usuario usuario) {
        //aqui va tu codigo
        Session session = sessionFactory.openSession();
        //la transaccion a relizar
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            //eliminamos el usuario
            session.delete(usuario);
           
            tx.commit();
        }
        catch (Exception e) {
            //Se regresa a un estado consistente 
            if (tx!=null){ 
                tx.rollback();
            }
            e.printStackTrace(); 
        }
        finally {
            //cerramos simpre la sesion
            session.close();
        }
    }
    
    /**
     * Actualiza el marcardor en la base de datos
     * @param usuario con los nuevos valores 
     */
    public void actualizar(Usuario usuario) {
        //aqui va tu codigo
        Session session = sessionFactory.openSession();
        //la transaccion a relizar
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            //actualizar el usuario
            session.update(usuario);
           
            tx.commit();
        }
        catch (Exception e) {
            //Se regresa a un estado consistente 
            if (tx!=null){ 
                tx.rollback();
            }
            e.printStackTrace(); 
        }
        finally {
            //cerramos simpre la sesion
            session.close();
        }
    }
    
        /**
     * Regresa el usuario con el correo dado. 
     * @param correo
     * @return el usuario con el correo dado.
     */
    public Usuario getUsuario(String correo) {
        //aqui va tu codigo
        Usuario result= null;
        Session session = sessionFactory.openSession();
        Transaction tx=null;
        try{
        tx=session.beginTransaction();
        String hql= "FROM Usuario WHERE varCorreo = :c";
        Query query = session.createQuery(hql);
        query.setParameter("c",correo);
        result=(Usuario)query.uniqueResult();
        tx.commit();
        }catch (Exception e){
                if(tx != null){
                tx.rollback();
                }
                e.printStackTrace();
                
                }finally{
                        session.close();
                        }
        return result;
    }
}
