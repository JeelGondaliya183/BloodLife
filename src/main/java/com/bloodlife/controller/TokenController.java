package com.bloodlife.controller;

import com.bloodlife.models.Users;
import com.bloodlife.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@RestController
public class TokenController {

    @Autowired
    private UserService userService;

    @PostMapping("/token")
    public Map<String,Object> getToken(@RequestParam("username") final String username, @RequestParam("password") final String password){
      Map<String,Object> responseMap = new HashMap<>();
       String token= userService.login(username,password);


       if(StringUtils.isEmpty(token)){
           responseMap.put("message","no token found");
           return responseMap;
       }else{
           responseMap.put("token",token);
           responseMap.put("status",200);
       }
       return responseMap;
    }
}
