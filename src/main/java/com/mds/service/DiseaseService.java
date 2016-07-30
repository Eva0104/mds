package com.mds.service;

import com.mds.dao.DiseaseDAO;
import com.mds.pojo.Disease;
import com.mds.util.Page;
import com.mds.util.SearchParam;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import javax.inject.Named;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Named
@Transactional
public class DiseaseService {

    @Inject
    private DiseaseDAO diseaseDAO;

    public List<Disease> findAllDisease() {
        return diseaseDAO.findAll();
    }

    public void saveDis(Disease disease) {
        diseaseDAO.save(disease);
    }

    public Disease findDisById(Integer id) {
        return diseaseDAO.findById(id);
    }

    public void updateDis(Disease disease) {
        diseaseDAO.save(disease);
    }

    public void deleteDisById(Integer id) {
        diseaseDAO.delete(id);
    }

    public Page<Disease> findBookByParam(Integer pageNo, List<SearchParam> searchParamList) {

        return diseaseDAO.findByParams(pageNo,10,searchParamList);
    }
}
