package com.mds.pojo;

import javax.persistence.*;
<<<<<<< HEAD

@Entity
@Table(name="t_dept")
public class Dept {
=======

@Entity
@Table(name="t_dept")
public class Dept {

>>>>>>> a2b868e8a0e98a436a173b1971bcb1a95ba6db1c
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String deptname;
    private String deptperson;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDeptname() {
        return deptname;
    }

    public void setDeptname(String deptname) {
        this.deptname = deptname;
    }

    public String getDeptperson() {
        return deptperson;
    }

    public void setDeptperson(String deptperson) {
        this.deptperson = deptperson;
    }
}
