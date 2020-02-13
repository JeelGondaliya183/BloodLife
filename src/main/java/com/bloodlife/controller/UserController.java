package com.bloodlife.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bloodlife.models.Users;
import com.bloodlife.service.UserService;
import com.fasterxml.jackson.databind.exc.InvalidFormatException;

@ControllerAdvice
@Controller
@RequestMapping("/users")
public class UserController {

	@Autowired
	UserService userService;
	
	@RequestMapping("/")
	@ResponseBody
	public Map<String,Object> getAllUsers() {
		Map<String,Object> response = new HashMap<String, Object>();
		try {
			response.put("data",userService.findAll());
			response.put("status", 200);
		}catch(Exception ex) {
			ex.printStackTrace();
			response.put("error", ex.getLocalizedMessage());
			response.put("status", 500);
		}
		return response;
	}
	
	//This method searches for users by their first name 
	@RequestMapping(value = "" , method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> getUserByFirstName(@RequestParam(name = "firstName") String firstName) {
		Map<String,Object> response = new HashMap<String, Object>();
		try {
			response.put("data",userService.findByFirstName(firstName));
			response.put("status", 200);
		}catch(Exception ex) {
			ex.printStackTrace();
			response.put("error", ex.getLocalizedMessage());
			response.put("status", 500);
		}
		
		return response;
	}
	
//	@RequestMapping(value = "/{id}" , method=RequestMethod.GET)
//	@ResponseBody
//	public Map<String,Object> getUserById(@PathVariable(name = "id") long userId) {
//		Map<String,Object> response = new HashMap<String, Object>();
//		try {
//			// service --> userId
//			//response.put("data",userService.findByFirstName(firstName));
//			response.put("status", 200);
//		}catch(Exception ex) {
//			ex.printStackTrace();
//			response.put("error", ex.getLocalizedMessage());
//			response.put("status", 500);
//		}
//		return response;
//	}
//
	//This method searches for users in the MySQL table by searching them based on ID.
	@RequestMapping(value = "/{id}" , method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> getUserById(@PathVariable(name = "id") Long id) {
		Map<String,Object> response = new HashMap<String, Object>();
		try {
			response.put("data",userService.findById(id));
			response.put("status", 200);
		}catch(Exception ex) {
			ex.printStackTrace();
			response.put("error", ex.getLocalizedMessage());
			response.put("status", 500);
		}
		return response;
	}
	
	//This method makes a post request and also makes the back-end validations on fields.
	//this method also sends back the response to the front-end with appropriate error messages if any
	@RequestMapping(value = "/updateProfilePost", method=RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateProfilePost(@RequestBody Users users) {
        Map<String,Object> response = new HashMap<>();
        try{

        	
        	if(users.getEmail().length()==0) {
        		response.put("status",400);
                response.put("Message","Email should not be empty");
        	}else if(!(isValid(users.getEmail().toString()))) {
        		 response.put("status",400);
                 response.put("Message","Email should be of format xyz@xyz.xyz");
        	}else if(nameMatcher(users.getFirstName())) {
        		response.put("status",400);
                response.put("Message","First Name should only contain letters or spaces");
        	}else if(nameMatcher(users.getLastName())) {
        		response.put("status",400);
                response.put("Message","Last Name should only contain letters or spaces");
        	}else if(users.getFirstName().length()==0) {
        		response.put("status",400);
                response.put("Message","Last Name should only contain letters or spaces");
        	}else if(users.getLastName().length()==0) {
        		response.put("status",400);
                response.put("Message","Last Name should only contain letters or spaces");
        	}else if(!(isValidAge(users.getAge()))) {
        		response.put("status",400);
        		response.put("Age",users.getAge());
                response.put("Message","Age should only contain numbers");
        	}else if(users.getAge()<=0) {
        		response.put("status",400);
                response.put("Message","Age should not be empty");
        	}
        	
        	else if(!(isValidPhone(users.getPhone_number()))) {
        		response.put("status",400);
                response.put("Message","phone number should be a 10 digit number");
        	}
        	else if(users.getAge()>=110) {
        		response.put("status",400);
                response.put("Message","Age can't be more than 110");
        	}
        	else if(users.getPhone_number()<=0) {
        		response.put("status",400);
                response.put("Message","Phone number should not be empty");
        	}else {
                userService.update(users);
        		response.put("status",200);
        		response.put("email",users.getEmail().toString());
       	
        	}
       	
        	
            return response;
        }catch(Exception ex){
            ex.printStackTrace();
            return response;
        }

    }
	
	@ExceptionHandler(InvalidFormatException.class)
    @ResponseBody public Map<String, Object> typeMismatchException(HttpServletRequest request, HttpServletResponse servletResponse, InvalidFormatException e ) {
        Map<String,Object> response = new HashMap<>();

        String myResponse = "Age and phone number can only contain numbers";
        response.put("status",400);
        response.put("Message", myResponse);
        return response;
    }
	
	//Checks if the email format is valid or not. This pattern was taken from https://www.journaldev.com/638/java-email-validation-regex
	static boolean isValid(String email) {
	      String mail = "^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";
	      return email.matches(mail);
	   }
	
	//Checks if the name format is valid or not. This pattern was taken from https://www.tutorialspoint.com/validate-the-first-name-and-last-name-with-java-regular-expressions
	static boolean nameMatcher(String name) {
		Pattern pattern = Pattern.compile(new String ("^[a-zA-Z\\s]*$"));
	    Matcher matcher = pattern.matcher(name);
	    if(matcher.matches()) {
	    	return false;
	    }else {
	    	return true;
	    }
	}
	
	//checks if the age is valid or not
	static boolean isValidAge(int age) {
	      String regex = "\\d+";
	      String s=String.valueOf(age);
	      return s.matches(regex);
	   }
	
	//checks if the phone number is valid or not.
	static boolean isValidPhone(Long phone) {
	      String regex = "\\d{10}";
	      String s=String.valueOf(phone);
	      return s.matches(regex);
	   }	


}
