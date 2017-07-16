package com.wissen.eima.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.wissen.eima.model.client.Client;

public interface ClientRepository extends JpaRepository<Client, Integer> {

}
