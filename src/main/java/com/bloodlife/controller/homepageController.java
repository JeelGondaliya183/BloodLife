package com.bloodlife.controller;

import com.bloodlife.models.Blood;
import com.bloodlife.models.Organization;
import com.bloodlife.models.OrganizationBlood;
import com.bloodlife.service.BloodService;
import com.bloodlife.service.OrganizationBloodService;
import com.bloodlife.service.OrganizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class homepageController {

    @Autowired
    OrganizationService organizationService;

    @Autowired
    BloodService bloodService;

    @Autowired
    OrganizationBloodService organizationBloodService;


    @RequestMapping("/getAllOrganization")
    @ResponseBody
    public Map<String,Object> getAllOrganization() {
        Map<String,Object> response = new HashMap<String, Object>();
        try {
            response.put("data",organizationService.findAll());
            response.put("status", 200);
        }catch(Exception ex) {
            ex.printStackTrace();
            response.put("error", ex.getLocalizedMessage());
            response.put("status", 500);
        }
        return response;
    }


    @RequestMapping("/getOrganizationByBloodQuatity")
    @ResponseBody
    public Map<String,Object> getAllOrganization(@RequestParam(value = "bloodGroup") String blood, @RequestParam(value = "quantity") long quantity) {
        Map<String,Object> response = new HashMap<String, Object>();
        try {
            boolean checkBloodGroup = blood.contains("-");
            if(!checkBloodGroup){
                blood = blood.substring(0,blood.length()-1);
                blood = blood+"+";
            }
            Blood bloodObj = bloodService.findByBloodGroup(blood);
            List<OrganizationBlood> organizationBloodList = organizationBloodService.findByBlood(bloodObj);
            List<Organization> responseOrg = new ArrayList<>();
            for (OrganizationBlood ob: organizationBloodList) {
                if(ob.getQuantity() > quantity){
                    responseOrg.add(ob.getOrganization());
                }
            }
            response.put("data",responseOrg);
            response.put("status", 200);
        }catch(Exception ex) {
            ex.printStackTrace();
            response.put("error", ex.getLocalizedMessage());
            response.put("status", 500);
        }
        return response;
    }

}
