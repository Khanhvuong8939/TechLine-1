/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless
public class UsersFacade extends AbstractFacade<Users> implements UsersFacadeLocal {

    @PersistenceContext(unitName = "TechLine-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UsersFacade() {
        super(Users.class);
    }

    @Override
    public Users checkLogin(String userID, String pwd) {
        Query q = em.createQuery("SELECT u FROM Users u WHERE u.userId = :userId and u.password = :password and u.userStatus = :userStatus");
        try {
            q.setParameter("userId", userID);
            q.setParameter("password", pwd);
            q.setParameter("userStatus", true);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (Users) q.getSingleResult();
    }

    @Override
    public List<Users> getListSeller() {
        Query q = em.createNamedQuery("Users.findByRole");
        try{
            q.setParameter("role", "seller");
        } catch(Exception e){
            e.printStackTrace();
        }
        return q.getResultList();
    }
    
    @Override
    public List<Users> getListCustomer() {
        Query q = em.createQuery("SELECT u FROM Users u WHERE u.role = :role ORDER BY u.customers.point DESC");
        try{
            q.setParameter("role", "customer");
        } catch(Exception e){
            e.printStackTrace();
        }
        return q.getResultList();
    }
}
