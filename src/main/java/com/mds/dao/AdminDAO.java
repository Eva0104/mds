package com.mds.dao;

import com.mds.pojo.User;
import com.mds.util.HibernateUtil;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import javax.inject.Inject;
import javax.inject.Named;

@Named
public class AdminDAO extends BaseDAO<User, Integer> {
    @Inject
    private SessionFactory sessionFactory;

    private Session getSession(){
        return sessionFactory.getCurrentSession();
    }
    public User findUserByName(String name) {


        String sql = "select * from t_user where username=:name";
        SQLQuery query = getSession().createSQLQuery(sql).addEntity(User.class);
        query.setParameter("name",name);
        User user= (User) query.uniqueResult();

        return user;
    }
    public void saveUser(User user) {


        String sql = "insert INTO t_user ( username, password,  realname, rolename, telphone) VALUES (:username, :password,  :realname, :rolename, :telphone)";
        SQLQuery query = getSession().createSQLQuery(sql).addEntity(User.class);
        query.setParameter("username",user.getUsername());
        query.setParameter("password",user.getPassword());
        query.setParameter("realname",user.getRealname());
        query.setParameter("rolename",user.getRolename());
        query.setParameter("telphone",user.getTelphone());
        getSession().save(query);
    }
}
