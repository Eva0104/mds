package com.mds.service;

import com.mds.dao.AdminDAO;
import com.mds.pojo.User;
import org.hibernate.type.DateType;
import org.joda.time.DateTime;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import javax.inject.Named;
import java.sql.Date;
import java.sql.Timestamp;

@Named
@Transactional
public class AdminService {
    @Inject
    private AdminDAO adminDAO;

    public User findByAdminName(String username) {
        return adminDAO.findUserByName(username);
    }


    public void save(User user) {

        user.setCreatime(new Timestamp(System.currentTimeMillis()));
        user.setState(true);
        adminDAO.save(user);
    }
}
