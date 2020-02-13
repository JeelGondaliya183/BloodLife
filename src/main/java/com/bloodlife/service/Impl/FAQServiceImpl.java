/* Assignment 4 Submission 
     by Gaganpreet Singh 
	 Banner ID: B00819217 */

package com.bloodlife.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bloodlife.DAO.FAQRepository;
import com.bloodlife.models.FAQ;
import com.bloodlife.service.FAQService;


@Service
public class FAQServiceImpl implements FAQService {

	
	@Autowired
	FAQRepository FAQRepository;
	//implementing method of interface FAQService 
	@Override
	public List<FAQ> findByTokenId(String email, String question) {
		return null;
	}

}
