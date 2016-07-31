package com.kashengit;

import com.mds.dao.PatientsDAO;
import com.mds.pojo.Patients;
import com.mds.service.PatientsService;
import com.mds.util.HibernateUtil;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.inject.Inject;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class TestPatients {
    @Inject
    private PatientsService patientsService;

    @Inject
    private PatientsDAO patientsDAO;
    @Test
    public void testList(){
        List<Patients> list=patientsService.findByName("11");

        for (Patients p:list){
            Assert.assertNotNull(list.size());
            System.out.println("---------------------------");
            System.out.println("---------------------------");
            System.out.println(p.getName());
            System.out.println("--------------");

        }

    }
    @Test
    public void testFindByWheres(){
        List<Patients> list=patientsService.findByname("l");
        System.out.println("---------------------------");
        Assert.assertNotNull(list);
        for (Patients p:list){
            System.out.println("---------------------------");
            System.out.println(p.getName());
            System.out.println("--------------");

        }

    }

    @Test
    public void testFindByWhere(){
        Session session= HibernateUtil.getSession();
        session.beginTransaction();
        Criteria criteria=session.createCriteria(Patients.class);
//        criteria.add(Restrictions.eq("name","lili"));
//        criteria.add(Restrictions.eq("password","lili"));

//        criteria.add(Restrictions.like("name","i", MatchMode.ANYWHERE));

//        Disjunction disjunction=Restrictions.disjunction();
//        disjunction.add(Restrictions.eq("name","lili"));
//        disjunction.add(Restrictions.eq("name","lucy"));
//        criteria.add(disjunction);

//        criteria.add(Restrictions.in("name",new Object[]{"lili","lucy"}));
        criteria.add(Restrictions.or(Restrictions.eq("name","l"),Restrictions.eq("pinyin","l")));


        List<Patients> admins=criteria.list();

        for (Patients ad:admins) {
            System.out.println(ad);
        }
        session.getTransaction().commit();



    }
}
