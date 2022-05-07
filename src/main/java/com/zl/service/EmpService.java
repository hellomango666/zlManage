package com.zl.service;

import java.util.List;

import com.zl.pojo.Emp;
import com.zl.pojo.FenYe;
import com.zl.pojo.FenYe2;
import com.zl.pojo.Query2;


public interface EmpService {
	/**
	 * ����ְԱ��Ϣ
	 */
	public int insertEmp(Emp emp);
	/**
	 * ��½
	 */
	public Emp empLog(Emp emp);
	/**
	 * ��ѯ������Ϣ
	 */
	public Emp findEmp(Integer eId);
	/**
	 * �޸�
	 */
	public int updateEmp(Emp emp);
	/**
	 * ���
	 */
	public int go(Integer isGo,Integer EmpId);
	/**
	 * ��ѯ�ò���ְԱ
	 */
	public List<Emp> findEmpBydId(Integer dId); 
	/**
	 * ��ҳ
	 */
	public List<Emp> queryEmpByFy(FenYe2 fy);
	public Integer queryRowCount2(Query2 query2);
	
	
	public int findName (String empName);
	
	public int upEmp(Emp emp);
	
	public List<Emp> queryManagers(FenYe2 fy);
	public Integer queryRowCount3(Query2 query2);
	
}
