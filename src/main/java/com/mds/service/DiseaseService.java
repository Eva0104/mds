package com.mds.service;

import com.mds.dao.DiseaseDAO;
import com.mds.pojo.Disease;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import javax.inject.Named;
import java.util.List;

@Named
@Transactional
public class DiseaseService {

    @Inject
    private DiseaseDAO diseaseDAO;

    public List<Disease> findAllDisease() {
        return diseaseDAO.findAll();
    }
}
