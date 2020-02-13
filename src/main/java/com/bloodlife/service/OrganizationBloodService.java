package com.bloodlife.service;

import com.bloodlife.models.Blood;
import com.bloodlife.models.Organization;
import com.bloodlife.models.OrganizationBlood;

import java.util.List;

public interface OrganizationBloodService {


    public OrganizationBlood save(OrganizationBlood organizationBlood);
    public List<OrganizationBlood> findByOrganization(Organization organization);
    public List<OrganizationBlood> findByBlood(Blood blood );


}
