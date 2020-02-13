package com.bloodlife.models;

import javax.persistence.*;

@Entity
public class OrganizationBlood {


    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Long id;


    @JoinColumn
    @ManyToOne
    private Organization organization;

    @JoinColumn
    @ManyToOne
    private Blood blood;

    private long quantity;

    public Organization getOrganization() {
        return organization;
    }

    public void setOrganization(Organization organization) {
        this.organization = organization;
    }

    public Blood getBlood() {
        return blood;
    }

    public void setBlood(Blood blood) {
        this.blood = blood;
    }

    public long getQuantity() {
        return quantity;
    }

    public void setQuantity(long quantity) {
        this.quantity = quantity;
    }
}
