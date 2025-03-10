package com.project.hot.community.model.dto;

import com.project.hot.employee.model.dto.Employee;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CommunityUser {
    private int employeeNo;
    private int communityNo;
    private String communityUserIsAccept;
    private String communityUserBookmark;
    private Employee employee;
}
