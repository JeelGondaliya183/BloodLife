package com.bloodlife.service.Impl;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;

import com.bloodlife.DAO.UserRepository;
import com.bloodlife.models.Users;
import com.bloodlife.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserRepository userRepository;

	@Override
	public List<Users> findAll() {
		return userRepository.findAll();
	}

	@Override
	public List<Users> findByFirstName(String firstName) {
		return userRepository.findByFirstName(firstName);
	}

	@Override
	public Users findById(long id) {
		// TODO Auto-generated method stub
		return userRepository.findById(id);
	}

	@Override
	public void update(Users users) {
		// TODO Auto-generated method stub
		try{
            userRepository.save(users);
        }catch(Exception ex){
            ex.printStackTrace();

        }

	}

	@Override
	public Users findByEmail(String email) {
		try{
			return userRepository.findByEmail(email);
		}catch(Exception ex){
			ex.printStackTrace();
			return null;
		}
	}

	@Override
	public Users save(Users user) {
		try{
			return userRepository.save(user);
		}catch(Exception ex){
			ex.printStackTrace();
			return null;
		}	
	}


	@Override
	public String login(String username, String password) {
		Optional<Users> users = userRepository.login(username,password);
		if(users.isPresent()){
			String token = UUID.randomUUID().toString();
			Users user= users.get();
			user.setToken(token);
			userRepository.save(user);
			return token;
		}

		return StringUtils.EMPTY;
	}

	@Override
	public Optional<User> findByToken(String token) {
		Optional<Users> userObj= userRepository.findByToken(token);
		if(userObj.isPresent()){
			Users users1 = userObj.get();
			if(users1.getRole().equals("donor")){
				User user= new User(users1.getEmail(), users1.getPassword(), true, true, true, true,
						AuthorityUtils.createAuthorityList("USER"));
				return Optional.of(user);
			}else{
				User user= new User(users1.getEmail(), users1.getPassword(), true, true, true, true,
						AuthorityUtils.createAuthorityList("ADMIN"));
				return Optional.of(user);
			}
		}
		return  Optional.empty();	}

}
