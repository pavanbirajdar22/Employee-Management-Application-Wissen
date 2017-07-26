package com.wissen.eima.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.CrossOrigin;

import com.wissen.eima.model.client.Client;

@CrossOrigin(origins = "*")
public interface ClientRepository extends JpaRepository<Client, Integer> {
	Client findByCid(final int cid);

	Client findByNameContains(@Param(value = "name") final String name);

	List<Client> findByLocation(final String location);
}
