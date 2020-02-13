package com.bloodlife.controller;

import com.bloodlife.models.Users;
import com.bloodlife.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
//@RequestMapping("/api/users")
public class UserProfileController {

    @Autowired
    private UserService userService;

    @GetMapping(value = "/api/users/user/{id}",produces = "application/json")
    public Users getUserDetail(@PathVariable Long id){
        return userService.findById(id);
    }
}
