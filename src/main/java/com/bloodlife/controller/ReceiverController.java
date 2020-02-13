package com.bloodlife.controller;


import com.bloodlife.models.Blood;
import com.bloodlife.models.Organization;
import com.bloodlife.models.OrganizationBlood;
import com.bloodlife.models.Receivers;
import com.bloodlife.service.BloodService;
import com.bloodlife.service.OrganizationBloodService;
import com.bloodlife.service.OrganizationService;
import com.bloodlife.service.ReceiverService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
@RequestMapping("/receiver")
public class ReceiverController {

    @Autowired
    ReceiverService receiverService;

    @Autowired
    OrganizationService organizationService;

    @Autowired
    BloodService bloodService;

    @Autowired
    OrganizationBloodService organizationBloodService;




    @RequestMapping(value = "/save", method= RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> save(@RequestBody Receivers receivers, HttpServletRequest req) {
        Map<String,Object> response = new HashMap<>();
        try{
            HttpSession session = req.getSession();
            System.out.println("organization id" + session.getAttribute("organizationId"));
            Organization organization = organizationService.findById(Integer.parseInt(session.getAttribute("organizationId").toString()));
            receivers.setOrganization(organization);
            Organization or = organizationService.findById(Long.parseLong(req.getSession().getAttribute("organizationId").toString()));
            List<OrganizationBlood> ob =  organizationBloodService.findByOrganization(or);

            for (OrganizationBlood orgBlood: ob) {
                if(orgBlood.getBlood().getBloodGroup().equals(receivers.getBloodGroup())){
                    long bloodCount = orgBlood.getQuantity();
                    bloodCount = bloodCount + receivers.getQuantity();
                    orgBlood.setQuantity(bloodCount);
                    organizationBloodService.save(orgBlood);

                }
            }
            Receivers receiverObj = receiverService.save(receivers);
            response.put("status",200);
            response.put("data",receiverObj);
            return response;
        }catch(Exception ex){
            ex.printStackTrace();
            response.put("error",ex.getLocalizedMessage());
            return response;
        }
    }


    @RequestMapping(value = "/{id}", method= RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> findReceiverById(@PathVariable long id) {
        Map<String,Object> response = new HashMap<>();
        try{
            Receivers receiverObj = receiverService.findById(id);

            response.put("status",200);
            response.put("data",receiverObj);
            return response;
        }catch(Exception ex){
            ex.printStackTrace();
            response.put("error",ex.getLocalizedMessage());
            return response;
        }
    }

    @RequestMapping(value = "/{id}", method= RequestMethod.DELETE)
    @ResponseBody
    public Map<String, Object> deleteById(@PathVariable long id) {
        Map<String,Object> response = new HashMap<>();
        try{

            receiverService.deleteById(id);

            response.put("status",200);
            response.put("data",true);
            return response;
        }catch(Exception ex){
            ex.printStackTrace();
            response.put("error",ex.getLocalizedMessage());
            return response;
        }
    }

    @RequestMapping(value = "", method= RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getAllReceiver(@RequestParam(value = "organizationId") long organizationId) {
        Map<String,Object> response = new HashMap<>();
        try{
            List<Receivers> receiverList = receiverService.findByOrganization(organizationService.findById(organizationId));
            response.put("status",200);
            response.put("data",receiverList);
            return response;
        }catch(Exception ex){
            ex.printStackTrace();
            response.put("error",ex.getLocalizedMessage());
            return response;
        }
    }
}
