package com.mds.pojo;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;

@Entity
@Table
public class Disease {

    private Integer id;
    private String diseasename;
    private String deptname;

    @ManyToOne

    private Dept dept;

}
