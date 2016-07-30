package com.mds.service;

import com.mds.dao.SuranceDAO;
import com.mds.pojo.Surance;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import javax.inject.Named;
import java.util.List;

@Named
@Transactional
public class SuranceService {
    @Inject
    private SuranceDAO suranceDAO;

    public List<Surance> findAll() {
        return suranceDAO.findAll();
    }

    public Surance findByHctname(String hctname) {
        return suranceDAO.findByName(hctname);
    }

    public void save(Surance surance) {
        suranceDAO.save(surance);
    }

    public Surance findById(Integer id) {
        return suranceDAO.findById(id);
    }

    public void del(Surance surance) {
        suranceDAO.delBook(surance);
    }
}
