package com.zl.dao;

import java.util.List;

import com.zl.pojo.Emp;
import com.zl.pojo.FenYe;
import com.zl.pojo.FenYe2;
import com.zl.pojo.Query2;


public interface EmpMapper {
	/**
	 * 插入职员信息
	 */
	public int insertEmp(Emp emp);
	/**
	 * 登陆
	 */
	public Emp empLog(Emp emp);
	/**
	 * 查询个人信息
	 */
	public Emp findEmp(Integer eId);
	/**
	 * 修改
	 */
	public int updateEmp(Emp emp);
	/**
	 * 审核
	 */
	public int go(Integer isGo,Integer EmpId);
	/**
	 * 查询该部门职员
	 */
	public List<Emp> findEmpBydId(Integer dId); 
	/**
	 * 分页
	 */
	public List<Emp> queryEmpByFy(FenYe2 fy);
	public Integer queryRowCount2(Query2 query2);
	
	
	public List<Emp> queryManagers(FenYe2 fy);
	public Integer queryRowCount3(Query2 query2);
	
	public Integer findName (String empName);
	
	public int upEmp(Emp emp);
	
}
