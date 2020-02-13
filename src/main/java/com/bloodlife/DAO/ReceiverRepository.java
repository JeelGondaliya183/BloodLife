package com.bloodlife.DAO;

import com.bloodlife.models.Organization;
import com.bloodlife.models.Receivers;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.util.List;

@Repository
public interface ReceiverRepository extends CrudRepository<Receivers, Long> {

    public Receivers save(Receivers receivers);
    public List<Receivers> findByOrganization(Organization organizationId);
    public Receivers findById(long id);
    public void deleteById(long id);

    @Query(value = "select sum(r.quantity) from Receivers r where r.bloodGroup = ?1 and (r.issuedate >= ?2 and  r.issuedate < ?3) " )
    public Long getBloodCountByBloodGroup(String bloodGroup, Timestamp from, Timestamp to);

    @Query(value = "select count(id) from Receivers r where r.bloodGroup = ?1  and ( r.issuedate >= ?2 and r.issuedate <= ?3)" )
    public Long getReceiverCountByMonth(String bloodGroup, Timestamp from , Timestamp to);

    public List<Receivers> findTop5ByOrderByIssuedateDesc();

}
