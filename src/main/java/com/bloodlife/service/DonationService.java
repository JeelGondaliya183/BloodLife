package com.bloodlife.service;

import com.bloodlife.models.Donation;

import java.sql.Timestamp;
import java.util.List;

public interface DonationService {

    public Donation save(Donation donation);
    public List<Donation> findAll();
    public void deleteById(long id);
    public Long getBloodCountByBloodGroup(String bloodGroup, Timestamp upto, Timestamp to);
    public Long getDonationCountByMonth(String bloodGroup, Timestamp from , Timestamp to);
    public List<Donation> findTop5ByOrderByTimestampDesc();
}
