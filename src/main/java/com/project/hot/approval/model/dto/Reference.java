package com.project.hot.approval.model.dto;

import com.project.hot.employee.model.dto.Employee;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Reference {

	private int referenceNo;
	private String approvalNo;
	private Employee employeeNo;
	private String referenceType;
	private String referenceStatus;
}
