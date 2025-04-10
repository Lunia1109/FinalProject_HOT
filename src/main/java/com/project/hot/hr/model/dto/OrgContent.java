package com.project.hot.hr.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OrgContent {
	private String url;
	private String name;
	private String pos;
	private String dept;
	private int deptCode;
}
