package com.bloodlife.DAO;


import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Repository;

import com.bloodlife.models.Users;

@Repository
public interface UserRepository extends CrudRepository<Users, Long>{

	public List<Users> findAll();
	public List<Users> findByFirstName(String firstName);
	public Users findById(long id);
	public Users save(Users user);
	public Users findByEmail(String email);

	@Query(value = "SELECT u FROM Users u where u.email = ?1 and u.password = ?2 ")
	public Optional<Users> login(String username,String password);

	public Optional<Users> findByToken(String token);

}
