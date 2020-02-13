package com.bloodlife.service.Impl;

import com.bloodlife.DAO.OrganizationRepository;
import com.bloodlife.models.Organization;
import com.bloodlife.service.OrganizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrganizationServiceImpl implements OrganizationService {

    @Autowired
    OrganizationRepository organizationRepository;

    @Override
    public List<Organization> findAll() {
        return organizationRepository.findAll();
    }

    @Override
    public Organization save(Organization organization) {
        return organizationRepository.save(organization);
    }

    @Override
    public Organization findById(long id) {
        return organizationRepository.findById(id);
    }

    @Override
    public void deleteById(long id) {
        organizationRepository.deleteById(id);
    }
}
