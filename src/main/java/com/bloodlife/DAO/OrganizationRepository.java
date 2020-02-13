package com.bloodlife.DAO;

import com.bloodlife.models.Organization;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrganizationRepository extends CrudRepository<Organization, Long> {

    public List<Organization> findAll();
    public  Organization save(Organization organization);
    public void  deleteById(long id);
    public  Organization findById(long id);

}
