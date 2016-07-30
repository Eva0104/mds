package com.mds.controller;

import com.mds.pojo.Disease;
import com.mds.service.DiseaseService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.inject.Inject;
import java.util.List;

@Controller
@RequestMapping("/dis")
public class DiseaseController {

    @Inject
    private DiseaseService diseaseService;

    @RequestMapping(value = "/set",method = RequestMethod.GET)
    public String DiseaseList(Model model){

        List<Disease> diseaseList = diseaseService.findAllDisease();

        return "/disease/disease-list";
    }
}
