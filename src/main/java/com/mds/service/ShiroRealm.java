package com.mds.service;


import com.mds.dao.AdminDAO;
import com.mds.pojo.User;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import javax.inject.Inject;
import javax.inject.Named;

@Named
public class ShiroRealm extends AuthorizingRealm {

    @Inject
    private AdminService adminService;


    /**
     * 验证用户是否有权限
     *
     * @param principalCollection
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {

        User user = (User) principalCollection.getPrimaryPrincipal();
        if (user != null) {
            String role = user.getRolename();

            SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
            info.addRole(role);
//            System.out.println("~~~~info~~~`"+info);
//            System.out.println("~~~~role.getRolename()~~~`"+role);
            return info;
        }


        return null;
    }

    /**
     * 验证用户的账号和密码是否正确
     * @param authenticationToken
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {

        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
        String username = token.getUsername(); //获取用户表单中的账号
        User user = adminService.findByAdminName(username); //根据账号查找对应的对象

        System.out.println(":~~~user~~~"+user);
        if(user != null) {
            if(!user.getState()) {
                throw new LockedAccountException("账号已被禁用1");
            }
            return new SimpleAuthenticationInfo(user,user.getPassword(),getName());
        } else {
            throw new UnknownAccountException("账号或密码错误1");
        }

    }
}
