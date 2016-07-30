package com.mds.pojo;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "t_healthct")
public class Surance {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String hctname;
    @OneToMany(mappedBy = "surance")
    private Set<Patients> patientsSet;

    public Set<Patients> getPatientsSet() {
        return patientsSet;
    }

    public void setPatientsSet(Set<Patients> patientsSet) {
        this.patientsSet = patientsSet;
    }

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
