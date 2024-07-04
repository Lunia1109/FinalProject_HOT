package com.project.hot.employee.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.hot.employee.model.dto.Employee;

@Repository
public class EmployeeDaoImpl implements EmployeeDao {

	@Override
	public Employee selectEmployeeById(SqlSession session, String id) {
		return session.selectOne("employee.selectEmployeeById", id);
	}

	@Override
	public List<Employee> selectEmployees(SqlSession session, Map<String, Object> param) {
		return session.selectList("employee.selectEmployees", param,
				new RowBounds(((int)param.get("cPage")-1)*(int)param.get("numPerpage"), (int)param.get("numPerpage")));
	}

	@Override
	public int countEmployeeTotalData(SqlSession session) {
		return session.selectOne("employee.countEmployeeTotalData");
	}

}