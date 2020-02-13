package com.bloodlife.service;

import com.bloodlife.models.Blood;

import java.util.List;

public interface BloodService {

    public Blood save(Blood blood);

    public Blood findByBloodGroup(String bloodGroup);

    public List<Blood> findAll();
}
