package com.mds.service;

import com.mds.dao.AdminDAO;
import com.mds.pojo.User;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import javax.inject.Named;

@Named
@Transactional
public class AdminService {
    @Inject
    private AdminDAO adminDAO;

    public User findByAdminName(String username) {
        return adminDAO.findUserByName(username);
    }


}
