package com.bloodlife.service;

import com.bloodlife.models.Organization;
import com.bloodlife.models.Receivers;

import java.sql.Timestamp;
import java.util.List;

public interface ReceiverService {

    public Receivers save(Receivers receivers);
    public List<Receivers> findByOrganization(Organization organizationId);
    public Receivers findById(long id);
    public void deleteById(long id);
    public Long getBloodCountByBloodGroup(String bloodGroup , Timestamp from, Timestamp to);
    public Long getReceiverCountByMonth(String bloodGroup, Timestamp from , Timestamp to);
    public List<Receivers> findTop5ByOrderByTimestampDesc();

}
