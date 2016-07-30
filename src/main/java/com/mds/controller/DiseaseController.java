package com.mds.controller;

import com.mds.pojo.Dept;
import com.mds.pojo.Disease;
import com.mds.service.DeptService;
import com.mds.service.DiseaseService;
import com.mds.util.Page;
import com.mds.util.SearchParam;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/dis")
public class DiseaseController {

    @Inject
    private DiseaseService diseaseService;

    @Inject
    private DeptService deptService;

    /**
     * 到病种设置页面
     * @param model
     * @return
     */
    @RequestMapping(value = "/set",method = RequestMethod.GET)
    public String DiseaseList(Model model,
                              @RequestParam(name = "p",required = false,defaultValue = "1")Integer pageNo,
                              HttpServletRequest request){
        List<SearchParam> searchParamList = SearchParam.getSearchParam(request);

        Page<Disease> page = diseaseService.findBookByParam(pageNo,searchParamList);

        List<Dept> deptList = deptService.findAllDept();

        model.addAttribute("deptList",deptList);
        model.addAttribute("page",page);

        return "/disease/disease-list";
    }

    /**
     * 新增页面
     * @return
     */
    @RequestMapping(value = "/new",method = RequestMethod.GET)
    public String newDisease(Model model){
        List<Dept> deptList = deptService.findAllDept();
        model.addAttribute("deptList",deptList);
        return "/disease/disease-new";
    }

    @RequestMapping(value = "/new",method = RequestMethod.POST)
    public String newDisease(Disease disease){
        diseaseService.saveDis(disease);
        return "redirect:/dis/set";
    }

    /**
     * 修改
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/{id:\\d+}/edit",method = RequestMethod.GET)
    public String editDisease(@PathVariable Integer id, Model model){
        Disease disease = diseaseService.findDisById(id);
        model.addAttribute("disease",disease);

        List<Dept> deptList = deptService.findAllDept();
        model.addAttribute("deptList",deptList);
        return "/disease/disease-edit";
    }

    @RequestMapping(value = "/{id:\\d+}/edit",method = RequestMethod.POST)
    public String editDisease(Disease disease){
        diseaseService.updateDis(disease);
        return "redirect:/dis/set";
    }

    /**
     * 删除
     * @param id
     * @return
     */
    @RequestMapping(value = "/{id:\\d+}/del",method = RequestMethod.GET)
    @ResponseBody
    public String delDisease(@PathVariable Integer id){
        diseaseService.deleteDisById(id);
        return "success";
    }
}
