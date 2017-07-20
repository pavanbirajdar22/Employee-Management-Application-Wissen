package com.wissen.eima.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.wissen.eima.model.client.Client;

public interface ClientRepository extends JpaRepository<Client, Integer> {
	Client findByCid(final int cid);

	Client findByName(final String name);

	List<Client> findByLocation(final String location);
}
