package com.bloodlife.service.Impl;


import com.bloodlife.DAO.DonationRepository;
import com.bloodlife.models.Donation;
import com.bloodlife.service.DonationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;

@Service
public class DonationServiceImpl implements DonationService {

    @Autowired
    DonationRepository donationRepository;

    @Override
    public Donation save(Donation donation) {
        return donationRepository.save(donation);
    }

    @Override
    public List<Donation> findAll() {
        return donationRepository.findAll();
    }

    @Override
    public void deleteById(long id) {
         donationRepository.deleteById(id);
    }

    @Override
    public Long getBloodCountByBloodGroup(String bloodGroup, Timestamp upto, Timestamp to) {
        if(  donationRepository.getBloodCountByBloodGroup(bloodGroup,upto,to) == null){
            return 0L;
        }else{
            return donationRepository.getBloodCountByBloodGroup(bloodGroup,upto,to);
        }
    }

    @Override
    public Long getDonationCountByMonth(String bloodGroup, Timestamp from, Timestamp to) {
        if(  donationRepository.getDonationCountByMonth(bloodGroup,from,to) == null){
            return 0L;
        }else{
            return donationRepository.getDonationCountByMonth(bloodGroup,from,to);
        }
    }

    @Override
    public List<Donation> findTop5ByOrderByTimestampDesc() {
        return donationRepository.findTop5ByOrderByTimestampDesc();
    }
}
