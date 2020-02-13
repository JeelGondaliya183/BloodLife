package com.bloodlife.controller;

import com.bloodlife.service.DonationService;
import com.bloodlife.service.OrganizationService;
import com.bloodlife.service.ReceiverService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@RequestMapping("/reporting")
@Controller
public class ReportingController {

    @Autowired
    ReceiverService receiverService;

    @Autowired
    DonationService donationService;

    @Autowired
    OrganizationService organizationService;

    @RequestMapping(value = "/getCount", method= RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getCount(HttpServletRequest req, @RequestParam(value = "from") String from , @RequestParam(value = "to") String to) {
        Map<String,Object> response = new HashMap<>();
        try{
            Map<String, Long> bloodCountMap = new HashMap<>();
            String[] bloodGroup  ={"O+","O-","A+","A-","B-","B+","AB-","AB+"};

            Date date1=new SimpleDateFormat("yyyy-MM-dd").parse(from);
            Date date2 = new SimpleDateFormat("yyyy-MM-dd").parse(to);
            date2.getMonth();
            date2.setMonth (date2.getMonth()+1);
            Timestamp fromTimeStamp = new Timestamp(date1.getTime());
            Timestamp toTimeStamp = new Timestamp(date2.getTime());
            for (int i = 0; i < bloodGroup.length; i++) {
                long donationCount = donationService.getBloodCountByBloodGroup(bloodGroup[i],fromTimeStamp, toTimeStamp);
                long receiverCount = receiverService.getBloodCountByBloodGroup(bloodGroup[i],fromTimeStamp,toTimeStamp);
                System.out.println( bloodGroup[i] + "  :  " + donationCount + " : " +  receiverCount);
                long count = donationCount - receiverCount;
                bloodCountMap.put(bloodGroup[i], count);
            }
            response.put("data",bloodCountMap);
            response.put("status",200);
            return response;
        }catch(Exception ex){
            ex.printStackTrace();
            response.put("error",ex.getLocalizedMessage());
            return response;
        }
    }

    @RequestMapping(value = "/getDonationCount", method= RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getDonationCount(HttpServletRequest req, @RequestParam(value = "from") String from , @RequestParam(value = "to") String to) {
        Map<String,Object> response = new HashMap<>();
        try{
            Map<String, Long> donationCount = new HashMap<>();
            String[] bloodGroup  ={"O+","O-","A+","A-","B-","B+","AB-","AB+"};
            Date date1=new SimpleDateFormat("yyyy-MM-dd").parse(from);
            Date date2 = new SimpleDateFormat("yyyy-MM-dd").parse(to);
            date2.getMonth();
            date2.setMonth (date2.getMonth()+1);
            Timestamp fromTimeStamp = new Timestamp(date1.getTime());
            Timestamp toTimeStamp = new Timestamp(date2.getTime());
            for (int i = 0; i < bloodGroup.length; i++) {
                long count = donationService.getDonationCountByMonth(bloodGroup[i],fromTimeStamp,toTimeStamp);
                donationCount.put(bloodGroup[i], count);
            }
            response.put("data",donationCount);
            response.put("status",200);
            return response;
        }catch(Exception ex){
            ex.printStackTrace();
            response.put("error",ex.getLocalizedMessage());
            return response;
        }
    }


    @RequestMapping(value = "/getReceiverCount", method= RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getReceiverCount(HttpServletRequest req, @RequestParam(value = "from") String from , @RequestParam(value = "to") String to) {
        Map<String,Object> response = new HashMap<>();
        try{
            Map<String, Long> receiverCount = new HashMap<>();
            String[] bloodGroup  ={"O+","O-","A+","A-","B-","B+","AB-","AB+"};
            Date date1=new SimpleDateFormat("yyyy-MM-dd").parse(from);
            Date date2 = new SimpleDateFormat("yyyy-MM-dd").parse(to);
            date2.getMonth();
            date2.setMonth (date2.getMonth()+1);
            Timestamp fromTimeStamp = new Timestamp(date1.getTime());
            Timestamp toTimeStamp = new Timestamp(date2.getTime());
            for (int i = 0; i < bloodGroup.length; i++) {
                long count = receiverService.getReceiverCountByMonth(bloodGroup[i],fromTimeStamp,toTimeStamp);
                receiverCount.put(bloodGroup[i], count);
            }
            response.put("data",receiverCount);
            response.put("status",200);
            return response;
        }catch(Exception ex){
            ex.printStackTrace();
            response.put("error",ex.getLocalizedMessage());
            return response;
        }
    }


}
