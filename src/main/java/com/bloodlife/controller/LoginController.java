package com.bloodlife.controller;

import com.bloodlife.models.Users;
import com.bloodlife.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class LoginController {

    @Autowired
    UserService userService;

    @RequestMapping(value = "/userCheck" , method= RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> userCheck(@RequestBody Users user, HttpServletRequest req, HttpServletResponse res) {
        Map<String,Object> response = new HashMap<String, Object>();
        try {
            Users userObj = userService.findByEmail(user.getEmail());
            HttpSession session = req.getSession();
            if(userObj.getPassword().equals(user.getPassword())){
                session.setAttribute("name",userObj.getFirstName());
                session.setAttribute("id", userObj.getId());
                session.setAttribute("email",userObj.getEmail());
                session.setAttribute("role", userObj.getRole());
                session.setAttribute("token", userObj.getToken());
                if(userObj.getRole().equals("organization")){
                    session.setAttribute("organizationId", userObj.getOrganization().getId());
                    session.setAttribute("threshold", userObj.getOrganization().getBloodThreshold());
                    session.setAttribute("organization", userObj.getOrganization());
                }
                System.out.println(session.getAttribute("id"));
                response.put("role", userObj.getRole());
                response.put("status", 200);
            }else{
                response.put("status", 401);
            }
        }catch(Exception ex) {
            ex.printStackTrace();
            response.put("error", ex.getLocalizedMessage());
            response.put("status", 500);
        }
        return response;
    }

    @RequestMapping(value = "/register", method=RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> userRegistration(@RequestBody Users user) {
        Map<String,Object> response = new HashMap<String, Object>();
        try {
            if(!user.getRole().equals("organization")){
                user.setRole("donor");
            }
            userService.save(user);
            response.put("status", 200);
        }catch(Exception ex) {
            ex.printStackTrace();
            response.put("error", ex.getLocalizedMessage());
            response.put("status", 500);
        }
        return response;
    }

    @RequestMapping(value = "/logout", method=RequestMethod.GET)

    public String logout( HttpServletRequest req){
        Map<String,Object> response = new HashMap<String, Object>();
        try {
            HttpSession session = req.getSession();
            session.invalidate();
           return "redirect:/";
        }catch(Exception ex) {
            ex.printStackTrace();
            response.put("error", ex.getLocalizedMessage());
            response.put("status", 500);
            return "redirect:/updateProfile";
        }

    }


}
