package com.bloodlife.DAO;


import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.bloodlife.models.Events;

@Repository
public interface EventRepository extends CrudRepository<Events, Long>{

	public List<Events> findAll();
	public  Events save(Events event);
	public void deleteById(long eventId);
	public List<Events> findByEventDateAfter(Date eventTime);
	
}
