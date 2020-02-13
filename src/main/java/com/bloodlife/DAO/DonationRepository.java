package com.bloodlife.DAO;

import com.bloodlife.models.Donation;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.util.List;

@Repository
public interface DonationRepository extends CrudRepository<Donation, Long> {

    public Donation save(Donation donation);
    public List<Donation> findAll();
    public void  deleteById(long id);

    @Query(value = "select sum(d.quantity) from Donation d where d.bloodGroup = ?1  and ( d.timestamp >= ?2 and d.timestamp <= ?3)" )
    public Long getBloodCountByBloodGroup(String bloodGroup, Timestamp upto, Timestamp to);

    @Query(value = "select count(id) from Donation d where d.bloodGroup = ?1  and ( d.timestamp >= ?2 and d.timestamp <= ?3)" )
    public Long getDonationCountByMonth(String bloodGroup, Timestamp from , Timestamp to);

    public List<Donation> findTop5ByOrderByTimestampDesc();

}
