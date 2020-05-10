package com.invent.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.invent.app.model.PaymentMethod;

public interface PaymentMethodRepository extends JpaRepository<PaymentMethod, Long> {

}
