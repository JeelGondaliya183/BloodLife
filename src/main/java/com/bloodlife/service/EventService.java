package com.bloodlife.service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import com.bloodlife.models.Events;

public interface EventService {
	public List<Events> findAll();
	public Events Save(Events event);
	public void deleteByEventId(long id);
	public List<Events> findByEventDateAfter(Date eventTime);

}
