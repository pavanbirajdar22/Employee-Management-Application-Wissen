package com.wissen.eima.service;

import java.util.Date;
import java.util.List;

import com.wissen.eima.model.client.Client;

public interface ClientService {

	List<Client> getClientsAdded(final Date fromDate, final Date toDate);

}
