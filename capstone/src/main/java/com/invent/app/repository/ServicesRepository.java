package com.invent.app.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.invent.app.model.Services;
import com.invent.app.model.Users;

@Repository
public interface ServicesRepository  extends JpaRepository<Services, Long>{

	List<Services> findByPostedBy(Users user);
	
}
