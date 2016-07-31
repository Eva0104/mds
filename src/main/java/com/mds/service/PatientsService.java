package com.mds.service;

import com.mds.dao.PatientsDAO;
import com.mds.pojo.Patients;
import com.mds.util.Page;
import com.mds.util.SearchParam;
import com.mds.util.Strings;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import javax.inject.Named;
import java.sql.Timestamp;
import java.util.List;

@Named
@Transactional
public class PatientsService {

    @Inject
    private PatientsDAO patientsDAO;
    public List<Patients> findAll() {
        return patientsDAO.findAll();
    }

    /**
     * 保存病人信息
     * @param patients
     */
    public void save(Patients patients) {
        patients.setCreatime(new Timestamp(System.currentTimeMillis()));
        patients.setPinyin(Strings.pinyin4j(patients.getName()));
        patientsDAO.save(patients);

    }



    public List<Patients> findByName(String name){
        return (List<Patients>) patientsDAO.findByName(name);
    }

    public List<Patients> findByname(String l) {
        return patientsDAO.findByname(l);
    }

    public Page<Patients> findByPageNo2(Integer pageNo, List<SearchParam> searchParams) {
        return patientsDAO.findByParams(pageNo,5,searchParams);
    }
}
