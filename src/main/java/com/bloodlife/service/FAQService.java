/* Assignment 4 Submission 
     by Gaganpreet Singh 
	 Banner ID: B00819217 */

package com.bloodlife.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bloodlife.models.FAQ;

@Service


//interface for FAQ service
public interface FAQService {
	public List<FAQ> findByTokenId(String email, String question);
}
