package com.bloodlife.controller;

import com.bloodlife.models.Blood;
import com.bloodlife.models.Organization;
import com.bloodlife.models.OrganizationBlood;
import com.bloodlife.service.BloodService;
import com.bloodlife.service.OrganizationBloodService;
import com.bloodlife.service.OrganizationService;
import kong.unirest.HttpResponse;
import kong.unirest.JsonNode;
import kong.unirest.Unirest;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/organization")
public class OrganizationController {


    @Autowired
    OrganizationService organizationService;

    @Autowired
    OrganizationBloodService organizationBloodService;

    @Autowired
    BloodService bloodService;


    @RequestMapping("/save")
    @ResponseBody
    public Map<String,Object> saveOrganization(@RequestBody Organization organization) {
        Map<String,Object> response = new HashMap<String, Object>();
        try {
            HttpResponse<JsonNode> responseObj  = Unirest.get("https://maps.googleapis.com/maps/api/place/findplacefromtext/json")
                    .queryString("input",organization.getOrganizationName() +","+ organization.getAddress())
                    .queryString("inputtype", "textquery")
                    .queryString("fields", "formatted_address,name,geometry")
                    .queryString("key", "AIzaSyB_QXCVMoGyS0934D9Kd8qrsNpeYqzLkbI")
                    .asJson();

            JSONObject jsonObj = responseObj.getBody().getObject();


            JSONArray jsonArray = (JSONArray) jsonObj.get("candidates");
            JSONObject jsonObject = (JSONObject) jsonArray.get(0);
            organization.setAddress(jsonObject.getString("formatted_address"));
            jsonObject = (JSONObject) jsonObject.get("geometry");
            jsonObject  = (JSONObject) jsonObject.get("location");
            System.out.println();
            organization.setLatitude(jsonObject.get("lat").toString());
            organization.setLongitude(jsonObject.get("lng").toString());
            Organization org = organizationService.save(organization);
           // response.put("data",);
            List<Blood> bloodList =  bloodService.findAll();
            for (int i = 0; i < bloodList.size() ; i++) {
                Blood blood = bloodList.get(i);
                OrganizationBlood ob = new OrganizationBlood();
                ob.setBlood(blood);
                ob.setOrganization(org);
                ob.setQuantity(0);
                organizationBloodService.save(ob);
            }

            response.put("status", 200);
        }catch(Exception ex) {
            ex.printStackTrace();
            response.put("error", ex.getLocalizedMessage());
            response.put("status", 500);
        }
        return response;
    }



    @RequestMapping("/delete/{id}")
    @ResponseBody
    public Map<String,Object> deleteOrganization(@PathVariable long id) {
        Map<String,Object> response = new HashMap<String, Object>();
        try {
            organizationService.deleteById(id);
            response.put("status", 200);
        }catch(Exception ex) {
            ex.printStackTrace();
            response.put("error", ex.getLocalizedMessage());
            response.put("status", 500);
        }
        return response;
    }
}

