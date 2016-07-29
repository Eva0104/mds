package com.mds.service;

import com.mds.dao.DeptDAO;
import com.mds.pojo.Dept;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import javax.inject.Named;
import java.util.List;

@Named
@Transactional
public class DeptService {

    @Inject
    private DeptDAO deptDAO;

    public List<Dept> findAllDept() {
        return deptDAO.findAll();
    }

    public void saveDept(Dept dept) {
        deptDAO.save(dept);
    }

    public Dept findDeptById(Integer id) {
        return deptDAO.findById(id);
    }

    public void updateDept(Dept dept) {
        deptDAO.save(dept);
    }
}
