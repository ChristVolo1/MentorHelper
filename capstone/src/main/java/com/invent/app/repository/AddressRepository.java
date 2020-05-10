package com.invent.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.invent.app.model.Addresses;

public interface AddressRepository extends JpaRepository<Addresses, Long> {
	Addresses findByEmail(String email);
}
