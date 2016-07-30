package com.mds.controller;

import com.mds.dto.JSONResult;
import com.mds.exception.NotFoundException;
import com.mds.pojo.Surance;
import com.mds.service.SuranceService;
import com.mds.util.Strings;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.tags.form.LabelTag;

import javax.inject.Inject;
import javax.inject.Named;
import javax.persistence.Entity;
import java.util.List;

@Controller
@RequestMapping("/surance")
public class SuranceController {
    @Inject
    private SuranceService suranceService;

    /**
     * 查看所有的医保类型
     * @param model
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Model model) {
        List<Surance> suranceList=suranceService.findAll();
        model.addAttribute("suranceList",suranceList);
        return "/surance/list";


    }

    /**
     * 添加医保类型
     * @return
     */
    @RequestMapping(value = "/newadd",method = RequestMethod.GET)
    public String suranceAdd(){
        return "/surance/new";

    }
    @RequestMapping(value = "/editadd",method = RequestMethod.GET)
    public String suranceEdit(){
        return "/surance/edit";

    }

    /**
     * 验证医保类型是否存在
     * @param hctname
     * @return
     */
    @RequestMapping(value = "/validate/hctname",method = RequestMethod.GET)
    @ResponseBody
    public String validateHctname(String hctname){

        Surance surance=suranceService.findByHctname(hctname);
        if(surance==null){
            return "true";
        }
        return "false";

    }

    /**
     * 添加医保类型
     * @param surance
     * @return
     */

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    public JSONResult addSurance(Surance surance){

        suranceService.save(surance);
        return new JSONResult(surance);

    }

    /**
     * 保存修改内容
     * @param surance
     * @return
     */
    @RequestMapping(value = "/edit/new",method = RequestMethod.POST)
    @ResponseBody
    public JSONResult editSuranceSave(Surance surance){

        suranceService.save(surance);
        return new JSONResult(surance);

    }

    /**
     * 查看是否存在
     * @param id
     * @return
     */
    @RequestMapping(value = "/edit/{id:\\d+}.json",method = RequestMethod.GET)
    @ResponseBody
    public JSONResult editSurance(@PathVariable("id") Integer id){
        Surance surance=suranceService.findById(id);
        if(surance==null){
            throw new NotFoundException();
        }
        return new JSONResult(surance);

    }

    /**
     * 删除数据
     * @param id
     * @return
     */

    @RequestMapping(value = "/del/{id:\\d+}",method = RequestMethod.GET)
    @ResponseBody
    public String del(@PathVariable("id") Integer id){
        Surance surance=suranceService.findById(id);
        if(surance==null){
            throw new NotFoundException();
        }
        suranceService.del(surance);
        return "success";


    }
}
