package com.mds.dao;

import com.mds.pojo.Patients;



import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;


import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;


import javax.inject.Inject;
import javax.inject.Named;
import java.util.List;

@Named

public class PatientsDAO extends BaseDAO<Patients, Integer> {
    @Inject
    private SessionFactory sessionFactory;

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    public List<Patients> findByName(String name) {
        String sql = "select * from t_patients where name=:name";
        SQLQuery query = getSession().createSQLQuery(sql).addEntity(Patients.class);
        query.setParameter("name", name);
        List<Patients> patientlist = query.list();


        return patientlist;

    }

    public List<Patients> findByname(String name) {


        Criteria criteria = getSession().createCriteria(Patients.class);
//        criteria.add(Restrictions.like("name",name));

        criteria.add(Restrictions.or(Restrictions.like("name",name, MatchMode.ANYWHERE),Restrictions.like("pinyin",name, MatchMode.ANYWHERE)));

//        criteria.add(Restrictions.like("name","i", MatchMode.ANYWHERE));
//
        List<Patients> pList = criteria.list();


        return pList;
    }


}
