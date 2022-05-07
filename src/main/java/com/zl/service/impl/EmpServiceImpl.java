package com.zl.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zl.dao.EmpMapper;
import com.zl.pojo.Emp;
import com.zl.pojo.FenYe;
import com.zl.pojo.FenYe2;
import com.zl.pojo.Query2;
import com.zl.service.EmpService;
@Service
public class EmpServiceImpl implements EmpService {
	@Autowired
	private EmpMapper em;

	@Override
	public int insertEmp(Emp emp) {
		return em.insertEmp(emp);
	}

	@Override
	public Emp empLog(Emp emp) {
		return em.empLog(emp);
	}

	@Override
	public Emp findEmp(Integer eId) {
		return em.findEmp(eId);
	}

	@Override
	public int updateEmp(Emp emp) {
		return em.updateEmp(emp);
	}

	@Override
	public int go(Integer isGo, Integer EmpId) {
		return em.go(isGo, EmpId);
	}

	@Override
	public List<Emp> findEmpBydId(Integer dId) {
		return em.findEmpBydId(dId);
	}



	@Override
	public int findName(String empName) {
		return em.findName(empName);
	}

	@Override
	public List<Emp> queryEmpByFy(FenYe2 fy) {
		 if(fy.getPage()==null || fy.getPage()==0) {
			 fy.setPage(1);
		 }
		 fy.setRowCount(this.queryRowCount2(fy.getQuery2()));
		 return em.queryEmpByFy(fy);
	}

	@Override
	public Integer queryRowCount2(Query2 query2) {
		return em.queryRowCount2(query2) ;
	}

	@Override
	public int upEmp(Emp emp) {
		return em.upEmp(emp);
	}

	@Override
	public List<Emp> queryManagers(FenYe2 fy) {
		if(fy.getPage()==null || fy.getPage()==0) {
			 fy.setPage(1);
		 }
		 fy.setRowCount(this.queryRowCount3(fy.getQuery2()));
		 return em.queryManagers(fy);
	}

	@Override
	public Integer queryRowCount3(Query2 query2) {
		return em.queryRowCount3(query2);
	}

}
