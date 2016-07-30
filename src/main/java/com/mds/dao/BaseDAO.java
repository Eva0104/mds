package com.mds.dao;

import com.mds.util.Page;
import com.mds.util.SearchParam;
import com.mds.util.Strings;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.*;
import org.hibernate.transform.ResultTransformer;

import javax.inject.Inject;
import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

public class BaseDAO<T, PK extends Serializable> {

    @Inject
    private SessionFactory sessionFactory;

    private Class<?> entityClass;

    public BaseDAO() {
        ParameterizedType parameterizedType = (ParameterizedType) this.getClass().getGenericSuperclass();
        entityClass = (Class<?>) parameterizedType.getActualTypeArguments()[0];
    }

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    public void save(T entity) {
        getSession().saveOrUpdate(entity);
    }

    public void delBook(T entity) {
        getSession().delete(entity);
    }

    public T findById(PK id) {
        return (T) getSession().get(entityClass, id);
    }

    public void delete(PK id) {
        getSession().delete(findById(id));
    }


    public List<T> findAll() {
        Criteria criteria = getSession().createCriteria(entityClass);
        return criteria.list();
    }

    public Long count() {
        Criteria criteria = getSession().createCriteria(entityClass);
        criteria.setProjection(Projections.rowCount());
        return (Long) criteria.uniqueResult();
    }

    public Page<T> findByPage(Integer pageNo, Integer pageSize) {
        Integer totalSize = count().intValue();

        Page<T> page = new Page<>(totalSize, pageNo, pageSize);

        Criteria criteria = getSession().createCriteria(entityClass);
        criteria.setFirstResult(page.getStart());
        criteria.setMaxResults(pageSize);

        List<T> list = criteria.list();
        page.setItems(list);

        return page;
    }

    public Long count(List<SearchParam> searchParamList) {
        Criteria criteria = buildCriteriaBySearchParam(searchParamList);

        ResultTransformer resultTransformer = Criteria.DISTINCT_ROOT_ENTITY;

        criteria.setProjection(Projections.rowCount());

        Long count = (Long) criteria.uniqueResult();

        criteria.setProjection(null);
        criteria.setResultTransformer(resultTransformer);
        return count;
    }

    public Page<T> findByParams(Integer pageNo, Integer pageSize, List<SearchParam> searchParamList) {
        Criteria criteria = buildCriteriaBySearchParam(searchParamList);

        Integer totalSize = count(searchParamList).intValue();

        Page<T> page = new Page<>(totalSize, pageNo, pageSize);

        criteria.setFirstResult(page.getStart());
        criteria.setMaxResults(pageSize);

        List<T> list = criteria.list();
        page.setItems(list);

        return page;
    }


    private Criteria buildCriteriaBySearchParam(List<SearchParam> searchParamList) {

        Criteria criteria = getSession().createCriteria(entityClass);

        for (SearchParam searchParam : searchParamList) {
            String propertyName = searchParam.getProperty();
            Object value = searchParam.getValue();
            String type = searchParam.getType();

            if (propertyName.contains("_or_")) {
                String[] propertyNames = propertyName.split("_or_");

                Disjunction disjunction = Restrictions.disjunction();
                for (String name : propertyNames) {
                    Criterion criterion = bulidCondition(type, name, value);
                    disjunction.add(criterion);
                }
                criteria.add(disjunction);
            }else {
                Criterion criterion = bulidCondition(type, propertyName, value);
                criteria.add(criterion);
            }
        }
        return criteria;
    }

    private Criterion bulidCondition(String type, String propertyName, Object value) {
        if ("eq".equalsIgnoreCase(type)) {
            return Restrictions.eq(propertyName, value);
        } else if ("ge".equalsIgnoreCase(type)) {
            return Restrictions.ge(propertyName, value);
        } else if ("le".equalsIgnoreCase(type)) {
            return Restrictions.le(propertyName, value);
        } else if ("gt".equalsIgnoreCase(type)) {
            return Restrictions.gt(propertyName, value);
        } else if ("lt".equalsIgnoreCase(type)) {
            return Restrictions.lt(propertyName, value);
        } else if ("like".equalsIgnoreCase(type)) {
            return Restrictions.like(propertyName, value.toString(), MatchMode.ANYWHERE);
        }
        return null;
    }



}
