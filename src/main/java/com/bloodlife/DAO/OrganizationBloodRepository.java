package com.bloodlife.DAO;

import com.bloodlife.models.Blood;
import com.bloodlife.models.Organization;
import com.bloodlife.models.OrganizationBlood;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrganizationBloodRepository extends CrudRepository<OrganizationBlood,Long> {

    public OrganizationBlood save(OrganizationBlood organizationBlood);
    public List<OrganizationBlood> findByOrganization(Organization organization);
    public List<OrganizationBlood> findByBlood(Blood blood);
}
