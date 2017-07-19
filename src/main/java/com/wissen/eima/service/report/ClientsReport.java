package com.wissen.eima.service.report;

import java.util.Date;
import java.util.List;

import com.wissen.eima.model.client.Client;

public interface ClientsReport {
	List<Client> getReportForClientsAdded(Date startDate,Date endDate);
}
