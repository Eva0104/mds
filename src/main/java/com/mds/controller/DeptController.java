package com.mds.controller;


import com.mds.pojo.Dept;
import com.mds.service.DeptService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.inject.Inject;
import java.util.List;

@Controller
@RequestMapping("/dept")
public class DeptController {

    @Inject
    private DeptService deptService;

    @RequestMapping(value = "/set",method = RequestMethod.GET)
    public String deptSet(Model model){

        List<Dept> deptList = deptService.findAllDept();
        model.addAttribute("deptList",deptList);
        return "/dept/dept-list";
    }

    @RequestMapping(value = "/new",method = RequestMethod.GET)
    public String addDept(){
        return "/dept/dept-new";
    }

    @RequestMapping(value = "/new",method = RequestMethod.POST)
    public String saveDept(Dept dept, RedirectAttributes redirectAttributes){
        deptService.saveDept(dept);
        redirectAttributes.addFlashAttribute("message","新增科室成功");
        return "redirect:/dept/set";
    }

    @RequestMapping(value = "/{id:\\d+}/edit",method = RequestMethod.GET)
    public String editDept(@PathVariable Integer id,Model model){
        Dept dept = deptService.findDeptById(id);
        model.addAttribute("dept",dept);
        return "/dept/dept-edit";
    }

    @RequestMapping(value = "/{id:\\d+}/edit",method = RequestMethod.POST)
    public String editDept(Dept dept,RedirectAttributes redirectAttributes){
        deptService.updateDept(dept);
        redirectAttributes.addFlashAttribute("message","修改科室成功");
        return "redirect:/dept/set";
    }

    @RequestMapping(value = "/{id:\\d+}/del",method = RequestMethod.GET)
    public String delDept(Dept dept,RedirectAttributes redirectAttributes){
        deptService.updateDept(dept);
        redirectAttributes.addFlashAttribute("message","删除科室成功");
        return "redirect:/dept/set";
    }



}
