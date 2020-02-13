package com.bloodlife.service;

import com.bloodlife.models.Organization;

import java.util.List;

public interface OrganizationService {

    public List<Organization> findAll();
    public  Organization save(Organization organization);
    public  Organization findById(long id);
    public void deleteById(long id);
}
