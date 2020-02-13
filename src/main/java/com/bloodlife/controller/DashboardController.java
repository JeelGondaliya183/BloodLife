package com.bloodlife.controller;

import com.bloodlife.models.*;
import com.bloodlife.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

@RequestMapping("/dashboard")
@Controller
public class DashboardController {


    @Autowired
    BloodService bloodService;

    @Autowired
    ReceiverService receiverService;

    @Autowired
    DonationService donationService;

    @Autowired
    OrganizationBloodService organizationBloodService;

    @Autowired
    OrganizationService organizationService;



    @RequestMapping(value = "/getCount", method= RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getCount(HttpServletRequest req) {
        Map<String,Object> response = new HashMap<>();
        try{
            HttpSession session = req.getSession();
//           long orgJd = (Long.parseLong(req.getSession().getAttribute("organizationId").toString()))
        //   Users user = (Users)session.getAttribute("users");
//            System.out.println(orgJd);
            Organization org = organizationService.findById(77);
            List<OrganizationBlood> bloodList = new ArrayList<>();
             bloodList = organizationBloodService.findByOrganization(org);
            response.put("data",bloodList);
            response.put("status",200);
            return response;
        }catch(Exception ex){
            ex.printStackTrace();
            response.put("error",ex.getLocalizedMessage());
            return response;
        }
    }

    @RequestMapping(value = "/recentReceivers", method= RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> recentReceivers(HttpServletRequest req) {
        Map<String,Object> response = new HashMap<>();
        try{

            List<Receivers> receiversList = receiverService.findTop5ByOrderByTimestampDesc();
            response.put("data",receiversList);
            response.put("status",200);
            return response;
        }catch(Exception ex){
            ex.printStackTrace();
            response.put("error",ex.getLocalizedMessage());
            return response;
        }
    }


    @RequestMapping(value = "/recentDonations", method= RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> recentDonations(HttpServletRequest req) {
        Map<String,Object> response = new HashMap<>();
        try{

            List<Donation> donationList = donationService.findTop5ByOrderByTimestampDesc();
            response.put("data",donationList);
            response.put("status",200);
            return response;
        }catch(Exception ex){
            ex.printStackTrace();
            response.put("error",ex.getLocalizedMessage());
            return response;
        }
    }
}
