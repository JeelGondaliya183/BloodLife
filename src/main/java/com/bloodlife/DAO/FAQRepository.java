/* Assignment 4 Submission 
     by Gaganpreet Singh 
	 Banner ID: B00819217 */

package com.bloodlife.DAO;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.bloodlife.models.FAQ;

@Repository
public interface FAQRepository extends CrudRepository<FAQ, Long>{
	

	 //List<FAQ> findByTokenId(String email, String question);

}
