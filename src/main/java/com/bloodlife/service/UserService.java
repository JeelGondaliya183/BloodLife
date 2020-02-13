package com.bloodlife.service;

import java.util.List;
import java.util.Optional;

import com.bloodlife.models.Users;
import org.springframework.security.core.userdetails.User;


public interface UserService {
	public List<Users> findAll();
	public List<Users> findByFirstName(String firstName);
	public Users findById(long id);
	public void update(Users users);
	public  Users findByEmail(String email);
	public Users save(Users user);
	public String login(String username,String password);
	public Optional<User> findByToken(String token);
}

