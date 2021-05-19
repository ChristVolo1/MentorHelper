package com.invent.app.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.invent.app.model.Services;
import com.invent.app.model.Users;
import com.invent.app.repository.ServicesRepository;
import com.invent.app.repository.UserRepository;

@Service
@Transactional
public class UserServiceImpl implements UserService {
	
	
	private UserRepository userRepository;
	private ServicesRepository servicesRepository; 
	
	@Autowired
	public UserServiceImpl(UserRepository userRepository, ServicesRepository servicesRepository) {
		super();
		this.userRepository = userRepository;
		this.servicesRepository=servicesRepository;
	}

	@Override
	public Optional<Users> findById(Long id) {
		
		return userRepository.findById(id);
	}

	@Override
	public Optional<Users> findByEmail(String email) {
		// TODO Auto-generated method stub
		return userRepository.findByEmail(email);
	}

	@Override
	public Optional<Users> login(String email, String password) {
		// TODO Auto-generated method stub
		return userRepository.login(email, password);
	}

	@Override
	public List<Users> findByName(String name) {
		// TODO Auto-generated method stub
		return findByName(name);
	}

	@Override
	public void delete(Long id) {
		userRepository.deleteById(id);

	}

	@Override
	public void updateUser(Users user) {
		userRepository.findById(user.getId()).ifPresent(a->{
			a.setFname(user.getFname());
			a.setLname(user.getLname());
		});

	}

	@Override
	public void updateRole(String role, Long id) {
		userRepository.findById(id).ifPresent(a->{
			a.setRole(role);
		});

	}

	@Override
	public void resetPassword(String password, Long id) {
		userRepository.findById(id).ifPresent(a->{
			a.setPassword(password);
		});
		
	}

	@Override
	public void save(Users user) {
		userRepository.save(user);
		
	}

	@Override
	public List<Users> findAll() {
		return userRepository.findAll();
	}

	@Override
	public void addUserService(Services service) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteUserService(Services service) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateUserService(Services service) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void getAService(Long serviceId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void getUserServices(Users user) {
		// TODO Auto-generated method stub
		
	}

}
