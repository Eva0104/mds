//package com.mds.dao;
//
//import com.mds.pojo.Log;
//import com.mds.pojo.User;
//import org.hibernate.SQLQuery;
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//
//import javax.inject.Inject;
//import javax.inject.Named;
//
//@Named
//public class LogDAO extends BaseDAO<Log,Integer> {
//
//    @Inject
//    private SessionFactory sessionFactory;
//
//    private Session getSession(){
//        return sessionFactory.getCurrentSession();
//    }
//    public Log findByUsername(String name) {
//
//
//        String sql = "select * from t_log where username=:name";
//        SQLQuery query = getSession().createSQLQuery(sql).addEntity(User.class);
//        query.setParameter("name",name);
//        Log log= (Log) query.uniqueResult();
//
//        return log;
//    }
//}
