package com.mds.util;


import com.mds.pojo.User;
import org.apache.shiro.SecurityUtils;

public class ShiroUtil {
    public static User getCurrentUser(){
        return (User) SecurityUtils.getSubject().getPrincipal();
    }
    public static Integer getCurrentUserId(){
        return getCurrentUser().getId();
    }
    public static String getCurrentUserName(){
        return getCurrentUser().getUsername();
    }
    public static boolean isAdmin() {
        return getCurrentUser().getRolename().equals("管理员");
    }

    public static boolean isEmployee() {
        return getCurrentUser().getRolename().equals("员工");
    }

//    public static boolean isManager() {
//        return getCurrentUser().getRole().getRolename().equals("经理");
//    }
}
