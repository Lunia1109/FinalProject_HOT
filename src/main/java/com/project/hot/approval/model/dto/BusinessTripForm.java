package com.project.hot.approval.model.dto;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BusinessTripForm {

	private int businessTripFormNo;
	private String approvalNo;
	private Date businessTripStartDate;
	private Date businessTripEndDate;
	private String businessTripDestination;
	private String businessTripEmergency;

	private List<BusinessTripPartner> businessTripPartners;
}
