package com.bloodlife.service.Impl;

import com.bloodlife.DAO.ReceiverRepository;
import com.bloodlife.models.Organization;
import com.bloodlife.models.Receivers;
import com.bloodlife.service.ReceiverService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Time;
import java.sql.Timestamp;
import java.util.List;

@Service
public class ReceiverServiceImpl implements ReceiverService {


    @Autowired
    ReceiverRepository receiverRepository;

    @Override
    public Receivers save(Receivers receivers) {
        return receiverRepository.save(receivers);
    }

    @Override
    public List<Receivers> findByOrganization(Organization organizationId) {
        return receiverRepository.findByOrganization(organizationId);
    }

    @Override
    public Receivers findById(long id) {
        return receiverRepository.findById(id);
    }

    @Override
    public void deleteById(long id) {
        receiverRepository.deleteById(id);
    }

    @Override
    public Long getBloodCountByBloodGroup(String bloodGroup, Timestamp from, Timestamp to) {
        if(receiverRepository.getBloodCountByBloodGroup(bloodGroup, from,to) == null){
            return 0L;
        }else{
            return receiverRepository.getBloodCountByBloodGroup(bloodGroup,from,to);
        }

    }

    @Override
    public Long getReceiverCountByMonth(String bloodGroup, Timestamp from, Timestamp to) {
        if(receiverRepository.getReceiverCountByMonth(bloodGroup, from,to) == null){
            return 0L;
        }else{
            return receiverRepository.getReceiverCountByMonth(bloodGroup,from,to);
        }
    }

    @Override
    public List<Receivers> findTop5ByOrderByTimestampDesc() {
        return receiverRepository.findTop5ByOrderByIssuedateDesc();
    }
}
