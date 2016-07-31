package com.mds.controller;

import com.mds.pojo.Patients;
import com.mds.pojo.Surance;
import com.mds.service.PatientsService;

import com.mds.service.SuranceService;
import com.mds.util.Page;
import com.mds.util.SearchParam;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import javax.inject.Named;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Named
@RequestMapping("/patient")
public class PatientsController {
    @Inject
    private SuranceService suranceService;
    @Inject
    private PatientsService patientsService;

    /**
     * 病人列表
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(@RequestParam(name="p",required=false,defaultValue = "1") Integer pageNo , Model model,
                       HttpServletRequest request) {
        List<SearchParam> searchParams= SearchParam.builderSerchParam(request);
        Page<Patients> page=patientsService.findByPageNo2(pageNo,searchParams);
        List<Surance> suranceList = suranceService.findAll();

        List<Patients> patientsList = patientsService.findAll();
        model.addAttribute("patientsList", patientsList);
        model.addAttribute("suranceList", suranceList);
        model.addAttribute("page", page);

        return "/patients/list";

    }

    /**
     * 新建列表
     * @param patients
     * @return
     */
    @RequestMapping(value = "/new", method = RequestMethod.POST)
    @ResponseBody
    public String newPatient(Patients patients) {


        patientsService.save(patients);
        return "success";

    }

    /**
     * 查询病人具体信息
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/{id:\\d+}/view", method = RequestMethod.GET)
    public String viewPatient(@PathVariable("id") Integer id,Model model){

        Patients patients=patientsService.findById(id);
        model.addAttribute("patients",patients);
        return "/patients/view";

    }

    /**
     * 修改病人资料
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/edit/{id:\\d+}",method = RequestMethod.GET)
    public String editPatient(@PathVariable("id") Integer id,Model model){

        Patients patients=patientsService.findById(id);
        model.addAttribute("patients",patients);
        return "/patients/edit";

    }

    /**
     * 删除信息
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/del/{id:\\d+}",method = RequestMethod.GET)
    public String delPatient(@PathVariable("id") Integer id,Model model){

        patientsService.del(id);

        return "redirect:/patient/list";

    }
}
