package com.project.app.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.project.app.repositories.UserRepository;
import com.project.app.models.User;

@Service
public class UserService {
	private UserRepository userRepository;

	public UserService(UserRepository userRepository){
		this.userRepository=userRepository;
	}
		
	public void create(User user){
		userRepository.save(user);
	}

	public User findById(long id){
		return (User)userRepository.findOne(id);
	}

	public ArrayList<User> all(){
		return (ArrayList<User>)userRepository.findAll();
	}

	public void update(User user){
		userRepository.save(user);
	}

	public void destroy(long id){
		userRepository.delete(id);
	}
}
