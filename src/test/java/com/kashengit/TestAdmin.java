package com.kashengit;

import com.mds.dao.AdminDAO;
import com.mds.pojo.User;
import com.mds.service.AdminService;
import org.apache.commons.codec.digest.DigestUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class TestAdmin {
    @Inject
    private AdminService adminService;
    @Test
    public void testAdmin(){
        User user = adminService.findByAdminName("admin");
        System.out.println(user.getPassword());
        String pwd= DigestUtils.md5Hex("123123");
        System.out.println(user.getPassword().equals(pwd));
    }
}
