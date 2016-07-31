package com.mds.controller;

import com.mds.pojo.Patients;
import com.mds.pojo.Surance;
import com.mds.service.PatientsService;

import com.mds.service.SuranceService;
import com.mds.util.Page;
import com.mds.util.SearchParam;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

    @RequestMapping(value = "/new", method = RequestMethod.POST)
    @ResponseBody
    public String newPatient(Patients patients) {


        patientsService.save(patients);
        return "success";

    }
}
