package com.mds.controller;

import com.mds.service.DiseaseService;
import com.mds.service.VisitService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.inject.Inject;

@Controller
@RequestMapping("/visit")
public class VisitController {

    @Inject
    private VisitService visitService;

    @Inject
    private DiseaseService diseaseService;

    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String visitList(Model model){
        return "/visit/visit-list";
    }
}
