package com.bloodlife.controller;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bloodlife.models.Organization;
import com.bloodlife.service.OrganizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


import com.bloodlife.models.Events;
import com.bloodlife.service.EventService;

import javax.servlet.http.HttpServletRequest;

@Controller

public class EventController {

	@Autowired
	EventService eventService;

	@Autowired
    OrganizationService organizationService;
	
	
	@RequestMapping(value = "/getAllEvents", method= RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getAllEvents() {
        Map<String,Object> response = new HashMap<>();
        try{
        	List<Events> events = eventService.findAll();
            response.put("status",200);
            response.put("data",events);
            return response;
        }catch(Exception ex){
            ex.printStackTrace();
            response.put("error",ex.getLocalizedMessage());
            return response;
        }
    }
	

    @RequestMapping(value = "/deleteEvent/{eventId}", method= RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> deleteEvent(@PathVariable(value = "eventId") long eventId) {
        Map<String,Object> response = new HashMap<>();
        try{

        	eventService.deleteByEventId(eventId);
             response.put("status",200);
            return response;
        }catch(Exception ex){
            ex.printStackTrace();
            response.put("error",ex.getLocalizedMessage());
            return response;
        }
    }

	
	
	@PostMapping("/saveEvent")
	@ResponseBody
	public Map<String,Object> saveEvent(@RequestBody Events event, HttpServletRequest req) {
		Map<String,Object> response = new HashMap<String, Object>();
		try {

            Organization org = organizationService.findById(Long.parseLong(req.getSession().getAttribute("organizationId").toString()));
		    event.setOrgName(org.getOrganizationName());
		    event.setOrgId(Integer.parseInt(org.getId().toString()));
			response.put("data",eventService.Save(event));
			response.put("status", 200);
		}catch(Exception ex) {
			ex.printStackTrace();
			response.put("error", ex.getLocalizedMessage());
			response.put("status", 500);
		}
		return response;
	}


    @RequestMapping(value = "/getAllUpComingEvents", method= RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getAllUpComingEvents() {
        Map<String,Object> response = new HashMap<>();
        try{
            List<Events> events = eventService.findByEventDateAfter(new Date());
            response.put("status",200);
            response.put("data",events);
            return response;
        }catch(Exception ex){
            ex.printStackTrace();
            response.put("error",ex.getLocalizedMessage());
            return response;
        }
    }




}
