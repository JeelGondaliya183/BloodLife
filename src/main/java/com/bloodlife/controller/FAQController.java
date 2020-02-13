/* Assignment 4 Submission 
     by Gaganpreet Singh 
	 Banner ID: B00819217 */

package com.bloodlife.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bloodlife.DAO.FAQRepository;
import com.bloodlife.models.FAQ;
import com.bloodlife.service.FAQService;
import com.bloodlife.utility.SendMail;

@Controller
public class FAQController {

	@Autowired
	FAQRepository faqRepository;
	
	@Autowired
	SendMail sendMail;
	
	@RequestMapping(value = "/fetchFAQ" , method=RequestMethod.POST)
	@ResponseBody
	public String fetchFAQ(@RequestParam Map<String, String> data) {
 		FAQ n = new FAQ(); // Creating instance of model FAQ
 		String email=data.get("email");  // Fetching email from front end request
		n.setQuestion(data.get("question"));// Fetching question from front end request
		n.setEmail(data.get("email"));
		//generating unique token ID with date
		Random random = new Random();
		DateFormat date = new SimpleDateFormat("yyyyMMdd"); 
		String token="BF"+date.format(new Date()) + String.valueOf(random.nextInt(999999999));
		
		n.setTokenId(token);
		faqRepository.save(n);//saving record to database
		
		//email functionality
		sendMail.sendMail(email, "Bloodlife: Successfully submitted your query",
				"Your query has been successfully submitted and the token ID is "+token+".<br>Our team will get back to you shortly.<br><br>Regards,<br>Team Bloodlife");
		
		return token;

	}
	
}
