package com.bloodlife.models;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;

@Entity
public class Donation {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Long id;

    private String bloodGroup;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn
    private Users user;

    private long quantity;
//    Calendar cal = Calendar.getInstance();
//cal.add(Calendar.DATE, -7);
    private Timestamp timestamp = new Timestamp(new Date().getTime());

    private Timestamp expiryDate;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn
    private Organization organization;

    private String bagId;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getBloodGroup() {
        return bloodGroup;
    }

    public void setBloodGroup(String bloodGroup) {
        this.bloodGroup = bloodGroup;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    public long getQuantity() {
        return quantity;
    }

    public void setQuantity(long quantity) {
        this.quantity = quantity;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }

    public Timestamp getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(Timestamp expiryDate) {
        this.expiryDate = expiryDate;
    }



    public Organization getOrganization() {
        return organization;
    }

    public void setOrganization(Organization organization) {
        this.organization = organization;
    }

    public String getBagId() {
        return bagId;
    }

    public void setBagId(String bagId) {
        this.bagId = bagId;
    }
}
