package com.bloodlife.controller;

import com.bloodlife.models.*;
import com.bloodlife.service.BloodService;
import com.bloodlife.service.DonationService;
import com.bloodlife.service.OrganizationBloodService;
import com.bloodlife.service.OrganizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.*;

@Controller
@RequestMapping("donor")
public class DonationController {

    private static final String ALPHA_NUMERIC_STRING = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";


    @Autowired
    DonationService donationService;

    @Autowired
    BloodService bloodService;

    @Autowired
    OrganizationBloodService organizationBloodService;

    @Autowired
    OrganizationService organizationService;

    @RequestMapping(value = "/save", method= RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> save(@RequestBody Donation donation, HttpServletRequest req) {
        Map<String,Object> response = new HashMap<>();
        try{
            Calendar cal = Calendar.getInstance();
                cal.add(Calendar.DATE, +7);
                Date expiry = cal.getTime();
            Organization or = organizationService.findById(Long.parseLong(req.getSession().getAttribute("organizationId").toString()));
           donation.setOrganization(or);
            List<OrganizationBlood> ob =  organizationBloodService.findByOrganization(or);
            StringBuilder builder = new StringBuilder();
            long count = 5;
            while (count-- != 0) {
                int character = (int) (Math.random() * ALPHA_NUMERIC_STRING.length());
                builder.append(ALPHA_NUMERIC_STRING.charAt(character));
            }
            donation.setBagId(builder.toString());
            for (OrganizationBlood orgBlood: ob) {
               if(orgBlood.getBlood().getBloodGroup().equals(donation.getBloodGroup())){
                   long bloodCount = orgBlood.getQuantity();
                   bloodCount = bloodCount + donation.getQuantity();
                   orgBlood.setQuantity(bloodCount);
                   organizationBloodService.save(orgBlood);

               }
            }
            Timestamp expiryTimestamp = new Timestamp(expiry.getTime());
                donation.setExpiryDate(expiryTimestamp);
            Donation donation1 = donationService.save(donation);
            response.put("status",200);
            response.put("data",donation1);
            return response;
        }catch(Exception ex){
            ex.printStackTrace();
            response.put("error",ex.getLocalizedMessage());
            return response;
        }
    }

    @RequestMapping(value = "/delete/{id}", method= RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> deleteDonation(@PathVariable(value = "id") long id) {
        Map<String,Object> response = new HashMap<>();
        try{

             donationService.deleteById(id);
             response.put("status",200);
            return response;
        }catch(Exception ex){
            ex.printStackTrace();
            response.put("error",ex.getLocalizedMessage());
            return response;
        }
    }

    @RequestMapping(value = "/", method= RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getAllDonation() {
        Map<String,Object> response = new HashMap<>();
        try{
            List<Donation> donation1 = donationService.findAll();
            response.put("status",200);
            response.put("data",donation1);
            return response;
        }catch(Exception ex){
            ex.printStackTrace();
            response.put("error",ex.getLocalizedMessage());
            return response;
        }
    }

}
