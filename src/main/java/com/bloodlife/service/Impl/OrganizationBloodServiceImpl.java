package com.bloodlife.service.Impl;

import com.bloodlife.DAO.OrganizationBloodRepository;
import com.bloodlife.models.Blood;
import com.bloodlife.models.Organization;
import com.bloodlife.models.OrganizationBlood;
import com.bloodlife.service.OrganizationBloodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrganizationBloodServiceImpl implements OrganizationBloodService {

    @Autowired
    OrganizationBloodRepository organizationBloodRepository;

    @Override
    public OrganizationBlood save(OrganizationBlood organizationBlood) {
        return organizationBloodRepository.save(organizationBlood);
    }

    @Override
    public List<OrganizationBlood> findByOrganization(Organization organization) {
        return organizationBloodRepository.findByOrganization(organization);
    }

    @Override
    public List<OrganizationBlood> findByBlood(Blood blood) {
        return organizationBloodRepository.findByBlood(blood);
    }
}
