package com.onlinefoodorder.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.onlinefoodorder.model.DeliveryPerson;

@Repository
public interface DeliveryPersonDao extends JpaRepository<DeliveryPerson, Integer> {
	
	DeliveryPerson findByEmailidAndPassword(String emailId, String password);

}
