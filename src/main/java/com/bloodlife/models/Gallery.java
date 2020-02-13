package com.bloodlife.models;

import javax.persistence.*;

@Entity
public class Gallery {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Long id;
    private String imageUrl;
    private String title;

    @JoinColumn
    @ManyToOne
    private Organization organization;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Organization getOrganization() {
        return organization;
    }

    public void setOrganization(Organization organization) {
        this.organization = organization;
    }
}
