package com.mds.controller;

import com.mds.dto.FlashMessage;
import com.mds.pojo.User;
import com.mds.service.AdminService;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

@Controller
public class IndexController {
    @Inject
    private AdminService adminService;

    /**
     * 进入登录界面
     * @return
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String admin() {
        return "/index";

    }

    /**
     * p判断是否正确
     * @param
     * @return
     */

    @RequestMapping(value = "/", method = RequestMethod.POST)
    public String login(String username, String password , HttpServletRequest request,
                        RedirectAttributes redirectAttributes) {
        Subject subject= SecurityUtils.getSubject();
        if(subject.isAuthenticated()){
            subject.logout();

        }

        try {
            UsernamePasswordToken usernamePasswordToken =
                    new UsernamePasswordToken(username, DigestUtils.md5Hex(password));
            subject.login(usernamePasswordToken);
            return "/home";
        }catch (LockedAccountException ex) {
            redirectAttributes.addFlashAttribute("message", new FlashMessage(FlashMessage.state_error, "账号已被禁用"));
        } catch (AuthenticationException exception) {
            redirectAttributes.addFlashAttribute("message", new FlashMessage(FlashMessage.state_error, "账号或密码错误"));
        }
        return "redirect:/";

    }

    /**
     * 添加账号
     * @return
     */
    @RequestMapping(value = "/admin/add", method = RequestMethod.GET)
    public String adminAdd(){
        return "/admin/mangerAdmin";
    }

    /**
     * 验证是否账号已存在
     * @param username
     * @return
     */
    @RequestMapping(value = "/admin/validate/username",method = RequestMethod.GET)
    @ResponseBody
    public  String validate(String username){
        User user=adminService.findByAdminName(username);
        if(user==null){
            return "true";

        }else{
            return "false";
        }

    }
    @RequestMapping(value = "/admin/new",method = RequestMethod.POST)
    @ResponseBody
    public  String newAdd(User user){
        user.setPassword(DigestUtils.md5Hex(user.getPassword()));
        adminService.save(user);
        return "success";

    }



}
