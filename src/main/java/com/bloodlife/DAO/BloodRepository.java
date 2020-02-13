package com.bloodlife.DAO;

import com.bloodlife.models.Blood;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BloodRepository extends CrudRepository<Blood,Long> {

    public Blood save(Blood blood);
    public Blood findByBloodGroup(String bloodGroup);
    public List<Blood> findAll();

}
