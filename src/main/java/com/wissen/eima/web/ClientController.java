package com.wissen.eima.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.wissen.eima.model.client.Client;
import com.wissen.eima.service.impl.ClientServiceImpl;

@RestController
@RequestMapping("/client")
public class ClientController {

	@Autowired
	ClientServiceImpl clientServiceImpl;

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	@RequestMapping("/addedClients")
	public List<Client> getClientsAdded(@RequestParam String fromDate, @RequestParam String toDate)
			throws ParseException {
		return clientServiceImpl.getClientsAdded(sdf.parse(fromDate), sdf.parse(toDate));
	}
}
