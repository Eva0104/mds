package com.mds.service;

import com.mds.dao.AdminDAO;

import com.mds.pojo.User;
import com.mds.util.ServletUtil;
import com.mds.util.ShiroUtil;
import org.hibernate.type.DateType;
import org.joda.time.DateTime;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import javax.inject.Named;
import javax.servlet.http.HttpServletRequest;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

@Named
@Transactional
public class AdminService {
    @Inject
    private AdminDAO adminDAO;
//    @Inject
//    private LogDAO logDAO;

    /**
     * 通过用户名查找用户
     *
     * @param username
     * @return
     */

    public User findByAdminName(String username) {
        return adminDAO.findUserByName(username);
    }

    /**
     * 保存用户名
     *
     * @param user
     */
    public void save(User user, HttpServletRequest request) {

        user.setCreatime(new Timestamp(System.currentTimeMillis()));
        user.setState(true);
        user.setLoginip(ServletUtil.getRemoteIp(request));
        user.setLogintime(new Timestamp(System.currentTimeMillis()));

        adminDAO.save(user);


    }

    /**
     * 查找所有的用户名
     *
     * @return
     */
    public List<User> findAllUser() {
        return adminDAO.findAll();
    }

    public void saveLog(String remoteIp) {
        User user=adminDAO.findUserByName(ShiroUtil.getCurrentUserName());
        user.setLogintime(new Timestamp(System.currentTimeMillis()));
        user.setLoginip(remoteIp);
        adminDAO.save(user);
    }

    public User findById(Integer id) {
        return adminDAO.findById(id);
    }

    /**
     * 删除用户
     * @param user
     */
    public void del(User user) {
        adminDAO.delBook(user);

    }

    public void save2(User user) {
        adminDAO.save(user);
    }

    /**
     * 保存日志
     *
     * @param remoteIp
     */
//    public void saveLog(String remoteIp) {
//        User user = adminDAO.findById(ShiroUtil.getCurrentUserId());
//        Log log =new Log();
//
//
//        log.setUserid(user.getId());
//        log.setLogintime(new Timestamp(System.currentTimeMillis()));
//        log.setRealname(user.getRealname());
//        log.setTelphone(user.getTelphone());
//        log.setUsername(user.getUsername());
//        log.setLoginip(remoteIp);
//
//
//        logDAO.save(log);
//
//
//    }

    /**
     * 查找所有的登陆日志
     *
     * @return
     */
//    public List<Log> findAllLogList() {
//        return logDAO.findAll();
//    }
}
