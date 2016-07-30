package com.mds.controller;

import com.mds.dto.FlashMessage;

import com.mds.dto.JSONResult;
import com.mds.exception.ForbiddenException;
import com.mds.exception.NotFoundException;
import com.mds.pojo.User;
import com.mds.service.AdminService;
import com.mds.util.ServletUtil;

import com.mds.util.ShiroUtil;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class IndexController {
    @Inject
    private AdminService adminService;

    /**
     * 进入登录界面
     *
     * @return
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String admin() {
        return "/index";

    }

    /**
     * p判断是否正确
     *
     * @param
     * @return
     */

    @RequestMapping(value = "/", method = RequestMethod.POST)
    public String login(String username, String password, HttpServletRequest request,
                        RedirectAttributes redirectAttributes) {
        Subject subject = SecurityUtils.getSubject();
        if (subject.isAuthenticated()) {
            subject.logout();

        }

        try {
            UsernamePasswordToken usernamePasswordToken =
                    new UsernamePasswordToken(username, DigestUtils.md5Hex(password));
            subject.login(usernamePasswordToken);
            //获取登陆的Ip,并保存登陆日志
            adminService.saveLog(ServletUtil.getRemoteIp(request));
            return "/home";
        } catch (LockedAccountException ex) {
            redirectAttributes.addFlashAttribute("message", new FlashMessage(FlashMessage.state_error, "账号已被禁用"));
        } catch (AuthenticationException exception) {
            redirectAttributes.addFlashAttribute("message", new FlashMessage(FlashMessage.state_error, "账号或密码错误"));
        }
        return "redirect:/";

    }

    /**
     * 添加账号
     *
     * @return
     */
    @RequestMapping(value = "/admin/add", method = RequestMethod.GET)
    public String adminAdd() {
        return "/admin/mangerAdmin";
    }

    /**
     * 验证是否账号已存在
     *
     * @param username
     * @return
     */
    @RequestMapping(value = "/admin/validate/username", method = RequestMethod.GET)
    @ResponseBody
    public String validate(String username) {
        User user = adminService.findByAdminName(username);
        if (user == null) {
            return "true";

        } else {
            return "false";
        }

    }

    /**
     * 保存账号
     *
     * @param user
     * @return
     */
    @RequestMapping(value = "/admin/new", method = RequestMethod.POST)
    @ResponseBody
    public String newAdd(User user, HttpServletRequest request) {
        user.setPassword(DigestUtils.md5Hex(user.getPassword()));
        adminService.save(user, request);
        return "success";

    }

    /**
     * 账号列表
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/admin/list", method = RequestMethod.GET)
    public String list(Model model) {
        List<User> userList = adminService.findAllUser();
        model.addAttribute("userList", userList);

        return "/admin/list";

    }

    @RequestMapping(value = "/admin/{id:\\d+}/edit", method = RequestMethod.GET)
    public String editAdmin(@PathVariable("id") Integer id, Model model) {
        User user = adminService.findById(id);
        if (user == null) {
            throw new NotFoundException();
        };
        model.addAttribute("user",user);
        return "/admin/edit";



    }

    /**
     * 修改客户
     * @param id
     * @return
     */
    @RequestMapping(value = "/admin/edit/{id:\\d+}.json",method = RequestMethod.GET)
    @ResponseBody
    public JSONResult editAdmin(@PathVariable("id")Integer id){
        User user=adminService.findById(id);
        if(user==null){
            return new JSONResult("找不到数据");
        }
            return new JSONResult(user);

    }

    /**
     * 修改客户保存客户
     * @param user
     * @param request
     * @return
     */
    @RequestMapping(value = "/admin/edit/new",method = RequestMethod.POST)
    @ResponseBody
    public JSONResult editNew(User user,HttpServletRequest request){
        User user1=adminService.findById(user.getId());
        if(user==null){
            throw new NotFoundException();
        }
        adminService.save2(user);
        return new JSONResult(user);

    }
    @RequestMapping(value = "/admin/del/{id:\\d+}",method = RequestMethod.POST)
    @ResponseBody
    public  String delAdmin(@PathVariable("id") Integer id){
        User user=adminService.findById(id);
        if(user==null){
            throw new NotFoundException();
        }
        if(!ShiroUtil.isAdmin()){
            throw new ForbiddenException();
        }
        adminService.del(user);
        return "success";

    }
    @RequestMapping(value = "/admin/diable/{id:\\d+}",method = RequestMethod.GET)
    @ResponseBody
    public String diableAdmin(@PathVariable("id") Integer id,HttpServletRequest request){
        User user=adminService.findById(id);
        if(user==null){
            throw new NotFoundException();
        }
        if(!ShiroUtil.isAdmin()){
            throw new ForbiddenException();
        }
       user.setState(false);
        adminService.save2(user);
        return "success";

    }
    @RequestMapping(value = "/admin/able/{id:\\d+}",method = RequestMethod.GET)
    @ResponseBody
    public String ableAdmin(@PathVariable("id") Integer id,HttpServletRequest request){
        User user=adminService.findById(id);
        if(user==null){
            throw new NotFoundException();
        }
        if(!ShiroUtil.isAdmin()){
            throw new ForbiddenException();
        }
       user.setState(true);
        adminService.save2(user);
        return "success";

    }


}
