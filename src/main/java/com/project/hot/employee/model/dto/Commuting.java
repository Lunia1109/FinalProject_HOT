package com.project.hot.employee.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Commuting {

	private int commutingNo;
	private Employee employeeNo;
	private String commutingGoWorkTime;
	private String commutingLeaveWorkTime;
	private String commutingStatus;
}