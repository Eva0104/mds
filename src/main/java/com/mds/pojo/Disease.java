package com.mds.pojo;

import javax.persistence.*;

@Entity
@Table(name="t_disease")
public class Disease {
<<<<<<< HEAD
=======

>>>>>>> a2b868e8a0e98a436a173b1971bcb1a95ba6db1c
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
