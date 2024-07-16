package com.project.hot.hr.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.hot.employee.model.dto.Employee;
import com.project.hot.employee.model.service.EmployeeService;
import com.project.hot.hr.model.dto.RequestDepartment;
import com.project.hot.hr.model.service.HRService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/hr")
public class HRController {

	private final HRService HRService;
	private final EmployeeService empService;

	@GetMapping("/departmentList")
	public Map<String, Object> selectDepartmentForHR(
			@RequestParam(defaultValue="1")int cPage
			, @RequestParam(defaultValue="") String departmentTitle){
		Map<String, Object> param=new HashMap<>();
		param.put("cPage", cPage);
		param.put("numPerpage", 10);
		param.put("departmentTitle", departmentTitle.equals("부서전체")?"":departmentTitle);
		Map<String, Object> result=HRService.selectDepartmentListForHR(param);
		return result;
	}

	@PostMapping("/insertDepartment")
	public String insertDepartment(@RequestBody RequestDepartment rd) {
		int result=HRService.insertDepartment(rd);
		if(result>0) {
			return "부서등록 성공!";
		}else {
			return "부서등록 실패!";
		}
	}

	@PostMapping("/updateDepartment")
	public String updateDepartment(@RequestBody RequestDepartment rd) {
		int result=HRService.updateDepartment(rd);
		if(result>0) {
			return "부서 수정 성공!";
		}else {
			return "부서 수정 실패!";
		}
	}

	@PostMapping("/deleteDepartment")
	public String deleteDepartment(@RequestBody RequestDepartment rd) {
		int result=HRService.deleteDepartment(rd);
		if(result>0) {
			return "부서 삭제 성공!";
		}else {
			return "부서 삭제 실패!";
		}
	}

	@GetMapping("/getEmployeeList")
	public Map<String,Object> getEmployeeList(){
		Map<String, Object> param=new HashMap<>();
		Map<String, Object> result=empService.selectEmployeeList(param);
		return result;
	}
}
