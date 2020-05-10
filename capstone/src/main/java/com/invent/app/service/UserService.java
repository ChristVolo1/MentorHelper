package com.invent.app.service;

import java.util.List;
import java.util.Optional;

import com.invent.app.model.Services;
import com.invent.app.model.Users;

public interface UserService {
	
	//abstract methods: only abstract in interfaces
	
	Optional<Users> findById(Long id);
	
	Optional <Users> findByEmail(String email);
	
	Optional <Users> login (String email, String password);
	
	List<Users> findByName(String name);
	
	List<Users> findAll();
	
	void delete(Long id);
	
	void updateUser(Users user);
	
	void updateRole(String role, Long id);
	
	void resetPassword(String password, Long id);
	
	void save(Users user);
	
	void addUserService(Services service);

	void deleteUserService(Services service);

	void updateUserService(Services service);
	
	void getAService(Long serviceId);

	void getUserServices(Users user);


}
