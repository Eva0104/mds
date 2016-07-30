package com.mds.pojo;

import javax.persistence.*;

@Entity
@Table(name="t_disease")
public class Disease {
<<<<<<< HEAD
=======

>>>>>>> e82fecafa9397a2f10b4e6ee4b8b5772ef5d552c
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String diseasename;
    private String deptname;

    @ManyToOne
    @JoinColumn(name="deptid")
    private Dept dept;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDiseasename() {
        return diseasename;
    }

    public void setDiseasename(String diseasename) {
        this.diseasename = diseasename;
    }

    public String getDeptname() {
        return deptname;
    }

    public void setDeptname(String deptname) {
        this.deptname = deptname;
    }

    public Dept getDept() {
        return dept;
    }

    public void setDept(Dept dept) {
        this.dept = dept;
    }
}
