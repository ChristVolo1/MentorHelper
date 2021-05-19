package com.invent.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.invent.app.model.PhoneBook;


public interface PhoneBookRepository extends JpaRepository<PhoneBook, Long> {

}
