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
}
