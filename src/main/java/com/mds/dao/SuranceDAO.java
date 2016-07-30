package com.mds.dao;

import com.mds.pojo.Surance;
import com.mds.pojo.User;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import javax.inject.Inject;
import javax.inject.Named;

@Named
public class SuranceDAO extends BaseDAO<Surance,Integer> {
    @Inject
    private SessionFactory sessionFactory;

    private Session getSession(){
        return sessionFactory.getCurrentSession();
    }
    public Surance findByName(String hctname) {
        String sql = "select * from t_user where username=:name";
        SQLQuery query = getSession().createSQLQuery(sql).addEntity(Surance.class);
        query.setParameter("name",hctname);
        Surance surance= (Surance) query.uniqueResult();

        return surance;
    }
}
