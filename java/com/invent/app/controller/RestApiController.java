package com.invent.app.controller;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.Optional;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.invent.app.model.Users;
import com.invent.app.repository.UserRepository;

@RestController
@RequestMapping("/api")
public class RestApiController {
	
	private final Logger log = LoggerFactory.getLogger(RestApiController.class);
	
	 
	  @Autowired
	  UserRepository userRepository;
		 

	  @GetMapping("/users")
	  public List<Users> getAllUsers() {
		log.info("Request to get all Users: {}", userRepository.findAll());
	    return userRepository.findAll();
	  }
	  
	  @GetMapping("/user/{id}")
	    ResponseEntity<?> getUser(@PathVariable Long id) {
	        Optional<Users> user = userRepository.findById(id);
	        return user.map(response -> ResponseEntity.ok().body(response))
	                .orElse(new ResponseEntity<>(HttpStatus.NOT_FOUND));
	    }

	    @PostMapping("/user")
	    ResponseEntity<Users> createUser(@RequestBody Users user) throws URISyntaxException {
	        log.info("Request to create User: {}", user);
	        Users result = userRepository.save(user);
	        return ResponseEntity.created(new URI("/api/user/" + result.getId()))
	                .body(result);
	    }

	    @PutMapping("/user/{id}")
	    ResponseEntity<Users> updateUsers(@RequestBody Users user) {
	        log.info("Request to update user: {}", user);
	        Users result = userRepository.save(user);
	        return ResponseEntity.ok().body(result);
	    }

	    @DeleteMapping("/user/{id}")
	    public ResponseEntity<?> deleteUser(@PathVariable Long id) {
	        log.info("Request to delete user: {}", id);
	        userRepository.deleteById(id);
	        return ResponseEntity.ok().build();
	    }
}
	

