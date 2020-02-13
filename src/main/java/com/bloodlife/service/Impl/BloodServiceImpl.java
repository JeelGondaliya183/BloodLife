package com.bloodlife.service.Impl;

import com.bloodlife.DAO.BloodRepository;
import com.bloodlife.models.Blood;
import com.bloodlife.service.BloodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BloodServiceImpl implements BloodService {

    @Autowired
    BloodRepository bloodRepository;

    @Override
    public Blood save(Blood blood) {
        return bloodRepository.save(blood);
    }

    @Override
    public Blood findByBloodGroup(String bloodGroup) {
        return bloodRepository.findByBloodGroup(bloodGroup);
    }

    @Override
    public List<Blood> findAll() {
        return bloodRepository.findAll();
    }
}
