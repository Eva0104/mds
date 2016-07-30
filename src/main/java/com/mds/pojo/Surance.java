package com.mds.pojo;

import javax.persistence.*;

@Entity
@Table(name = "t_healthct")
public class Surance {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String hctname;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getHctname() {
        return hctname;
    }

    public void setHctname(String hctname) {
        this.hctname = hctname;
    }
}
